#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_path.h"
#include "math.h"

// 最长白列
void longest_white_col(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W], uint16 control_point){
	int L_side[2];
	int R_side[2];
	
	int max_white_num = 0;				// 最长白列白色像素数量
	int longest_white_X = 0;			// 最长白列横坐标
	int longest_white_X_cache = 0;		// 最长白列横坐标缓存
	int max_white_col_num = 0;			// 最长白列数量
	int max_white_col_num_cache = 0;	// 最长白列数量缓存
	uint8 max_white_col_find_flag = 0;	// 找到最长白列标志位
	
	for(int X = this -> mid_x;X >= 0;X--)
    {
        if(input[this -> path_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0] = X+1;
            L_side[1] = this -> path_start_y-1;
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            L_side[0] = 0;
            L_side[1] = this -> path_start_y-1;
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
			this -> L_frame_point_num++;
            break;
        }
    }
    // 右边线种子
    for(int X = this -> mid_x;X <= MT9V03X_W-1;X++)
    {
        if(input[this -> path_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0] = X-1;
            R_side[1] = this -> path_start_y-1;
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            R_side[0] = MT9V03X_W-1;
            R_side[1] = this -> path_start_y-1;
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
			this -> R_frame_point_num++;
            break;
        }
    }
	
	// 更新mid_x
    this -> mid_x = (L_side[0] + R_side[0])/2;
	
	for(int X = L_side[0];X <= R_side[0];X++)
	{
		for(int Y = this -> path_start_y;Y >= this -> path_start_y-control_point;Y--)
		{
			if(input[Y][X] == 0 || Y == this -> path_start_y-control_point)
			{
				// 有更长的白列则刷新
				if(this -> path_start_y-Y > max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = this -> path_start_y-Y;
					longest_white_X_cache = 0;
					max_white_col_num_cache = 0;
					longest_white_X_cache +=  X;
					max_white_col_num_cache++;
				}
				// 一样长的白列则自增
				else if(this -> path_start_y-Y == max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = this -> path_start_y-Y;
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
		this -> longest_white_col_x = longest_white_X/max_white_col_num;
	if(this -> longest_white_col_x <= 0)
		this -> longest_white_col_x = 0;
	else if(this -> longest_white_col_x >= MT9V03X_W-1)
		this -> longest_white_col_x = MT9V03X_W-1;
}	

// 路径线提取
void path_extract(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W]){
	int16 x,y;
	static int16 mid_x_flag = 0;
	if(this -> mid_x == MT9V03X_W/2)
		mid_x_flag = 0;
	if(mid_x_flag < 10)
	{
		this -> path[0][0] = MT9V03X_W/2;
		mid_x_flag++;
	}
	else
	{
		this -> path[0][0] = this -> path[this -> prediction_point][0];
	}
	this -> path[0][1] = this -> path_start_y;
	for(y = this -> path_start_y-1;y >= this -> path_end_y;y--)
	{
		// 右边线
		for(x = this -> path[this -> path_start_y-1-y][0];x < MT9V03X_W;x++)
		{
			if(input[y][x] == 0)
			{
				this -> path[this -> path_start_y-y][0] = x;
				break;
			}
			if(x == MT9V03X_W-1)
			{
				this -> path[this -> path_start_y-y][0] = x;
			}
		}
		// 左边线
		for(x = this -> path[this -> path_start_y-1-y][0];x >= 0;x--)
		{
			if(input[y][x] == 0)
			{
				this -> path_width[this -> path_start_y-y] = this -> path[this -> path_start_y-y][0]-x;
				this -> path[this -> path_start_y-y][0] += x;
				break;
			}
			if(x == 0)
			{
				this -> path_width[this -> path_start_y-y] = this -> path[this -> path_start_y-y][0]-x;
				this -> path[this -> path_start_y-y][0] += x;
			}
		}
		this -> path[this -> path_start_y-y][0] = this -> path[this -> path_start_y-y][0]/2;
		this -> path[this -> path_start_y-y][1] = y;
	}
}

// 边线提取
void side_extract(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W]){
	// 八临域寻线变量设置
    int seed_grow_dir[8][4] = {{0,1,0,1},{1,1,-1,1},{1,0,-1,0},{1,-1,-1,-1},{0,-1,0,-1},{-1,-1,1,-1},{-1,0,1,0},{-1,1,1,1}};    // 种子X,Y方向的生长向量：从正下方逆时针 和 从正下方顺时针 
    int grow_dir_idx = 0;
    // 初始化
    this -> L_side_point_num = 0;
    this -> R_side_point_num = 0;
	this -> L_frame_point_num = 0;
	this -> R_frame_point_num = 0;
    this -> R_side_point_num = 0;
    memset(this -> L_side, 0, sizeof(this -> L_side));
    memset(this -> R_side, 0, sizeof(this -> R_side));

    // 寻找种子起点
    // 左边线种子
    for(int X = this -> mid_x;X >= 0;X--)
    {
        if(input[this -> side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            this -> L_side[0][0] = X+1;
            this -> L_side[0][1] = this -> side_extract_start_y-1;
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            this -> L_side[0][0] = 0;
            this -> L_side[0][1] = this -> side_extract_start_y-1;
			this -> L_frame_point_num++;
            break;
        }
    }
    // 右边线种子
    for(int X = this -> mid_x;X <= MT9V03X_W-1;X++)
    {
        if(input[this -> side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            this -> R_side[0][0] = X-1;
            this -> R_side[0][1] = this -> side_extract_start_y-1;
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            this -> R_side[0][0] = MT9V03X_W-1;
            this -> R_side[0][1] = this -> side_extract_start_y-1;
			this -> R_frame_point_num++;
            break;
        }
    }

    // 更新mid_x
    this -> mid_x = (this -> L_side[0][0] + this -> R_side[0][0])/2;

    // 爬线
    // 左边线
    while(true)
    {
        // 点在边线内
        if(this -> L_side[this -> L_side_point_num][0] < MT9V03X_W-1 && this -> L_side[this -> L_side_point_num][0] > 0)
        {   
            // 是否越界
            if(this -> L_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if(input[this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][1]][this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][0]] == 0 && 
                input[this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][1]][this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][0]] == 255)
            {
                // 下一个点
                this -> L_side[this -> L_side_point_num+1][0] = this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[grow_dir_idx][0];
                this -> L_side[this -> L_side_point_num+1][1] = this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[grow_dir_idx][1];
                this -> L_side_point_num+=1;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        // 点在边线上
        else if(grow_dir_idx <= 4)
        {
            // 是否越界
            if(this -> L_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if( (grow_dir_idx <= 3 && input[this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][1]][this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][0]] == 0 && 
                input[this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][1]][this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][0]] == 255) || 
                (grow_dir_idx == 4 && input[this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][1]][this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][0]] == 255))
            {
                // 下一个点
                this -> L_side[this -> L_side_point_num+1][0] = this -> L_side[this -> L_side_point_num][0]+seed_grow_dir[grow_dir_idx][0];
				this ->  L_side[this -> L_side_point_num+1][1] = this -> L_side[this -> L_side_point_num][1]+seed_grow_dir[grow_dir_idx][1];
                this -> L_side_point_num+=1;
				this -> L_frame_point_num++;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        else
            break;
        // 索引是否越界
        if(grow_dir_idx >= 8)
            break;
        if(this -> L_side[this -> L_side_point_num][1] < this -> side_extract_end_y)
            break;
    }
    grow_dir_idx = 0;
    // 右边线
    while(true)
    {
        // 点在边线内
        if(this -> R_side[this -> R_side_point_num][0] < MT9V03X_W-1 && this -> R_side[this -> R_side_point_num][0] > 0)
        {   
            // 是否越界
            if(this -> R_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if(input[this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][3]][this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][2]] == 0 && 
                input[this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][3]][this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][2]] == 255)
            {
                // 下一个点
                this -> R_side[this -> R_side_point_num+1][0] = this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[grow_dir_idx][2];
                this -> R_side[this -> R_side_point_num+1][1] = this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[grow_dir_idx][3];
                this -> R_side_point_num+=1;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        // 点在边线上
        else if(grow_dir_idx <= 4)
        {
            // 是否越界
            if(this -> R_side_point_num >= MT9V03X_H*3-2)	/************************注意***************************/
                break;
            // 下一个点为黑色，这个点为白色
            if( (grow_dir_idx <= 3 && input[this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[(grow_dir_idx+1)%8][3]][this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[(grow_dir_idx+1)%8][2]] == 0 && 
                input[this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][3]][this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][2]] == 255) || 
                (grow_dir_idx == 4 && input[this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[(grow_dir_idx)%8][3]][this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[(grow_dir_idx)%8][2]] == 255))
            {
                // 下一个点
                this -> R_side[this -> R_side_point_num+1][0] = this -> R_side[this -> R_side_point_num][0]+seed_grow_dir[grow_dir_idx][2];
                this -> R_side[this -> R_side_point_num+1][1] = this -> R_side[this -> R_side_point_num][1]+seed_grow_dir[grow_dir_idx][3];
                this -> R_side_point_num+=1;
				this -> R_frame_point_num++;
                grow_dir_idx = 0;
            }
            grow_dir_idx++;
        }
        else
            break;
        // 索引是否越界
        if(grow_dir_idx >= 8)
            break;
        if(this -> R_side[this -> R_side_point_num][1] < this -> side_extract_end_y)
            break;
    }
}

// 边线点类型判断
void side_point_kind_judge(struct DOG_PATH* this){
	int i;
    int vector[2][4] = {0}; // 左右拐点与上下两点构成的向量坐标
    double vectorScalarProduct[2] = {0};  // 左右拐点向量点乘
    double vectorModule[4] = {0};   // 左右拐点向量的模
    double vectorAngle[2] = {0}; // 左右拐点向量夹角(角度制)

    // 初始化
    this -> L_bend_point_num = 0;
    this -> R_bend_point_num = 0;
    memset(this -> L_bend_point, 0, sizeof(this -> L_bend_point));
    memset(this -> R_bend_point, 0, sizeof(this -> R_bend_point));

    // 寻弯点范围
    // 左边线弯点
    for(i = this -> point_distance;i <= this -> L_side_point_num-1-this -> point_distance;)
    {
		// 不对边框处的边线进行弯点识别
		if(this -> L_side[i-this -> point_distance][0] != 0 && this -> L_side[i][0] != 0 && this -> L_side[i+this -> point_distance][0] != 0)
		{
			// 左边线第一个向量
			vector[0][0] = (double)(this -> L_side[i-this -> point_distance][0]-this -> L_side[i][0]);
			vector[0][1] = (double)(this -> L_side[i-this -> point_distance][1]-this -> L_side[i][1]);
			// 左边线第二个向量
			vector[1][0] = (double)(this -> L_side[i+this -> point_distance][0]-this -> L_side[i][0]);
			vector[1][1] = (double)(this -> L_side[i+this -> point_distance][1]-this -> L_side[i][1]);

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
			if(abs(vectorAngle[0]) > this -> bend_point_angle_min && abs(vectorAngle[0]) < this -> bend_point_angle_max)
			{
				//  cout << abs(AngleVector[0]) << endl;
				this -> L_bend_point[this -> L_bend_point_num][0] = this -> L_side[i][0];
				this -> L_bend_point[this -> L_bend_point_num][1] = this -> L_side[i][1];
				if(this -> L_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
					this -> L_bend_point_num++;
				else
					break;
			}
		}
		i++;
    }
    // 右边线弯点
    for(i = this -> point_distance;i <= this -> R_side_point_num-1-this -> point_distance;)
    {
		// 不对边框处的边线进行弯点识别
		if(this -> R_side[i-this -> point_distance][0] != MT9V03X_W-1 && this -> R_side[i][0] != MT9V03X_W-1 && this -> R_side[i+this -> point_distance][0] != MT9V03X_W-1)
		{
			// 左边线第一个向量
			vector[0][2] = (double)(this -> R_side[i-this -> point_distance][0]-this -> R_side[i][0]);
			vector[0][3] = (double)(this -> R_side[i-this -> point_distance][1]-this -> R_side[i][1]);
			// 左边线第二个向量
			vector[1][2] = (double)(this -> R_side[i+this -> point_distance][0]-this -> R_side[i][0]);
			vector[1][3] = (double)(this -> R_side[i+this -> point_distance][1]-this -> R_side[i][1]);

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
			if(abs(vectorAngle[1]) > this -> bend_point_angle_min && abs(vectorAngle[1]) < this -> bend_point_angle_max)
			{
				//  cout << abs(AngleVector[0]) << endl;
				this -> R_bend_point[this -> R_bend_point_num][0] = this -> R_side[i][0];
				this -> R_bend_point[this -> R_bend_point_num][1] = this -> R_side[i][1];
				if(this -> R_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
					this -> R_bend_point_num++;	
				else
					break;
			}
		}
		i++;
    }
}		

// 构造函数
void path(struct DOG_PATH* this, uint16 path_start_y, uint16 path_end_y, uint16 side_extract_start_y, uint16 side_extract_end_y, uint16 prediction_point){
	this -> mid_x = 0;					// 动态中线
	this -> path_start_y = path_start_y;			// 路径线提取开始高度
	this -> path_end_y = path_end_y;				// 路径线提取结束高度
	this -> side_extract_start_y = side_extract_start_y;		// 边线开始提取高度
	this -> side_extract_end_y = side_extract_end_y;		// 边线结束提取高度
	memset(this -> path,0,sizeof(this -> path));	// 路径线x、y坐标
	this -> prediction_point = prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点
	this -> longest_white_col_x = 0;				// 最长白列X坐标
	memset(this -> L_side,0,sizeof(this -> L_side));// 左边线坐标
	memset(this -> R_side,0,sizeof(this -> R_side));// 右边线坐标
	this -> L_side_point_num = 0;			// 左边线点数量
	this -> R_side_point_num = 0;			// 右边线点数量
	this -> L_frame_point_num = 0;			// 左边框点数量
	this -> R_frame_point_num = 0;			// 右边框点数量
	memset(this -> L_bend_point,0,sizeof(this -> L_bend_point));// 左边线弯点坐标
	memset(this -> R_bend_point,0,sizeof(this -> R_bend_point));// 右边线弯点坐标
	this -> L_bend_point_num = 0;			// 左边线弯点数量
	this -> R_bend_point_num = 0;			// 右边线弯点数量
	memset(this -> path_width,0,sizeof(this -> path_width));	// 赛道宽度
	this -> point_distance = 0;				// 拐点/弯点距离
	this -> bend_point_angle_min = 0;		// 弯点最小角度阈值
	this -> bend_point_angle_max = 170;		// 弯点最大角度阈值
	
	/* 成员函数 */
	this -> longest_white_col = longest_white_col;
	this -> path_extract = path_extract;
	this -> side_extract = side_extract;
	this -> side_point_kind_judge = side_point_kind_judge;
	
}

// 析构函数
void _path(struct DOG_PATH* this){
	this -> mid_x = MT9V03X_W/2;		// 动态中线
	this -> path_start_y = 0;			// 路径线提取开始高度
	this -> path_end_y = 0;				// 路径线提取结束高度
	this -> side_extract_start_y = 0;		// 边线开始提取高度
	this -> side_extract_end_y = 0;		// 边线结束提取高度
	memset(this -> path,0,sizeof(this -> path));	// 路径线x、y坐标
	this -> prediction_point = 0;	// 预测点高度：其横坐标将作为下一帧的搜线起点
	this -> longest_white_col_x = 0;				// 最长白列X坐标
	memset(this -> L_side,0,sizeof(this -> L_side));// 左边线坐标
	memset(this -> R_side,0,sizeof(this -> R_side));// 右边线坐标
	this -> L_side_point_num = 0;			// 左边线点数量
	this -> R_side_point_num = 0;			// 右边线点数量
	this -> L_frame_point_num = 0;			// 左边框点数量
	this -> R_frame_point_num = 0;			// 右边框点数量
	memset(this -> L_bend_point,0,sizeof(this -> L_bend_point));// 左边线弯点坐标
	memset(this -> R_bend_point,0,sizeof(this -> R_bend_point));// 右边线弯点坐标
	this -> L_bend_point_num = 0;			// 左边线弯点数量
	this -> R_bend_point_num = 0;			// 右边线弯点数量
	memset(this -> path_width,0,sizeof(this -> path_width));	// 赛道宽度
	this -> point_distance = 0;				// 拐点/弯点距离
	this -> bend_point_angle_min = 0;		// 弯点最小角度阈值
	this -> bend_point_angle_max = 0;		// 弯点最大角度阈值
}