/*
该文件用于车模赛道循迹控制

API：
****用户****
赛道循迹控制初始化
循迹控制
循迹PID参数结构体初始化
************

****底层****
路径线扫描
循迹PID
************
*/

#include "common.h"

/* 赛道循迹控制初始化 */
void path_control_init(void)
{
	mt9v03x_init();
	path_pid = path_control_pid_init();
}

/* 路径线提取 */
void path_extract(void)
{
	int16 x,y;
	static int16 num = 0;
	if(num < 10)
	{
		path[0][0] = MT9V03X_W/2;
		num++;
	}
	else
	{
		path[0][0] = path[prediction_point][0];
	}
	path[0][1] = MT9V03X_H-1-path_start;
	for(y = MT9V03X_H-1-path_start-1;y >= MT9V03X_H-1-path_end;y--)
	{
		for(x = path[MT9V03X_H-1-path_start-y-1][0];x < MT9V03X_W;x++)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[MT9V03X_H-1-path_start-y][0] = x;
				break;
			}
			if(x == MT9V03X_W-1)
			{
				path[MT9V03X_H-1-path_start-y][0] = x;
			}
		}
		for(x = path[MT9V03X_H-1-path_start-y-1][0];x >= 0;x--)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[MT9V03X_H-1-path_start-y][0] += x;
				break;
			}
			if(x == 0)
			{
				path[MT9V03X_H-1-path_start-y][0] += x;
			}
		}
		path[MT9V03X_H-1-path_start-y][0] = path[MT9V03X_H-1-path_start-y][0]/2;
		path[MT9V03X_H-1-path_start-y][1] = y;
	}
}

/* 边线线提取 */
void side_extract(void)
{
    // 图像中点
    static int midX = MT9V03X_W/2;
    // 八临域寻线变量设置
    int seed_grow_dir[8][4] = {{0,1,0,1},{1,1,-1,1},{1,0,-1,0},{1,-1,-1,-1},{0,-1,0,-1},{-1,-1,1,-1},{-1,0,1,0},{-1,1,1,1}};    // 种子X,Y方向的生长向量：从正下方逆时针 和 从正下方顺时针 
    int grow_dir_idx = 0;
    // 初始化
    L_side_point_num = 0;
    R_side_point_num = 0;
    memset(L_side, 0, sizeof(L_side));
    memset(R_side, 0, sizeof(R_side));

    // 寻找种子起点
    // 左边线种子
    for(int X = midX;X >= 0;X--)
    {
        if(image_OTSU[SIDE_EXTRACT_START_Y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0][0] = X+1;
            L_side[0][1] = SIDE_EXTRACT_START_Y-1;
			ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            L_side[0][0] = 0;
            L_side[0][1] = SIDE_EXTRACT_START_Y-1;
			ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
    }
    // 右边线种子
    for(int X = midX;X <= MT9V03X_W-1;X++)
    {
        if(image_OTSU[SIDE_EXTRACT_START_Y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0][0] = X-1;
            R_side[0][1] = SIDE_EXTRACT_START_Y-1;
			ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            R_side[0][0] = MT9V03X_W-1;
            R_side[0][1] = SIDE_EXTRACT_START_Y-1;
			ips200_draw_point(R_side[0][0], R_side[0][1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
    }

    // 更新midX
    midX = (L_side[0][0] + R_side[0][0])/2;

    // 爬线
    // 左边线
    while(true)
    {
        // 点在边线内
        if(L_side[L_side_point_num][0] < MT9V03X_W-1 && L_side[L_side_point_num][0] > 0)
        {   
            // 是否越界
            if(L_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if(image_OTSU[L_side[L_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][1]][L_side[L_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][0]] == 0 && 
                image_OTSU[L_side[L_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][1]][L_side[L_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][0]] == 255)
            {
                // 下一个点
                L_side[L_side_point_num+1][0] = L_side[L_side_point_num][0]+seed_grow_dir[grow_dir_idx][0];
                L_side[L_side_point_num+1][1] = L_side[L_side_point_num][1]+seed_grow_dir[grow_dir_idx][1];
                L_side_point_num+=1;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        // 点在边线上
        else if(grow_dir_idx <= 4)
        {
            // 是否越界
            if(L_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if( (grow_dir_idx <= 3 && image_OTSU[L_side[L_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][1]][L_side[L_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][0]] == 0 && 
                image_OTSU[L_side[L_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][1]][L_side[L_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][0]] == 255) || 
                (grow_dir_idx == 4 && image_OTSU[L_side[L_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][1]][L_side[L_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][0]] == 255))
            {
                // 下一个点
                L_side[L_side_point_num+1][0] = L_side[L_side_point_num][0]+seed_grow_dir[grow_dir_idx][0];
                L_side[L_side_point_num+1][1] = L_side[L_side_point_num][1]+seed_grow_dir[grow_dir_idx][1];
                L_side_point_num+=1;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        else
            break;
		// ips200_draw_point(L_side[L_side_point_num][0], L_side[L_side_point_num][1]+MT9V03X_H*2, RGB565_RED);
        // 索引是否越界
        if(grow_dir_idx >= 8)
            break;
        if(L_side[L_side_point_num][1] < SIDE_EXTRACT_END_Y)
            break;
    }
    grow_dir_idx = 0;
    // 右边线
    while(true)
    {
        // 点在边线内
        if(R_side[R_side_point_num][0] < MT9V03X_W-1 && R_side[R_side_point_num][0] > 0)
        {   
            // 是否越界
            if(R_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if(image_OTSU[R_side[R_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][3]][R_side[R_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][2]] == 0 && 
                image_OTSU[R_side[R_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][3]][R_side[R_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][2]] == 255)
            {
                // 下一个点
                R_side[R_side_point_num+1][0] = R_side[R_side_point_num][0]+seed_grow_dir[grow_dir_idx][2];
                R_side[R_side_point_num+1][1] = R_side[R_side_point_num][1]+seed_grow_dir[grow_dir_idx][3];
                R_side_point_num+=1;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        // 点在边线上
        else if(grow_dir_idx <= 4)
        {
            // 是否越界
            if(R_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if( (grow_dir_idx <= 3 && image_OTSU[R_side[R_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][3]][R_side[R_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][2]] == 0 && 
                image_OTSU[R_side[R_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][3]][R_side[R_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][2]] == 255) || 
                (grow_dir_idx == 4 && image_OTSU[R_side[R_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][3]][R_side[R_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][2]] == 255))
            {
                // 下一个点
                R_side[R_side_point_num+1][0] = R_side[R_side_point_num][0]+seed_grow_dir[grow_dir_idx][2];
                R_side[R_side_point_num+1][1] = R_side[R_side_point_num][1]+seed_grow_dir[grow_dir_idx][3];
                R_side_point_num+=1;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        else
            break;
		// ips200_draw_point(R_side[R_side_point_num][0], R_side[R_side_point_num][1]+MT9V03X_H*2, RGB565_RED);
        // 索引是否越界
        if(grow_dir_idx >= 8)
            break;
        if(R_side[R_side_point_num][1] < SIDE_EXTRACT_END_Y)
            break;
    }
}

/* 边线点类型判断 */
void side_point_kind_judge(void)
{
    int i;
    int vector[2][4] = {0}; // 左右拐点与上下两点构成的向量坐标
    int vectorScalarProduct[2] = {0};  // 左右拐点向量点乘
    double vectorModule[4] = {0};   // 左右拐点向量的模
    double vectorAngle[2] = {0}; // 左右拐点向量夹角(角度制)

    // 初始化
    L_inflection_point_num = 0;
    R_inflection_point_num = 0;
    memset(L_inflection_point, 0, sizeof(L_inflection_point));
    memset(R_inflection_point, 0, sizeof(R_inflection_point));
    L_bend_point_num = 0;
    R_bend_point_num = 0;
    memset(L_bend_point, 0, sizeof(L_bend_point));
    memset(R_bend_point, 0, sizeof(R_bend_point));

    // 寻拐点范围
    // 左边线拐点
    for(i = POINT_DISTANCE;i <= L_side_point_num-1-POINT_DISTANCE;)
    {
        // 左边线第一个向量
        vector[0][0] = L_side[i-POINT_DISTANCE][0]-L_side[i][0];
        vector[0][1] = L_side[i-POINT_DISTANCE][1]-L_side[i][1];
        // 左边线第二个向量
        vector[1][0] = L_side[i+POINT_DISTANCE][0]-L_side[i][0];
        vector[1][1] = L_side[i+POINT_DISTANCE][1]-L_side[i][1];

        // 计算中断点向量点乘
        vectorScalarProduct[0] = vector[0][0]*vector[1][0]+vector[0][1]*vector[1][1];

        // 计算拐点向量的模
        vectorModule[0] = sqrt(pow(vector[0][0],2)+pow(vector[0][1],2));
        vectorModule[1] = sqrt(pow(vector[1][0],2)+pow(vector[1][1],2));
    
        if( vectorModule[0]*vectorModule[1] != 0)
        {
            vectorAngle[0] = acos(vectorScalarProduct[0]/(vectorModule[0]*vectorModule[1]))*(180/PI);    // 左边线断点向量夹角
        }

        // 计算拐点并存储坐标，前提：拐点坐标不再边框上
        if(abs(vectorAngle[0]) > INFLECTION_POINT_ANGLE_MIN && abs(vectorAngle[0]) < INFLECTION_POINT_ANGLE_MAX && L_side[i][0] < MT9V03X_W-11 && (vector[0][0]+vector[1][0]) < 0)
        {
            //  cout << abs(AngleVector[0]) << endl;
            L_inflection_point[L_inflection_point_num][0] = L_side[i][0];
            L_inflection_point[L_inflection_point_num][1] = L_side[i][1];
            if(L_inflection_point_num < MT9V03X_H*2-1)	/************************注意***************************/
                L_inflection_point_num++;
            else
                break;
            if(i < L_side_point_num-2-POINT_DISTANCE-SKIP_POINT_DISTANCE)
                i = i+SKIP_POINT_DISTANCE;
            else
                break;
        }
        else if(abs(vectorAngle[0]) > BEND_POINT_ANGLE_MIN && abs(vectorAngle[0]) < BEND_POINT_ANGLE_MAX)
        {
            //  cout << abs(AngleVector[0]) << endl;
            L_bend_point[L_bend_point_num][0] = L_side[i][0];
            L_bend_point[L_bend_point_num][1] = L_side[i][1];
            if(L_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
                L_bend_point_num++;
            else
                break;
        }
        i++;
    }
    // 右边线拐点
    for(i = POINT_DISTANCE;i <= R_side_point_num-1-POINT_DISTANCE;)
    {
        // 左边线第一个向量
        vector[0][2] = R_side[i-POINT_DISTANCE][0]-R_side[i][0];
        vector[0][3] = R_side[i-POINT_DISTANCE][1]-R_side[i][1];
        // 左边线第二个向量
        vector[1][2] = R_side[i+POINT_DISTANCE][0]-R_side[i][0];
        vector[1][3] = R_side[i+POINT_DISTANCE][1]-R_side[i][1];

        // 计算中断点向量点乘
        vectorScalarProduct[1] = vector[0][2]*vector[1][2]+vector[0][3]*vector[1][3];

        // 计算拐点向量的模
        vectorModule[2] = sqrt(pow(vector[0][2],2)+pow(vector[0][3],2));
        vectorModule[3] = sqrt(pow(vector[1][2],2)+pow(vector[1][3],2));
    
        if( vectorModule[2]*vectorModule[3] != 0)
        {
            vectorAngle[1] = acos(vectorScalarProduct[1]/(vectorModule[2]*vectorModule[3]))*(180/PI);    // 左边线断点向量夹角
        }

        // 计算拐点并存储坐标，前提：拐点坐标不再边框上
        if(abs(vectorAngle[1]) > INFLECTION_POINT_ANGLE_MIN && abs(vectorAngle[1]) < INFLECTION_POINT_ANGLE_MAX && R_side[i][0] > 10 && (vector[0][2]+vector[1][2]) > 0)
        {
            //  cout << abs(AngleVector[0]) << endl;
            R_inflection_point[R_inflection_point_num][0] = R_side[i][0];
            R_inflection_point[R_inflection_point_num][1] = R_side[i][1];
            if(R_inflection_point_num < MT9V03X_H*2-1)	/************************注意***************************/
                R_inflection_point_num++;
            else
                break;
            if(i < R_side_point_num-2-POINT_DISTANCE-SKIP_POINT_DISTANCE)
                i = i+SKIP_POINT_DISTANCE;
            else
                break;
        }
        else if(abs(vectorAngle[1]) > BEND_POINT_ANGLE_MIN && abs(vectorAngle[1]) < BEND_POINT_ANGLE_MAX)
        {
            //  cout << abs(AngleVector[0]) << endl;
            R_bend_point[R_bend_point_num][0] = R_side[i][0];
            R_bend_point[R_bend_point_num][1] = R_side[i][1];
            if(R_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
                R_bend_point_num++;	
            else
                break;
        }
        i++;
    }
}

/* 元素判断 */
void element_judge(void)
{
	if(L_inflection_point_num >= 2 && R_inflection_point_num >= 2)
	{
		line_draw(L_inflection_point[0][0], L_inflection_point[0][1], L_inflection_point[1][0], L_inflection_point[1][1]);
		line_draw(R_inflection_point[0][0], R_inflection_point[0][1], R_inflection_point[1][0], R_inflection_point[1][1]);
		line_draw(L_inflection_point[0][0], L_inflection_point[0][1], 0, MT9V03X_H-1);
		line_draw(R_inflection_point[0][0], R_inflection_point[0][1], MT9V03X_W-1, MT9V03X_H-1);
	}
	else if(L_inflection_point_num == 1 && R_inflection_point_num >= 2)
	{
		if(R_inflection_point[1][0]-TRACK_WIDTH >= 0)
		{
			line_draw(L_inflection_point[0][0], L_inflection_point[0][1], R_inflection_point[1][0]-TRACK_WIDTH, R_inflection_point[1][1]);
			line_draw(R_inflection_point[0][0], R_inflection_point[0][1], R_inflection_point[1][0], R_inflection_point[1][1]);
			line_draw(L_inflection_point[0][0], L_inflection_point[0][1], 0, MT9V03X_H-1);
			line_draw(R_inflection_point[0][0], R_inflection_point[0][1], MT9V03X_W-1, MT9V03X_H-1);
		}
	}
	else if(L_inflection_point_num >= 2 && R_inflection_point_num == 1)
	{
		if(L_inflection_point[1][0]+TRACK_WIDTH < MT9V03X_W)
		{
			line_draw(L_inflection_point[0][0], L_inflection_point[0][1], L_inflection_point[1][0], L_inflection_point[1][1]);
			line_draw(R_inflection_point[0][0], R_inflection_point[0][1], L_inflection_point[1][0]+TRACK_WIDTH, L_inflection_point[1][1]);
			line_draw(L_inflection_point[0][0], L_inflection_point[0][1], 0, MT9V03X_H-1);
			line_draw(R_inflection_point[0][0], R_inflection_point[0][1], MT9V03X_W-1, MT9V03X_H-1);
		}
	}
	else if(L_inflection_point_num == 1 && R_inflection_point_num == 1)
	{
		line_draw(L_inflection_point[0][0], L_inflection_point[0][1], MT9V03X_W/2-TRACK_WIDTH/2, 0);
		line_draw(R_inflection_point[0][0], R_inflection_point[0][1], MT9V03X_W/2+TRACK_WIDTH/2, 0);
		line_draw(L_inflection_point[0][0], L_inflection_point[0][1], 0, MT9V03X_H-1);
		line_draw(R_inflection_point[0][0], R_inflection_point[0][1], MT9V03X_W-1, MT9V03X_H-1);
	}
	else if(L_inflection_point_num == 0 && R_inflection_point_num == 1)
	{
		/* R_CIRCLE */
	}
	else if(L_inflection_point_num == 1 && R_inflection_point_num == 0)
	{
		/* L_CIRCLE */
	}
}

/* 循迹控制 */
void path_control(float path_control_speed)
{
	chassis_motion_flag = CHASSIS_MOVE;
	path_err = path[control_point-path_start][0] - MT9V03X_W/2;
	if(abs(path_err) > 15)
	{
		chassis_yaw = 0;
		chassis_angular_speed = path_control_pid(PATH_PID_KIND,path_pid,path_err);
	}
	else
	{
		chassis_yaw = 1.2*path_err;
		chassis_angular_speed = 0;
	}
	chassis_linear_speed = path_control_speed;
}

/* 循迹PID参数结构体初始化 */
_PATH_PID_ path_control_pid_init(void)
{
	static _PATH_PID_ path_pid;

	// 循迹 PID
	for(uint8 i = 0;i < 3; i++)
	{
		path_pid.path_pid_parameters[i].p = PATH_PID[i][0];
		path_pid.path_pid_parameters[i].i = PATH_PID[i][1];
		path_pid.path_pid_parameters[i].d = PATH_PID[i][2];
		path_pid.path_pid_parameters[i].output_limit = PATH_PID[i][4];
		path_pid.path_pid_parameters[i].i_limit = PATH_PID[i][5];
	}
	path_pid.path_pid_variable.now_err =  0;
	path_pid.path_pid_variable.last_err =  0;
	path_pid.path_pid_variable.last_last_err =  0;
	
	return path_pid;
}

/* 循迹PID */
float path_control_pid(float (*FUNC_PATH)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),_PATH_PID_ path_pid,int16 path_err)
{
	float gyro_now_err,value;
	static float gyro_last_err = 0;
	gyro_now_err = GYRO_Z_FORWARD*gyro_z;
	if(abs(path_err) > 15 && abs(path_err) < 25)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[0]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[0][3]*(gyro_now_err-gyro_last_err);
	}
	else if(abs(path_err) >= 25 && abs(path_err) < 40)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[1]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[1][3]*(gyro_now_err-gyro_last_err);
	}
	else
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[2]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[2][3]*(gyro_now_err-gyro_last_err);
	}
	gyro_last_err = gyro_now_err;
	
	return value;
}	

