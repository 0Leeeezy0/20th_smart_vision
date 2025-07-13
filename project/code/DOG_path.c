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
<<<<<<< HEAD
        if(image_OTSU[path_start-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0] = X+1;
            L_side[1] = path_start-1;
=======
        if(input[this -> path_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0] = X+1;
            L_side[1] = this -> path_start_y-1;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == 0)
        {
            // 存储白色点
            L_side[0] = 0;
<<<<<<< HEAD
            L_side[1] = path_start-1;
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
			L_frame_point_num++;
=======
            L_side[1] = this -> path_start_y-1;
//			ips200_draw_point(L_side[0], L_side[1]+MT9V03X_H*2, RGB565_RED);
			this -> L_frame_point_num++;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
            break;
        }
    }
    // 右边线种子
    for(int X = this -> mid_x;X <= MT9V03X_W-1;X++)
    {
<<<<<<< HEAD
        if(image_OTSU[path_start-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0] = X-1;
            R_side[1] = path_start-1;
=======
        if(input[this -> path_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0] = X-1;
            R_side[1] = this -> path_start_y-1;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
            R_side[0] = MT9V03X_W-1;
<<<<<<< HEAD
            R_side[1] = path_start-1;
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
			R_frame_point_num++;
=======
            R_side[1] = this -> path_start_y-1;
//			ips200_draw_point(R_side[0], R_side[1]+MT9V03X_H*2, RGB565_RED);
			this -> R_frame_point_num++;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
            break;
        }
    }
	
	// 更新mid_x
    this -> mid_x = (L_side[0] + R_side[0])/2;
	
	for(int X = L_side[0];X <= R_side[0];X++)
	{
<<<<<<< HEAD
		for(int Y = path_start;Y >= path_start-control_point[path_follow_kind_flag];Y--)
		{
			if(image_OTSU[Y][X] == 0 || Y == path_start-control_point[path_follow_kind_flag])
			{
				// 有更长的白列则刷新
				if(path_start-Y > max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = path_start-Y;
=======
		for(int Y = this -> path_start_y;Y >= this -> path_start_y-control_point;Y--)
		{
			if(input[Y][X] == 0 || Y == this -> path_start_y-control_point)
			{
				// 有更长的白列则刷新
				if(this -> path_start_y-Y > max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = this -> path_start_y-Y;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
					longest_white_X_cache = 0;
					max_white_col_num_cache = 0;
					longest_white_X_cache +=  X;
					max_white_col_num_cache++;
				}
				// 一样长的白列则自增
<<<<<<< HEAD
				else if(path_start-Y == max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = path_start-Y;
=======
				else if(this -> path_start_y-Y == max_white_num)
				{
					max_white_col_find_flag = 1;
					max_white_num = this -> path_start_y-Y;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
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
<<<<<<< HEAD
	if(mid_x == MT9V03X_W/2)
		mid_x_flag = 0;
	if(mid_x_flag < 10)
	{
		path[0][0] = MT9V03X_W/2;
=======
	if(this -> mid_x == MT9V03X_W/2)
		mid_x_flag = 0;
	if(mid_x_flag < 10)
	{
		this -> path[0][0] = MT9V03X_W/2;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
		mid_x_flag++;
	}
	else
	{
		this -> path[0][0] = this -> path[this -> prediction_point][0];
	}
<<<<<<< HEAD
	path[0][1] = path_start;
	for(y = path_start-1;y >= path_end;y--)
	{
		// 右边线
		for(x = path[path_start-1-y][0];x < MT9V03X_W;x++)
=======
	this -> path[0][1] = this -> path_start_y;
	for(y = this -> path_start_y-1;y >= this -> path_end_y;y--)
	{
		// 右边线
		for(x = this -> path[this -> path_start_y-1-y][0];x < MT9V03X_W;x++)
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
		{
			if(input[y][x] == 0)
			{
<<<<<<< HEAD
				path[path_start-y][0] = x;
=======
				this -> path[this -> path_start_y-y][0] = x;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
				break;
			}
			if(x == MT9V03X_W-1)
			{
<<<<<<< HEAD
				path[path_start-y][0] = x;
			}
		}
		// 左边线
		for(x = path[path_start-1-y][0];x >= 0;x--)
=======
				this -> path[this -> path_start_y-y][0] = x;
			}
		}
		// 左边线
		for(x = this -> path[this -> path_start_y-1-y][0];x >= 0;x--)
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
		{
			if(input[y][x] == 0)
			{
<<<<<<< HEAD
				path_width[path_start-y] = path[path_start-y][0]-x;
				path[path_start-y][0] += x;
=======
				this -> path_width[this -> path_start_y-y] = this -> path[this -> path_start_y-y][0]-x;
				this -> path[this -> path_start_y-y][0] += x;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
				break;
			}
			if(x == 0)
			{
<<<<<<< HEAD
				path_width[path_start-y] = path[path_start-y][0]-x;
				path[path_start-y][0] += x;
			}
		}
		path[path_start-y][0] = path[path_start-y][0]/2;
		path[path_start-y][1] = y;
//		ips200_draw_point(path[path_start-y][0], MT9V03X_H+MENU_ROW_PITCH+path[path_start-y][1], RGB565_RED);
=======
				this -> path_width[this -> path_start_y-y] = this -> path[this -> path_start_y-y][0]-x;
				this -> path[this -> path_start_y-y][0] += x;
			}
		}
		this -> path[this -> path_start_y-y][0] = this -> path[this -> path_start_y-y][0]/2;
		this -> path[this -> path_start_y-y][1] = y;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
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
<<<<<<< HEAD
        if(image_OTSU[side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            L_side[0][0] = X+1;
            L_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
=======
        if(input[this -> side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            this -> L_side[0][0] = X+1;
            this -> L_side[0][1] = this -> side_extract_start_y-1;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
            break;
        }
        if(X == 0)
        {
            // 存储白色点
<<<<<<< HEAD
            L_side[0][0] = 0;
            L_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
			L_frame_point_num++;
=======
            this -> L_side[0][0] = 0;
            this -> L_side[0][1] = this -> side_extract_start_y-1;
			this -> L_frame_point_num++;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
            break;
        }
    }
    // 右边线种子
    for(int X = this -> mid_x;X <= MT9V03X_W-1;X++)
    {
<<<<<<< HEAD
        if(image_OTSU[side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            R_side[0][0] = X-1;
            R_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(L_side[0][0], L_side[0][1]+MT9V03X_H*2, RGB565_RED);
=======
        if(input[this -> side_extract_start_y-1][X] == 0)    // 黑色
        {
            // 存储白色点
            this -> R_side[0][0] = X-1;
            this -> R_side[0][1] = this -> side_extract_start_y-1;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
            break;
        }
        if(X == MT9V03X_W-1)
        {
            // 存储白色点
<<<<<<< HEAD
            R_side[0][0] = MT9V03X_W-1;
            R_side[0][1] = side_extract_start_y-1;
			// ips200_draw_point(R_side[0][0], R_side[0][1]+MT9V03X_H*2, RGB565_RED);
			R_frame_point_num++;
=======
            this -> R_side[0][0] = MT9V03X_W-1;
            this -> R_side[0][1] = this -> side_extract_start_y-1;
			this -> R_frame_point_num++;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
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
<<<<<<< HEAD
        if(L_side[L_side_point_num][1] < side_extract_end_y)
=======
        if(this -> L_side[this -> L_side_point_num][1] < this -> side_extract_end_y)
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
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
<<<<<<< HEAD
        if(R_side[R_side_point_num][1] < side_extract_end_y)
=======
        if(this -> R_side[this -> R_side_point_num][1] < this -> side_extract_end_y)
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
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
<<<<<<< HEAD
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
=======
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
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

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
<<<<<<< HEAD
			if(abs(vectorAngle[0]) > BEND_POINT_ANGLE_MIN && abs(vectorAngle[0]) < BEND_POINT_ANGLE_MAX)
			{
				//  cout << abs(AngleVector[0]) << endl;
				L_bend_point[L_bend_point_num][0] = L_side[i][0];
				L_bend_point[L_bend_point_num][1] = L_side[i][1];
				if(L_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
					L_bend_point_num++;
=======
			if(abs(vectorAngle[0]) > this -> bend_point_angle_min && abs(vectorAngle[0]) < this -> bend_point_angle_max)
			{
				//  cout << abs(AngleVector[0]) << endl;
				this -> L_bend_point[this -> L_bend_point_num][0] = this -> L_side[i][0];
				this -> L_bend_point[this -> L_bend_point_num][1] = this -> L_side[i][1];
				if(this -> L_bend_point_num < MT9V03X_H*2-1)	/************************注意***************************/
					this -> L_bend_point_num++;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
				else
					break;
			}
		}
		i++;
    }
    // 右边线弯点
<<<<<<< HEAD
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

/* 赛道归一化曲率计算 */
void path_curvature_normalization_judge(void)
{
	if(L_side_point_num+R_side_point_num != 0)
	{
		path_curvature_normalization = (float)(L_bend_point_num+R_bend_point_num)/(float)(L_side_point_num+R_side_point_num);
	}
	if(path_curvature_normalization <= path_curvature_normalization_max)
	{
		path_curvature_normalization = path_curvature_normalization/path_curvature_normalization_max;
	}
	else
	{
		path_curvature_normalization = 1;
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
			gpio_set_level(BUZZER_PIN, 1);
			path_element_flag = R_CIRCLE_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,circle_in_angular_speed_target,circle_in_angle,0); 			// 旋转进环
			circle_in_flag = 0;
			circle_in_time_count_flag = TRUE;
			circle_out_time_count_flag = FALSE;
			gpio_set_level(BUZZER_PIN, 0);
			path_follow_kind_flag = 1;
		}
			
	}
	else if(circle_check[1] == MT9V03X_W-1 && path_element_flag == R_CIRCLE_PATH) // && circle_check[0] == 0
	{
		circle_out_flag++;
		if(circle_out_flag >= 1 && circle_in_time_count >= 1000 && circle_in_time_count < 19000)
		{
			gpio_set_level(BUZZER_PIN, 1);
			path_element_flag = BEND_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,circle_in_angular_speed_target,circle_out_angle,0); 			// 旋转出环
			circle_in_flag = 0;
			circle_out_flag = 0;
			circle_in_time_count_flag = FALSE;
			circle_out_time_count_flag = TRUE;
			gpio_set_level(BUZZER_PIN, 0);
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
			gpio_set_level(BUZZER_PIN, 1);
			path_element_flag = L_CIRCLE_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,-circle_in_angular_speed_target,-circle_in_angle,0); 			// 旋转进环
			circle_in_flag = 0;
			circle_in_time_count_flag = TRUE;
			circle_out_time_count_flag = FALSE;
			gpio_set_level(BUZZER_PIN, 0);
			path_follow_kind_flag = 1;
		}
	}
	else if(circle_check[0] == 0 && path_element_flag == L_CIRCLE_PATH)	// circle_check[1] == MT9V03X_W-1 && 
	{
		circle_out_flag++;
		if(circle_out_flag >= 1 && circle_in_time_count >= 1000 && circle_in_time_count < 19000)
		{
			gpio_set_level(BUZZER_PIN, 1);
			path_element_flag = BEND_PATH;
			chassis_total_control(CHASSIS_MOVE,0,circle_in_linear_speed_target,-circle_in_angular_speed_target,-circle_out_angle,0); 			// 旋转出环
			circle_in_flag = 0;
			circle_out_flag  = 0;
			circle_in_time_count_flag = FALSE;
			circle_out_time_count_flag = TRUE;
			gpio_set_level(BUZZER_PIN, 0);
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
=======
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
	this -> mid_x = MT9V03X_W/2;					// 动态中线
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
	this -> point_distance = 10;				// 拐点/弯点距离
	this -> bend_point_angle_min = 0;		// 弯点最小角度阈值
	this -> bend_point_angle_max = 170;		// 弯点最大角度阈值
	
	/* 成员函数 */
	this -> longest_white_col = longest_white_col;
	this -> path_extract = path_extract;
	this -> side_extract = side_extract;
	this -> side_point_kind_judge = side_point_kind_judge;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
	
	float path_pid_output = path_control_pid(PATH_PID_KIND,path_pid,path_err);
		
	chassis_linear_speed = path_control_speed;
	chassis_yaw = 0;
	chassis_angular_speed = path_pid_output;
}

<<<<<<< HEAD
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

	if(abs(path_err) >= 0 && abs(path_err) < 25)
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

=======
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
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
