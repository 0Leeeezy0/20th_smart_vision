#include "common.h"
#include "data.h"

/* 类定义 */	
DOG_MOTOR motor_1;					// 电机1
DOG_MOTOR motor_2;					// 电机2
DOG_MOTOR motor_3;					// 电机3
DOG_ENCODER encoder_1;				// 编码器1
DOG_ENCODER encoder_2;				// 编码器2
DOG_ENCODER encoder_3;				// 编码器3
DOG_CURRENT current_1;				// 电流采样1
DOG_CURRENT current_2;				// 电流采样2
DOG_CURRENT current_3;				// 电流采样3
DOG_VOLTAGE gray_sensor;			// 灰度传感器
DOG_VOLTAGE bat_voltage;			// 电池电压检测
DOG_KARMAN_FILTER current_1_karman;	// 电流采样1 卡尔曼滤波 
DOG_KARMAN_FILTER current_2_karman;	// 电流采样2 卡尔曼滤波 
DOG_KARMAN_FILTER current_3_karman;	// 电流采样3 卡尔曼滤波 
DOG_KARMAN_FILTER path_gyro_karman;	// 路径陀螺仪 卡尔曼滤波 
DOG_PID motor_1_pid;				// 电机PID1
DOG_PID motor_2_pid;				// 电机PID2
DOG_PID motor_3_pid;				// 电机PID3
DOG_PID current_1_pid;				// 电机电流PID1
DOG_PID current_2_pid;				// 电机电流PID2
DOG_PID current_3_pid;				// 电机电流PID3
DOG_PID path_pid;					// 路径PID
DOG_PID path_gyroz_pid;				// 路径陀螺仪PID
DOG_PID angle_rotate_pid;			// 角度环旋转PID
DOG_PID circle_rotate_pid;			// 圆环旋转PID
DOG_PID box_x_pid;					// 箱子X PID
DOG_PID box_y_pid;					// 箱子Y PID
DOG_VOFA wireless_vofa;				// 无线串口VOFA
DOG_IMU imu660ra;					// IMU660RA陀螺仪
DOG_SOLVE euler_angle_solve;		// 欧拉角解算
DOG_SOLVE rotate_euler_angle_solve;	// 旋转欧拉角解算
DOG_SOLVE circle_euler_angle_solve;	// 圆环欧拉角解算
DOG_SOLVE box_euler_angle_solve;	// 箱子欧拉角解算
DOG_SOLVE chassis_solve;			// 底盘解算
DOG_SOLVE displacement_solve;		// 位移解算
DOG_TIMER zebra_path_timer;			// 斑马线计时器
DOG_TIMER speed_slow_change_timer;  // 缓变速计时器
DOG_TIMER motor_debug_timer;        // 电机调试计时器
DOG_CV dog_cv;						// 计算机视觉
DOG_PATH dog_path;					// 循迹

/* 使能标志位 */
_bool_ circle_enable_flag = True;			// 圆环 使能标志位
_bool_ zebra_enable_flag = True;			// 斑马线 使能标志位
_bool_ ai_camera_0_enable_flag = True;		// AI相机0 使能标志位
_bool_ ai_camera_1_enable_flag = True;		// AI相机1 使能标志位
_bool_ ai_camera_2_enable_flag = True;		// AI相机2 使能标志位
_bool_ supplement_lamp_enable_flag = True;	// 补光灯 使能标志位

/* 完成标志位 */
_bool_ angle_rotate_finsh_flag = False;		// 角度环旋转完成标志位
_bool_ circle_rotate_finsh_flag = False;	// 圆环旋转完成标志位
_bool_ box_X_finsh_flag = False;			// 箱子X定位完成标志位
_bool_ box_Y_finsh_flag = False;			// 箱子Y定位完成标志位
_bool_ box_XY_finsh_flag = False;			// 箱子XY定位完成标志位

/* 初始化标志位 */
_bool_ ai_camera_0_init_flag = False;	// AI摄像头0 初始化标志位

/* 全局变量 */
/* 赛道提取 */
int16 path_err;							// 路径误差
uint16 path_start = 95;					// 路径线起始高度
uint16 path_end = 30;					// 路径线结束高度
uint16 side_extract_start_y = 80;		// 边线提取起始高度
uint16 side_extract_end_y = 20;			// 边线提取结束高度
uint16 prediction_point = 30;			// 预测点高度：其横坐标将作为下一帧的搜线起点
uint16 control_point[2] = {65, 55};		// 控制点高度（0：最长白列；1：路径线提取）
/* 圆环 */
uint16 circle_check_y = 45;				// 圆环检测线高度（越大越晚进环）
uint16 side_x_delta_range[2] = {3, 15};	// 边线X差值阈值范围（小，大）
float circle_in_distance = 0;			// 圆环进环处相对起始点的路程
float circle_out_distance = 0;			// 圆环出环处相对起始点的路程
float circle_in_distance_limit = 150;	// 圆环进环处相对起始点的路程阈值（路程大于该阈值才能出环）
float circle_out_distance_limit = 100;	// 圆环出环处相对起始点的路程阈值（路程大于该阈值才能入环）
/* 斑马线 */
uint16 zebra_check_y = 1;				// 斑马线检测线高度
uint16 zebra_stop_distance = 0;			// 斑马线停车距离
/* 赛道其他 */
_path_state_ path_state = common_path;		// 赛道状态
_path_state_ last_path_state = common_path;	// 上一次赛道状态
/* 控制 */
_control_kind_ control_kind = Stop;				// 控制类型
float wheel_speed_target[3] = {0, 0, 0};		// 轮子目标速度
float motor_current_target[3] = {0, 0, 0};		// 电机电流目标值
float motor_pwm_duty[3] = {0, 0, 0};			// 电机PWM占空比
_move_solve_kind_ move_solve_kind;				// 运动解算类型
float linear_speed_target;						// 目标线速度
float translation_yaw_target;					// 目标平动角度
float x_speed_target;							// 目标x速度
float y_speed_target;							// 目标y速度
float angular_speed_target;						// 目标旋转速度
float angle_rotation_yaw_target;				// 目标角度环旋转角度
float circle_rotation_yaw_target;				// 目标圆环旋转角度
float data_1;									// 运动学逆解算参数1（线速度/X速度）
float data_2;									// 运动学逆解算参数2（航向角/Y速度）
float x_speed_slow_change_rate = 0.0003;		// X缓变速率（越大缓变速越快）
float y_speed_slow_change_rate = 0.003;			// Y缓变速率（越大缓变速越快）
float x_speed_rate = 2.4;						// 循线x速度比例（目标循线x速度/目标循线旋转速度）
/* 箱子 */
uint8 detection_box_width;						// 识别框宽度
uint8 detection_box_width_limit = 30;			// 识别框宽度阈值（大于此阈值才可以进入箱子追踪模式）
uint8 detection_box_width_target = 80;			// 识别框目标宽度
uint8 detection_box_height;						// 识别框高度度
uint8 detection_box_height_limit = 30;			// 识别框高度阈值（大于此阈值才可以进入箱子追踪模式）
int16 detection_box_center_x;					// 识别框中心横坐标
uint16 detection_box_center_x_limit = 65;		// 识别框中心横坐标阈值（在阈值范围内才可以进入箱子追踪模式）
uint8 box_y_track_enable_center_x_limit = 40;	// 箱子Y方向定位使能的中心横坐标阈值
_ai_camera_detection_result_ detection_result;	// 识别结果
_ai_camera_detection_result_ detection_result_list[100] = {0};	// 识别结果列表
uint8 detection_result_num = 0;					// 识别结果列表数量
uint16 rectificate_weight[4] = {1 ,5 ,55 ,85};	// 矫正权重（中线±MT9V03X_W/8 ，中线±2*MT9V03X_W/8 ，中线±3*MT9V03X_W/8 ，中线±4*MT9V03X_W/8）
uint32 sum_weight = 0;							// 加权和
uint16 symmetry_rectificate_start_y = 99;		// 对称法矫正图像遍历起始点高度
uint16 symmetry_rectificate_end_y = 40;			// 对称法矫正图像遍历结束点高度
float sum_weight_normalization = 0;				// 加权和归一化	
float sum_weight_normalization_limit[2] = {0.94, 0.80};	// 加权和归一化阈值
float frame_white_num_normalization[2] = {0};			// 对称法矫正图像左右边框白点数量归一化
float frame_white_num_normalization_limit = 0.25;		// 对称法矫正图像左右边框白点数量归一化阈值
uint16 frame_offset = 15;								// 图像边框偏移量（左框右偏，右框左偏，防止曲率超级大的弯道无法使用对称法进行矫正） 
float last_box_world_x = 0;								// 上一个箱子相对于起始点的世界X坐标
float last_box_world_y = 0;								// 上一个箱子相对于起始点的世界Y坐标
float box_distance = 100;								// 箱子间距
/* 速度/角度/时间 */
uint8 plan_idx = 0;									// 方案索引（由低至高，方案速度逐渐变快）			
float path_y_speed_target[3] = {170, 190, 210};		// 目标循迹Y速度
float circle_y_speed_target[3] = {150, 160, 170};	// 目标圆环Y速度
float path_x_speed_enable_y_speed_rate = 0.8;		// 目标循迹Y速度比例（实时目标速度/目标速度 大于该比例才开启X方向速度）
float circle_x_speed_enable_y_speed_rate = 0.8;		// 目标圆环Y速度比例（实时目标速度/目标速度 大于该比例才开启X方向速度）
float circle_angular_speed_target = 50;				// 出入环目标角速度
float circle_angle_target[2] = {70, 65};			// 出入环目标转动角度
float box_x_speed_target = 65;						// 箱子目标X速度
float box_x_angular_speed_rate = 0.33;				// 箱子 转动速度/X速度 比例（越大旋转半径越小）
float box_fxxk_y_speed_target[3] = {80, 80, 80};	// 推箱子Y速度目标值
uint32 last_x_speed_slow_change_timer_time = 0;		// X缓变速上一次计时器时间
uint32 last_y_speed_slow_change_timer_time = 0;		// Y缓变速上一次计时器时间

/*    PID参数     			Kp     Ki     Kd     积分限幅     输出限幅     陀螺仪Kd */
// 电机
#ifdef FUZZY_SPEED_AND_CURRENT
float MOTOR_RANGE[3] = { 0.0,   10.0, 160.0 };		// 速度期望区间
float MOTOR_PID[4][5] =  {{ 0.050,    0.010,    0.0,  0,         13},
						  { 0.070,    0.020,    0.0,  0,         13},
						  { 0.040,    0.009,    0.0,  0,         13},
						  { 0.040,    0.003,    0.0,  0,         13}};
#endif
#ifdef SPEED_AND_CURRENT
float MOTOR_1_PID[5] = 	  { 0.0263,   0.0050,   0,  500,         13 };		// 硬
float MOTOR_2_PID[5] =    { 0.0422,   0.0027,   0,  500,         13 };		// 软
float MOTOR_3_PID[5] =    { 0.0422,   0.0027,   0,  500,         13 };		// 软

#endif
#ifdef SPEED
float MOTOR_1_PID[5] = 	  { 8.8,   6.1,   0.98,  500,         9000 };
float MOTOR_2_PID[5] =    { 8.8,   6.1,   0.98,  500,         9000 };
float MOTOR_3_PID[5] =    { 8.8,   6.1,   0.98,  500,         9000 };
#endif

// 电流
float I_1_PID[5] = 		  { 60,     170,     0,     500,         9000 };
float I_2_PID[5] = 		  { 60,     170,     0,     500,         9000 };
float I_3_PID[5] = 		  { 60,     170,     0,     500,         9000 };
// 循线
float PATH_RANGE[2][3] = {{ 8.0,   30.0,  60.0 },		// 循迹误差区间
						  { 40.0,  200.0, 400.0 }};		// 角速度区间

float GYRO_RANGE[2][3] = {{ 40.0,  200.0,  400.0 },		// 循迹误差区间
						  { 12.0,   25.0,  50.0}};		// 角速度区间

//float PATH_PID[4][6] =  {{ 2.3, 0,     0.0,   2,           75,          0.25},
//						   { 2.0, 0,     0.0,   2,          75,           0.19},
//						   { 1.4, 0,     0.0,   2,           75,          0.16},
//						   { 0.6, 0,     0.0,   2,           75,          0.13}};
						  
float PATH_PID[3][4][6] ={{{ 2.3, 0,     0.0,   2,           75,          0.25},		/* 低 */
						   { 2.0, 0,     0.0,   2,           75,           0.19},
						   { 1.4, 0,     0.0,   2,           75,          0.13},
						   { 0.6, 0,     0.0,   2,           75,          0.11}},

						  {{ 2.3, 0,     0.0,   2,           75,          0.25},		/* 中 */
						   { 2.0, 0,     0.0,   2,           75,           0.19},
						   { 1.4, 0,     0.0,   2,           75,          0.13},
						   { 0.6, 0,     0.0,   2,           75,          0.11}},
						  
						  {{ 2.3, 0,     0.0,   2,           75,          0.25},		/* 高 */
						   { 2.0, 0,     0.0,   2,           75,           0.19},
						   { 1.4, 0,     0.0,   2,           75,          0.13},
						   { 0.6, 0,     0.0,   2,           75,          0.11}}};

// 旋转
float ROTATE_RANGE[3] =   { 15.0,  50.0,  120.0 };		// 角度环误差区间						  
float ROTATE_PID[4][5] = {{ 0.5,   0,     1.54,  20,          45 },
						  { 1.1,   0,     1.20,  20,          75 },
						  { 1.6,   0,     0.84,  20,          105 },
						  { 2.1,   0,     0.58,  20,	      130 }};							  
// BOX X
float BOX_X_RANGE[3] =    { 10.0,  20.0,  30.0 };		// BOX X误差区间	
float BOX_X_PID[4][5] =  {{ 0.45,  0,     1.27,  2,           35 },
						  { 0.75,  0,     1.00,  2,           60 },
					      { 0.9,   0,     0.37,  2,           80 },
						  { 1.2,   0,     0.47,  2,           100 }};					  
// BOX Y
float BOX_Y_RANGE[3] =    { 10.0,  20.0,  45.0 };		// BOX Y误差区间	
float BOX_Y_PID[4][5] =  {{ 0.45,  0,     1.27,  2,           35 },
						  { 0.75,  0,     1.00,  2,           60 },
					      { 1.2,   0,     0.37,  2,           80 },
						  { 1.7,   0,     0.47,  2,           100 }};
 
/* KARMAN滤波器参数		   	 Q     R     Q越小越平滑   R越小越接近(收敛越快)*/
float I_KARMAN[2] = 	   { 0.01, 0.1};
float PATH_GYRO_KARMAN[2] ={ 0.01, 0.1};

/* 模糊PID 规则表 */
// 速度环
_fuzzy_subset_ motor_fuzzy_rules[8][8] = 
{  
{7,7,7,6,7,7,7, 7},
{7,7,7,5,7,7,7, 7},
{7,7,7,4,7,7,7, 7},
{6,5,4,3,4,5,6, 7},
{7,7,7,4,7,7,7, 7},
{7,7,7,5,7,7,7, 7},
{7,7,7,6,7,7,7, 7},
{7,7,7,7,7,7,7,7}};
// 方向环
_fuzzy_subset_ path_fuzzy_rules[8][8] =     
{  
{6,6,6,6,6,6,6, 7},
{6,5,5,4,5,5,6, 7},
{6,5,4,3,4,5,6, 7},
{6,5,4,3,4,5,6, 7},
{6,5,4,3,4,5,6, 7},
{6,5,5,4,5,5,6, 7},
{6,6,6,6,6,6,6, 7},

{7,7,7,7,7,7,7,7}};
// 方向环陀螺仪
_fuzzy_subset_ gyro_fuzzy_rules[8][8] = 
{  
{7,7,7,6,7,7,7, 7},
{7,7,7,5,7,7,7, 7},
{7,7,7,4,7,7,7, 7},
{6,5,4,3,4,5,6, 7},
{7,7,7,4,7,7,7, 7},
{7,7,7,5,7,7,7, 7},
{7,7,7,6,7,7,7, 7},

{7,7,7,7,7,7,7,7}};
// 箱子X/Y定位
_fuzzy_subset_ xy_fuzzy_rules[8][8] =     
{  
{6,6,5,5,5,6,6, 7},
{6,5,4,4,4,5,6, 7},
{5,4,3,3,3,4,5, 7},
{6,5,4,3,4,5,6, 7},
{5,4,3,3,3,4,5, 7},
{6,5,4,4,4,5,6, 7},
{6,6,5,5,5,6,6, 7},

{7,7,7,7,7,7,7,7}};
// 角度环
_fuzzy_subset_ angle_rotate_fuzzy_rules[8][8] =     
{  
{6,6,5,5,5,6,6, 7},
{6,5,4,4,4,5,6, 7},
{5,4,3,3,3,4,5, 7},
{6,5,4,3,4,5,6, 7},
{5,4,3,3,3,4,5, 7},
{6,5,4,4,4,5,6, 7},
{6,6,5,5,5,6,6, 7},

{7,7,7,7,7,7,7,7}};
// 圆环角度环
_fuzzy_subset_ circle_rotate_fuzzy_rules[8][8] =     
{  
{6,6,5,5,5,6,6, 7},
{6,5,4,4,4,5,6, 7},
{5,4,3,3,3,4,5, 7},
{6,5,4,3,4,5,6, 7},
{5,4,3,3,3,4,5, 7},
{6,5,4,4,4,5,6, 7},
{6,6,5,5,5,6,6, 7},

{7,7,7,7,7,7,7,7}};

/* 标志位初始化 */	
void flag_init(void){
	// 解算使能标志位
	euler_angle_solve.solve_flag = False;
	rotate_euler_angle_solve.solve_flag = False;
	circle_euler_angle_solve.solve_flag = False;
	box_euler_angle_solve.solve_flag = False;
	chassis_solve.solve_flag = False;
	displacement_solve.solve_flag = False;
	// 计时器使能标志位
	zebra_path_timer.ticking_flag = False;
	speed_slow_change_timer.ticking_flag = False;
	// 完成标志位
	angle_rotate_finsh_flag = False;	// 角度环旋转完成标志位
	circle_rotate_finsh_flag = False;	// 圆环旋转完成标志位
	box_X_finsh_flag = False;			// 箱子X定位完成标志位
	box_Y_finsh_flag = False;			// 箱子Y定位完成标志位
	box_XY_finsh_flag = False;			// 箱子XY定位完成标志位
}
	
/* 变量初始化 */	
void variable_init(void){
	zebra_stop_distance = 0;
	path_state = common_path;			// 赛道状态
	last_path_state = common_path;		// 上一次赛道状态
	control_kind = Stop;				// 控制类型
	memset(wheel_speed_target, 0, sizeof(wheel_speed_target));			// 轮子目标速度
	memset(motor_current_target, 0, sizeof(motor_current_target));		// 电机电流目标值
	memset(motor_pwm_duty, 0, sizeof(motor_pwm_duty));					// 电机PWM占空比
	memset(detection_result_list, 0, sizeof(detection_result_list));	// 识别结果列表
	detection_result_num = 0;
	sum_weight_normalization = 0;		// 加权和归一化	
	last_box_world_x = 0;				// 上一个箱子相对于起始点的世界X坐标
	last_box_world_y = 0;				// 上一个箱子相对于起始点的世界Y坐标
	linear_speed_target = 0;			// 目标线速度
	translation_yaw_target = 0;			// 目标平动角度
	x_speed_target = 0;					// 目标x速度
	y_speed_target = 0;					// 目标y速度
	angular_speed_target = 0;			// 目标旋转速度
	angle_rotation_yaw_target = 0;		// 目标角度环旋转角度
	circle_rotation_yaw_target = 0;		// 目标圆环旋转角度
	data_1 = 0;							// 运动学逆解算参数1（线速度/X速度）
	data_2 = 0;							// 运动学逆解算参数2（航向角/Y速度）
	last_x_speed_slow_change_timer_time = 0;	// X缓变速上一次计时器时间
	last_y_speed_slow_change_timer_time = 0;	// Y缓变速上一次计时器时间
	circle_in_distance = 0;			// 圆环进环处相对起始点的路程
	circle_out_distance = 0;		// 圆环出环处相对起始点的路程
	
	dog_path.mid_x = MT9V03X_W/2;					// 动态中线
	memset(dog_path.path,0,sizeof(dog_path.path));	// 路径线x、y坐标
	dog_path.prediction_point = prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点
	dog_path.longest_white_col_x = MT9V03X_W/2;		// 最长白列X坐标
	memset(dog_path.L_side,0,sizeof(dog_path.L_side));// 左边线坐标
	memset(dog_path.R_side,0,sizeof(dog_path.R_side));// 右边线坐标
	dog_path.L_side_point_num = 0;			// 左边线点数量
	dog_path.R_side_point_num = 0;			// 右边线点数量
	dog_path.L_frame_point_num = 0;			// 左边框点数量
	dog_path.R_frame_point_num = 0;			// 右边框点数量
	memset(dog_path.L_bend_point,0,sizeof(dog_path.L_bend_point));// 左边线弯点坐标
	memset(dog_path.R_bend_point,0,sizeof(dog_path.R_bend_point));// 右边线弯点坐标
	dog_path.L_bend_point_num = 0;			// 左边线弯点数量
	dog_path.R_bend_point_num = 0;			// 右边线弯点数量
	memset(dog_path.path_width,0,sizeof(dog_path.path_width));	// 赛道宽度
	dog_path.point_distance = 10;			// 拐点/弯点距离
	dog_path.bend_point_angle_min = 0;		// 弯点最小角度阈值
	dog_path.bend_point_angle_max = 170;	// 弯点最大角度阈值
}