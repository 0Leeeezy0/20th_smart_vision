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
	unpivot_init();
	path_pid = path_control_pid_init();
}

/* 最长白列 */
void longest_white_col(void)
{
	int L_side[2];
	int R_side[2];
	
	int max_white_num = 0;				// 最长白列白色像素数量
	int longest_white_X = 0;			// 最长白列横坐标
	int longest_white_X_cache = 0;		// 最长白列横坐标缓存
	int max_white_col_num = 0;			// 最长白列数量
	int max_white_col_num_cache = 0;	// 最长白列数量缓存
	uint8 max_white_col_find_flag = 0;		// 找到最长白列标志位
	
	for(int X = mid_x;X >= 0;X--)
    {
        if(image_OTSU[path_start-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0] = X+1;
            L_side[1] = path_start-1;
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            L_side[0] = 0;
            L_side[1] = path_start-1;
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
			L_frame_point_num++;
            break;
        }
    }
    // 右边线种子
    for(int X = mid_x;X <= MT9V03X_W-1;X++)
    {
        if(image_OTSU[path_start-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0] = X-1;
            R_side[1] = path_start-1;
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            R_side[0] = MT9V03X_W-1;
            R_side[1] = path_start-1;
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
			R_frame_point_num++;
            break;
        }
    }
	
	// 更新mid_x
    mid_x = (L_side[0] + R_side[0])/2;
	
	for(int X = L_side[0];X <= R_side[0];X++)
	{
		for(int Y = path_start;Y >= path_start-control_point[path_follow_kind_flag];Y--)
		{
			if(image_OTSU[Y][X] == 0 || Y == path_start-control_point[path_follow_kind_flag])
			{
				// 有更长的白列则刷新
				if(path_start-Y > max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = path_start-Y;
					longest_white_X_cache = 0;
					max_white_col_num_cache = 0;
					longest_white_X_cache +=  X;
					max_white_col_num_cache++;
				}
				// 一样长的白列则自增
				else if(path_start-Y == max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = path_start-Y;
					longest_white_X_cache += X;
					max_white_col_num_cache++;
				}
				// 更短的白列，忽略
				else
				{
					max_white_col_find_flag = 0;
					if(max_white_col_num_cache > max_white_col_num)
					{
						max_white_col_num = max_white_col_num_cache;
						longest_white_X = longest_white_X_cache;
						max_white_col_num_cache = 0;
						longest_white_X_cache = 0;
					}	
				}
				break;
			}
		}
	}
	if(max_white_col_num_cache > max_white_col_num)
	{
		max_white_col_num = max_white_col_num_cache;
		longest_white_X = longest_white_X_cache;
	}	
	if(max_white_col_num != 0)
		longest_white_col_x = longest_white_X/max_white_col_num;
	if(longest_white_col_x <= 0)
		longest_white_col_x = 0;
	else if(longest_white_col_x >= MT9V03X_W-1)
		longest_white_col_x = MT9V03X_W-1;
}

/* 路径线提取 */
void path_extract(void)
{
	int16 x,y;
	static int16 mid_x_flag = 0;
	if(mid_x == MT9V03X_W/2)
		mid_x_flag = 0;
	if(mid_x_flag < 10)
	{
		path[0][0] = MT9V03X_W/2;
		mid_x_flag++;
	}
	else
	{
		path[0][0] = path[prediction_point][0];
	}
	path[0][1] = path_start;
	for(y = path_start-1;y >= path_end;y--)
	{
		// 右边线
		for(x = path[path_start-1-y][0];x < MT9V03X_W;x++)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[path_start-y][0] = x;
				break;
			}
			if(x == MT9V03X_W-1)
			{
				path[path_start-y][0] = x;
			}
		}
		// 左边线
		for(x = path[path_start-1-y][0];x >= 0;x--)
		{
			if(image_OTSU[y][x] == 0)
			{
				path_width[path_start-y] = path[path_start-y][0]-x;
				path[path_start-y][0] += x;
				break;
			}
			if(x == 0)
			{
				path_width[path_start-y] = path[path_start-y][0]-x;
				path[path_start-y][0] += x;
			}
		}
		path[path_start-y][0] = path[path_start-y][0]/2;
		path[path_start-y][1] = y;
//		ips200_draw_point(path[path_start-y][0], MT9V03X_H+MENU_ROW_PITCH+path[path_start-y][1], RGB565_RED);
	}
}

/* 边线线提取 */
void side_extract(void)
{
    // 八临域寻线变量设置
    int seed_grow_dir[8][4] = {{0,1,0,1},{1,1,-1,1},{1,0,-1,0},{1,-1,-1,-1},{0,-1,0,-1},{-1,-1,1,-1},{-1,0,1,0},{-1,1,1,1}};    // 种子X,Y方向的生长向量：从正下方逆时针 和 从正下方顺时针 
    int grow_dir_idx = 0;
    // 初始化
    L_side_point_num = 0;
    R_side_point_num = 0;
	L_frame_point_num = 0;
	R_frame_point_num = 0;
    R_side_point_num = 0;
    memset(L_side, 0, sizeof(L_side));
    memset(R_side, 0, sizeof(R_side));

    // 寻找种子起点
    // 左边线种子
    for(int X = mid_x;X >= 0;X--)
    {
        if(image_OTSU[side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0][0] = X+1;
            L_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            L_side[0][0] = 0;
            L_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
			L_frame_point_num++;
            break;
        }
    }
    // 右边线种子
    for(int X = mid_x;X <= MT9V03X_W-1;X++)
    {
        if(image_OTSU[side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0][0] = X-1;
            R_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            R_side[0][0] = MT9V03X_W-1;
            R_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(R_side[0][0], R_side[0][1]+MT9V03X_H*2, RGB565_RED);
			R_frame_point_num++;
            break;
        }
    }

    // 更新mid_x
    mid_x = (L_side[0][0] + R_side[0][0])/2;

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
				L_frame_point_num++;
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
        if(L_side[L_side_point_num][1] < side_extract_end_y)
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
				R_frame_point_num++;
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
        if(R_side[R_side_point_num][1] < side_extract_end_y)
            break;
    }
}

/* 边线点类型判断 */
void side_point_kind_judge(void)
{
    int i;
    int vector[2][4] = {0}; // 左右拐点与上下两点构成的向量坐标
    double vectorScalarProduct[2] = {0};  // 左右拐点向量点乘
    double vectorModule[4] = {0};   // 左右拐点向量的模
    double vectorAngle[2] = {0}; // 左右拐点向量夹角(角度制)

    // 初始化
    L_bend_point_num = 0;
    R_bend_point_num = 0;
    memset(L_bend_point, 0, sizeof(L_bend_point));
    memset(R_bend_point, 0, sizeof(R_bend_point));

    // 寻弯点范围
    // 左边线弯点
    for(i = POINT_DISTANCE;i <= L_side_point_num-1-POINT_DISTANCE;)
    {
		// 不对边框处的边线进行弯点识别
		if(L_side[i-POINT_DISTANCE][0] != 0 && L_side[i][0] != 0 && L_side[i+POINT_DISTANCE][0] != 0)
		{
			// 左边线第一个向量
			vector[0][0] = (double)(L_side[i-POINT_DISTANCE][0]-L_side[i][0]);
			vector[0][1] = (double)(L_side[i-POINT_DISTANCE][1]-L_side[i][1]);
			// 左边线第二个向量
			vector[1][0] = (double)(L_side[i+POINT_DISTANCE][0]-L_side[i][0]);
			vector[1][1] = (double)(L_side[i+POINT_DISTANCE][1]-L_side[i][1]);

			// 计算中断点向量点乘
			vectorScalarProduct[0] = (double)(vector[0][0]*vector[1][0]+vector[0][1]*vector[1][1]);

			// 计算拐点向量的模
			vectorModule[0] = sqrt(pow(vector[0][0],2)+pow(vector[0][1],2));
			vectorModule[1] = sqrt(pow(vector[1][0],2)+pow(vector[1][1],2));

			if( vectorModule[0]*vectorModule[1] != 0)
			{
				vectorAngle[0] = acos(vectorScalarProduct[0]/(vectorModule[0]*vectorModule[1]))*(180.0/PI);    // 左边线断点向量夹角
			}

			// 计算弯点并存储坐标，前提：弯点坐标不再边框上
			if(abs(vectorAngle[0]) > BEND_POINT_ANGLE_MIN && abs(vectorAngle[0]) < BEND_POINT_ANGLE_MAX)
			{
				//  cout << abs(AngleVector[0]) << endl;
				L_bend_point[L_bend_point_num][0] = L_side[i][0];
				L_bend_point[L_bend_point_num][1] = L_side[i][1];
				if(L_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
					L_bend_point_num++;
				else
					break;
			}
		}
		i++;
    }
    // 右边线弯点
    for(i = POINT_DISTANCE;i <= R_side_point_num-1-POINT_DISTANCE;)
    {
		// 不对边框处的边线进行弯点识别
		if(R_side[i-POINT_DISTANCE][0] != MT9V03X_W-1 && R_side[i][0] != MT9V03X_W-1 && R_side[i+POINT_DISTANCE][0] != MT9V03X_W-1)
		{
			// 左边线第一个向量
			vector[0][2] = (double)(R_side[i-POINT_DISTANCE][0]-R_side[i][0]);
			vector[0][3] = (double)(R_side[i-POINT_DISTANCE][1]-R_side[i][1]);
			// 左边线第二个向量
			vector[1][2] = (double)(R_side[i+POINT_DISTANCE][0]-R_side[i][0]);
			vector[1][3] = (double)(R_side[i+POINT_DISTANCE][1]-R_side[i][1]);

			// 计算中断点向量点乘
			vectorScalarProduct[1] = (double)(vector[0][2]*vector[1][2]+vector[0][3]*vector[1][3]);

			// 计算拐点向量的模
			vectorModule[2] = sqrt(pow(vector[0][2],2)+pow(vector[0][3],2));
			vectorModule[3] = sqrt(pow(vector[1][2],2)+pow(vector[1][3],2));
		
			if( vectorModule[2]*vectorModule[3] != 0)
			{
				vectorAngle[1] = acos(vectorScalarProduct[1]/(vectorModule[2]*vectorModule[3]))*(180.0/PI);    // 左边线断点向量夹角
			}

			// 计算弯点并存储坐标，前提：弯点坐标不再边框上
			if(abs(vectorAngle[1]) > BEND_POINT_ANGLE_MIN && abs(vectorAngle[1]) < BEND_POINT_ANGLE_MAX)
			{
				//  cout << abs(AngleVector[0]) << endl;
				R_bend_point[R_bend_point_num][0] = R_side[i][0];
				R_bend_point[R_bend_point_num][1] = R_side[i][1];
				if(R_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
					R_bend_point_num++;	
				else
					break;
			}
		}
		i++;
    }
}

/* 圆环判断 */
void circle_path_element_judge(void)
{
	int circle_check[2] = {0};	// 圆环
	
	int16 L_side_X_delta_max = 0;	// 左边线X最大差值
	int16 R_side_X_delta_max = 0;	// 右边线X最大差值
	
	// 圆环检测线
    // 左边线
    for(int X = mid_x;X >= 0;X--)
    {
        if(image_OTSU[circle_check_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            circle_check[0] = X+1;
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            circle_check[0] = 0;
            break;
        }
    }
    // 右边线
    for(int X = mid_x;X <= MT9V03X_W-1;X++)
    {
        if(image_OTSU[circle_check_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            circle_check[1] = X-1;
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            circle_check[1] = MT9V03X_W-1;
            break;
        }
    }
	
	// 左右边线最大差值计算
	for(int num = 1;num < path_start-path_end;num++)
	{
		// 右
		if(abs((path[num+1][0]+path_width[num+1]/2)-(path[num][0]+path_width[num]/2)) >= R_side_X_delta_max)
		{
			R_side_X_delta_max = abs((path[num+1][0]+path_width[num+1]/2)-(path[num][0]+path_width[num]/2));
		}
		// 左
		if(abs((path[num+1][0]-path_width[num+1]/2)-(path[num][0]-path_width[num]/2)) >= L_side_X_delta_max)
		{
			L_side_X_delta_max = abs((path[num+1][0]-path_width[num+1]/2)-(path[num][0]-path_width[num]/2));
		}
	}
	
	
	
	// 右圆环入环
	// 边线左右起始点距离在圆环阈值内
	if(circle_check[1] == MT9V03X_W-1 && L_bend_point_num <= 3 && ((float)L_frame_point_num/(float)L_side_point_num) <= 0.15 &&  L_side_X_delta_max <= side_X_delta_limit[1] && R_side_X_delta_max >= side_X_delta_limit[0] && (path_element_flag == STRIGHT_PATH || path_element_flag == BEND_PATH))
	{
		circle_in_flag++;
		if(circle_in_flag >= 5 && circle_out_time_count >= 1000)
		{
			pwm_init(BUZZER_PIN, 1400, PWM_DUTY_MAX / 2);
			path_element_flag = R_CIRCLE_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,circle_in_angular_speed_target,circle_in_angle,0); 			// 旋转进环
			circle_in_flag = 0;
			circle_in_time_count_flag = TRUE;
			circle_out_time_count_flag = FALSE;
			speed_control_time_count_flag = FALSE;
			pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
			path_follow_kind_flag = 1;
		}
			
	}
	else if(circle_check[1] == MT9V03X_W-1 && path_element_flag == R_CIRCLE_PATH) // && circle_check[0] == 0
	{
		circle_out_flag++;
		if(circle_out_flag >= 1 && circle_in_time_count >= 1000 && circle_in_time_count < 19000)
		{
			pwm_init(BUZZER_PIN, 1400, PWM_DUTY_MAX / 2);
			path_element_flag = BEND_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,circle_in_angular_speed_target,circle_out_angle,0); 			// 旋转出环
			circle_in_flag = 0;
			circle_out_flag = 0;
			circle_in_time_count_flag = FALSE;
			circle_out_time_count_flag = TRUE;
			speed_control_time_count_flag = TRUE;
			pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
			path_follow_kind_flag = 0;
		}
	}
	// 左圆环入环
	// 边线左右起始点距离在圆环阈值内
	else if(circle_check[0] == 0 && R_bend_point_num <= 3 && ((float)R_frame_point_num/(float)R_side_point_num) <= 0.15 && R_side_X_delta_max <= side_X_delta_limit[1] && L_side_X_delta_max >= side_X_delta_limit[0] && (path_element_flag == STRIGHT_PATH || path_element_flag == BEND_PATH))
	{
		circle_in_flag++;
		if(circle_in_flag >= 5 && circle_out_time_count >= 1000)
		{
			pwm_init(BUZZER_PIN, 1400, PWM_DUTY_MAX / 2);
			path_element_flag = L_CIRCLE_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,-circle_in_angular_speed_target,-circle_in_angle,0); 			// 旋转进环
			circle_in_flag = 0;
			circle_in_time_count_flag = TRUE;
			circle_out_time_count_flag = FALSE;
			speed_control_time_count_flag = FALSE;
			pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
			path_follow_kind_flag = 1;
		}
	}
	else if(circle_check[0] == 0 && path_element_flag == L_CIRCLE_PATH)	// circle_check[1] == MT9V03X_W-1 && 
	{
		circle_out_flag++;
		if(circle_out_flag >= 1 && circle_in_time_count >= 1000 && circle_in_time_count < 19000)
		{
			pwm_init(BUZZER_PIN, 1400, PWM_DUTY_MAX / 2);
			path_element_flag = BEND_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,-circle_in_angular_speed_target,-circle_out_angle,0); 			// 旋转出环
			circle_in_flag = 0;
			circle_out_flag  = 0;
			circle_in_time_count_flag = FALSE;
			circle_out_time_count_flag = TRUE;
			speed_control_time_count_flag = TRUE;
			pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
			path_follow_kind_flag = 0;
		}
	}
	else if(path_element_flag == STRIGHT_PATH || path_element_flag == BEND_PATH || circle_in_time_count >= 19000)
	{
		path_element_flag = BEND_PATH;
	}
//	screen_int(0,2*MT9V03X_H+MENU_ROW_PITCH,R_side_X_delta_max,3);
//	screen_int(0,2*MT9V03X_H+2*MENU_ROW_PITCH,L_side_X_delta_max,3);
}

/* 斑马线元素判断 */
void zebra_crossing_path_element_judge(void)
{
	int black_white_jump_point_num = 0;	// 黑白跳变点数量
	if(zebra_crossing_path_element_start_judge_time_count >= 5000)
	{
		for(int X = 0;X < MT9V03X_W-1;X++)
		{
			if((image_OTSU[MT9V03X_H-10][X] == 255 && image_OTSU[MT9V03X_H-10][X+1] == 0) || (image_OTSU[MT9V03X_H-10][X] == 0 && image_OTSU[MT9V03X_H-10][X+1] == 255))
			{
				black_white_jump_point_num++;
			}
		}
		if(black_white_jump_point_num >= 14)
		{
			path_element_flag = ZEBRA_CROSSING_PATH;
		}
	}
}

/* 循迹控制 */
void path_control(float path_control_speed)
{
	chassis_motion_flag = CHASSIS_MOVE;
	if(path_follow_kind_flag == 0)
		path_err = longest_white_col_x-MT9V03X_W/2;
	else if(path_follow_kind_flag == 1)
		path_err = path[control_point[path_follow_kind_flag]][0] - MT9V03X_W/2;
	
	float path_pid_output = path_control_pid(PATH_PID_KIND,path_pid,path_err);
		
	chassis_linear_speed = path_control_speed;
	
	chassis_yaw = 0;
	chassis_angular_speed = path_pid_output;
}

/* 循迹PID参数结构体初始化 */
_PATH_PID_ path_control_pid_init(void)
{
	static _PATH_PID_ path_pid;

	// 循迹 PID
	for(uint8 i = 0;i < 6; i++)
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

	if(abs(path_err) >= 0 && abs(path_err) < 10)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[0]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[0][3]*(gyro_now_err-gyro_last_err);
	}
	else if(abs(path_err) >= 10 && abs(path_err) < 20)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[1]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[1][3]*(gyro_now_err-gyro_last_err);
	}
	else if(abs(path_err) >= 20 && abs(path_err) < 30)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[2]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[2][3]*(gyro_now_err-gyro_last_err);
	}
	else if(abs(path_err) >= 30 && abs(path_err) < 40)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[3]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[3][3]*(gyro_now_err-gyro_last_err);
	}
	else if(abs(path_err) >= 40 && abs(path_err) < 50)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[4]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[4][3]*(gyro_now_err-gyro_last_err);
	}
	else
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[5]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[5][3]*(gyro_now_err-gyro_last_err);
	}
	gyro_last_err = gyro_now_err;
	
	return value;
}	

