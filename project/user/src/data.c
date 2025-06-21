#include "common.h"

/****************************** 实时数据 ******************************/

/* 编码器计数数值（rad*1024） */
int16 encoder_1_count;
int16 encoder_2_count;
int16 encoder_3_count;

/* 编码器速度（cm/s） */
float encoder_1_speed;
float encoder_2_speed;
float encoder_3_speed;

/* 电机速度（cm/s） */
float motor_1_speed;
float motor_2_speed;
float motor_3_speed;

/* 三轴角速度（°/s） */
float gyro_x;
float gyro_y;
float gyro_z;

/* 三轴角加速度（g(m/s^2)） */
float acc_x;
float acc_y;
float acc_z;

/* 欧拉角（°） */
float roll;		// 滚转角
float pitch;	// 俯仰角	
float yaw;		// 偏航角	正方向：逆时针

/* 灰度传感器（V） */
uint16 grayscale = 0;

/* 电池电压（V） */
float bat_voltage = 0;

/* 电流adc参数 */
float motor_1_I = 0;
float motor_2_I = 0;
float motor_3_I = 0;
float motor_1_V = 0;
float motor_2_V = 0;
float motor_3_V = 0;
float motor_1_V_karman = 0;
float motor_2_V_karman = 0;
float motor_3_V_karman = 0;
/* 位移解算（° cm） */
float wheel_1_shift = 0;
float wheel_2_shift = 0;
float wheel_3_shift = 0;
float shift_yaw;
float shift_distance;

/* 底盘控制参数 */
float chassis_yaw = 0;				// 底盘航向角	正方向：顺时针
float chassis_linear_speed = 0;		// 底盘线速度
float chassis_angular_speed = 0;	// 底盘角速度
float chassis_rotate_angle = 0;		// 底盘转动角度	正方向：顺时针
uint32 chassis_move_time_count = 0;  // 底盘移动计时
_CHASSIS_CONTROL_ chassis_control;

/* 循迹参数 */
int16 path_err;
int16 path[MT9V03X_H][2] = {0};	// 路径线x、y坐标
float x_speed_rate_rt = 2.2;	// 实时x速度比例

/* 赛道元素 */
int16 path_width[MT9V03X_H] = {0};	// 赛道宽度

/* AI追踪 */
int16 track_x_center;	// 追踪中心X坐标
int16 track_x;
int16 detection_box_width;	// 识别框宽度
int16 track_err = 0;	// 追踪误差

/* AI识别 */
uint8 ai_camera_1_data_raw = 0;	// 原始识别结果
uint8 ai_camera_2_data_raw = 0;	// 原始识别结果
_AI_CAMERA_DETECTION_RESULT_ ai_camera_detection_result;	// 识别结果
_AI_CAMERA_DETECTION_RESULT_ ai_camera_detection_result_list[100];	// 识别结果列表
int16 ai_camera_detection_result_list_num = 0;	// 识别结果列表内容数量

/* 标志位 */
/* 程序内部 */
uint8 gyro_calibration_flag = FALSE;	// 陀螺仪校准
uint8 acc_calibration_flag = FALSE;		// 加速度计校准
uint8 euler_angle_flag = FALSE;			// 欧拉角解算标志位
uint8 translate_shift_flag = TRUE;		// 平动位移解算标志位
_CHASSIS_MOTION_ chassis_motion_flag = CHASSIS_STOP;	// 底盘运动方式标志位
uint8 chassis_rotate_finsh_flag = FALSE;				// 底盘旋转结束标志位
uint8 chassis_move_time_count_flag = FALSE;				// 底盘移动计时标志位
uint8 zebra_crossing_path_element_judge_start_time_count_flag = FALSE;	// 斑马线元素开启判断计时标志位
uint8 zebra_crossing_path_element_stop_delay_time_count_flag = FALSE;	// 斑马线元素停车延时计时标志位
uint8 circle_in_time_count_flag = FALSE;				// 圆环入环计时标志位（入环后开始计时，防止入环失败后错误出环）
uint8 circle_out_time_count_flag = TRUE;				// 圆环出环计时标志位（出环后开始计时，防止出环后姿态不好导致错误入环）
uint8 program_time_count_flag = FALSE;					// 程序计时标志位
uint8 debug_time_count_flag = FALSE;					// 调试计时标志位
uint8 speed_control_time_count_flag = FALSE;			// 速度控制计时标志位
uint8 circle_in_flag = 0;								// 进环标志位
uint8 circle_out_flag = 0;								// 出环标志位
_CONTROL_MODE_ control_mode_flag = PATH_CONTROL_MODE;				// 摄像头类型标志位
_CONTROL_MODE_ track_finsh_next_mode_flag = BLOCK_RETRACK_MODE;		// 追踪结束模式切换标志位
_PATH_ELEMENT_ path_element_flag = STRIGHT_PATH;					// 赛道元素标志位
uint8 path_follow_kind_flag = 0;									// 路径循线方式标志位（0：最长白列 1：中线拟合）
/* 使能 */
uint8 circle_path_enable_flag = TRUE;						// 圆环赛道使能标志位
uint8 zebra_path_element_start_judge_enable_flag = TRUE;	// 斑马线判断使能标志位
uint8 ai_camera_0_enable_flag = TRUE;						// AI摄像头0 使能标志位
uint8 supplement_lamp_enable_flag = FALSE;					// 补光灯 使能标志位

/**********************************************************************/

/****************************** 参数 ******************************/

/* PID */
_CHASSIS_PID_ chassis_pid;						// 底盘PID
_CHASSIS_FILTER_ chassis_filter;				// 底盘滤波器   //凭什么叫底盘滤波器
_CURRENT_FILTER_ current_filter;
_PATH_PID_ path_pid;							// 循迹PID
_AI_TRACK_PID_ ai_track_pid;					// 追踪PID

/* 循线 */
int16 mid_x = MT9V03X_W/2;							// 循线开始中点
float path_linear_speed_target[3] = {200,200,200};	// 循迹线速度（缓启动速度 启动最小速度 启动最大速度）（cm/s）	best：{70,130,130}
int16 path_start = 95;								// 路径线提取开始高度
int16 path_end = 30;								// 路径线提取结束高度
int16 control_point[2] = {70 ,50};					// 控制点高度（速度：100：65，100：50 速度：130：70，130：50）
int16 prediction_point = 30;						// 预测点高度：其横坐标将作为下一帧的搜线起点
int16 longest_white_col_x = 0;						// 最长白列X坐标
float x_speed_rate = 2.7; 							// x速度比例 省赛2.2
int16 L_side[MT9V03X_H*3][2] = {0};					// 左边线坐标
int16 R_side[MT9V03X_H*3][2] = {0};					// 右边线坐标
int16 L_side_point_num = 0;							// 左边线点数量
int16 R_side_point_num = 0;							// 右边线点数量
int16 L_frame_point_num = 0;						// 左边框点数量
int16 R_frame_point_num = 0;						// 右边框点数量
int16 L_bend_point[MT9V03X_H*2][2] = {0};			// 左边线弯点坐标
int16 R_bend_point[MT9V03X_H*2][2] = {0};			// 右边线弯点坐标
int16 L_bend_point_num = 0;							// 左边线弯点数量
int16 R_bend_point_num = 0;							// 右边线弯点数量
float path_err_normalization = 0;					// 循线误差归一化
uint32 circle_in_time_count = 0;  					// 入环计时（计时达到后才可以判断出环）
uint32 circle_out_time_count = 100000;  			// 出环计时（计时达到后才可以再次判断入环）
uint32 zebra_crossing_path_element_start_judge_time_count = 0;		// 斑马线元素开启判断计时（计时达到后才可以开始判断斑马线）
uint32 zebra_crossing_path_element_stop_delay_time_count = 0;		// 斑马线元素停车延时计时（计时达到后才可以停车）
uint32 program_time_count = 0;			// 程序计时
uint32 debug_time_count = 0;			// 调试计时
uint32 speed_control_time_count = 0;	// 速度控制计时

/* 赛道元素参数 */
float circle_path_linear_speed_target = 100;		// 圆环循迹线速度（cm/s）    best：100
//int16 circle_check_y = 65;						// linear_speed = 5	 圆环检测线高度（必须小于path_start）
int16 circle_check_y = 60;							// linear_speed = 6.5	 圆环检测线高度（必须小于path_start）
float circle_in_linear_speed_target = 110;			// 入环目标线速度（linear_speed：87.5：79 linear_speed：100：79）
float circle_in_angular_speed_target = 28;			// 入环目标角速度（linear_speed：87.5：28 linear_speed：100：28）
int16 circle_in_angle = 60;							// 入环转动角度
float circle_out_linear_speed_target = 110;			// 出环目标线速度
float circle_out_angular_speed_target = 28;			// 入环目标角速度
int16 circle_out_angle = 60;						// 出环转动角度
int16 side_extract_start_y = 80;					// 边线开始提取高度
int16 side_extract_end_y = 20;						// 边线结束提取高度
int16 side_X_delta_limit[2] = {15,3};				// 边线X差值最大值/最小阈值

/* AI追踪 */
float track_linear_speed_target = 80;			// 追踪线速度
int16 detection_box_width_limit = 20;			// 摄像头识别框宽度阈值
int16 detection_box_width_std = 80;				// 摄像头识别框宽度标准阈值
int16 detection_box_center_limit = 65;			// 摄像头识别框中心误差阈值
int16 rectificate_weight[4] = {1 ,5 ,55 ,85};	// 矫正权重（中线±MT9V03X_W/8 ，中线±2*MT9V03X_W/8 ，中线±3*MT9V03X_W/8 ，中线±4*MT9V03X_W/8）
uint32 sum_weight = 0;							// 加权和
int16 symmetry_rectificate_start_y = 99;		// 对称法矫正图像遍历起始点高度
int16 symmetry_rectificate_end_y = 40;			// 对称法矫正图像遍历结束点高度
float sum_weight_normalization = 0;				// 加权和归一化	
float sum_weight_normalization_limit[2] = {0.94, 0.80};	// 加权和归一化阈值
float frame_white_num_normalization[2] = {0};			// 对称法矫正图像左右边框白点数量归一化
float frame_white_num_normalization_limit = 0.25;		// 对称法矫正图像左右边框白点数量归一化阈值
int16 frame_offset = 15;					// 图像边框偏移量（左框右偏，右框左偏，防止曲率超级大的弯道无法使用对称法进行矫正） 
float rotate_linear_speed = 52.5;			// 绕箱子旋转线速度
float linear_angular_speed_rate = 0.4;		// 线速度/角速度 比例（用于绕箱子转）（rotate_linear_speed：2：0.8，rotate_linear_speed：3：0.4 ）
uint8_t supplement_lamp_color = 0;			// 补光灯颜色

/* 
	单电机PID参数 
	P I D 输出限幅 积分项限幅
*/
/* 速度环 */
#if MOTOR_SPEED_PID_CHOOSE == 0
// 增量式    //12.9 ,6.1 ,1.25   X0.6  7.74 , 3.66 , 0.75   //0,0,0//8.8,6.1,0.98
float PID_SPEED_MOTOR_1[5] = {8.8,6.1,0.98 ,9000 ,500};
float PID_SPEED_MOTOR_2[5] = {8.8,6.1,0.98 ,9000 ,500};
float PID_SPEED_MOTOR_3[5] = {8.8,6.1,0.98 ,9000 ,500};
//float PID_SPEED_MOTOR_1[5] = {18.8*2 ,1.4*2 ,0 ,9000 ,500};	// 后
//float PID_SPEED_MOTOR_2[5] = {14.8*2 ,1.88*2 ,0 ,9000 ,500}; // 左
//float PID_SPEED_MOTOR_3[5] = {14.8*2 ,1.88*2 ,0 ,9000 ,500}; // 右
#elif MOTOR_SPEED_PID_CHOOSE == 1
// 位置式
float PID_SPEED_MOTOR_1[5] = {250 ,0.1 ,400 ,9000 ,500};
float PID_SPEED_MOTOR_2[5] = {250 ,0.1 ,400 ,9000 ,500};
float PID_SPEED_MOTOR_3[5] = {250 ,0.1 ,400 ,9000 ,500};
#endif
/* 电流环 */
#if MOTOR_I_PID_CHOOSE == 0
// 增量式    //12.9 ,6.1 ,1.25   X0.6  7.74 , 3.66 , 0.75   //0,0,0//8.8,6.1,0.98
float PID_I_MOTOR_1[5] = {0,0,0 ,9000 ,500};
float PID_I_MOTOR_2[5] = {0,0,0 ,9000 ,500};
float PID_I_MOTOR_3[5] = {0,0,0 ,9000 ,500};
//float PID_SPEED_MOTOR_1[5] = {18.8*2 ,1.4*2 ,0 ,9000 ,500};	// 后
//float PID_SPEED_MOTOR_2[5] = {14.8*2 ,1.88*2 ,0 ,9000 ,500}; // 左
//float PID_SPEED_MOTOR_3[5] = {14.8*2 ,1.88*2 ,0 ,9000 ,500}; // 右
#elif MOTOR_I_PID_CHOOSE == 1
// 位置式
float PID_I_MOTOR_1[5] = {250 ,0.1 ,400 ,9000 ,500};
float PID_I_MOTOR_2[5] = {250 ,0.1 ,400 ,9000 ,500};
float PID_I_MOTOR_3[5] = {250 ,0.1 ,400 ,9000 ,500};
#endif

/* 
	单电机KARMAN参数
	Q R 
*/
float KARMAN_MOTOR_1[2] = {0.01,0.1}; //Q R Q越小越平滑   R越小越接近(收敛越快);
float KARMAN_MOTOR_2[2] = {0.01,0.1}; //Q R Q越小越平滑   R越小越接近(收敛越快);
float KARMAN_MOTOR_3[2] = {0.01,0.1}; //Q R Q越小越平滑   R越小越接近(收敛越快);

float KARMAN_CURRENT[2] = {0.01,0.1}; //Q R Q越小越平滑   R越小越接近(收敛越快);

/* 
	转动PID参数 
	P I D 输出限幅 积分项限幅
*/
#if ROTATE_PID_CHOOSE == 0
// 增量式 ( 小角度 中角度 大角度 )
float ROTATE_PID[8][5] = {{0 ,0 ,0.005 ,1 ,0.1},{0 ,0 ,0.005 ,1 ,0.1},{0  ,0 ,0.005 ,1.6 ,0.1},{0 ,0 ,0.005 ,1.6 ,0.1},{0 ,0 ,0.005 ,1.8 ,0.1},{0 ,0 ,0.005 ,1.8 ,0.1},{0 ,0 ,0.005 ,2.2 ,0.1},{0 ,0 ,0.005 ,2.2 ,0.1}};
#elif ROTATE_PID_CHOOSE == 1
// 位置式 ( 小角度 中角度 大角度 )
float ROTATE_PID[8][5] = {{0.33 ,0 ,0.04 ,35 ,2},{0.39 ,0 ,0.05 ,45 ,2},{0.42  ,0 ,0.06 ,55 ,2},{0.46 ,0 ,0.08 ,65 ,2},{0.60 ,0 ,0.08 ,75 ,2},{0.80 ,0 ,0.08 ,85 ,2},{1.1 ,0 ,0.08 ,90 ,2},{1.5 ,0 ,0.08 ,150 ,2}};
#endif

/* 
	循迹PID参数 
	P I D 陀螺仪微分项 输出限幅 积分项限幅
*/
#if PATH_PID_CHOOSE == 0
// 增量式 ( 中误差 大误差 超大误差 )
float PATH_PID[3][6] = {{0.020 ,0.3 ,0 ,0.004 ,20 ,1},{0.036 ,0.35 ,0. ,0.0055 ,31 ,1},{0.041 ,0.38 ,0. ,0.0055 ,36 ,1}};	// linear_speed = 100
#elif PATH_PID_CHOOSE == 1
// 位置式
//float PATH_PID[3][6] = {{0.027 ,0 ,0.0035 ,0.0025 ,1 ,0.1},{0.030 ,0 ,0.004 ,0.0030 ,1 ,0.1},{0.032 ,0 ,0.005 ,0.0035 ,1 ,0.1}}; // linear_speed = 5	积分限幅和陀螺仪微分项调整需注意
//float PATH_PID[6][6] = {{0.39 ,0 ,0.9 ,1 ,18 ,2},{0.405 ,0 ,0.9 ,1 ,20 ,2},{0.415 ,0 ,0.97 ,1.1 ,25 ,2},{0.425 ,0 ,1.345 ,1.2 ,42 ,2},{0.41 ,0 ,1.3 ,1.3 ,46 ,2},{0.405 ,0 ,1.395 ,1.3 ,55 ,2}}; // linear_speed = 80-120	积分限幅和陀螺仪微分项调整需注意					// 分段
//float PATH_PID[4][6] = {{0.405 ,0 ,0.9 ,0.005 ,18 ,2},{0.415 ,0 ,0.97 ,0.005 ,25 ,2},{0.425 ,0 ,1.345 ,0.0035 ,42 ,2},{0.405 ,0 ,1.395 ,0.002 ,55 ,2}}; // linear_speed = 80-120	积分限幅和陀螺仪微分项调整需注意															// 模糊
//float PATH_PID[4][6] = {{0.405 ,0 ,0.9 ,0.07 ,18 ,2},{0.425 ,0 ,0.97 ,0.06 ,25 ,2},{0.42 ,0 ,1.345 ,0.05 ,42 ,2},{0.41 ,0 ,1.395 ,0.03 ,55 ,2}}; // linear_speed = 80-120	积分限幅和陀螺仪微分项调整需注意															// 模糊
//float PATH_PID[4][6] = {{0.6 ,0 ,1. ,0.07 ,18 ,2},{0.566 ,0 ,0.97 ,0.06 ,25 ,2},{0.56 ,0 ,1.345 ,0.05 ,42 ,2},{0.55 ,0 ,1.395 ,0.03 ,55 ,2}}; // linear_speed = 80-120	积分限幅和陀螺仪微分项调整需注意															// 模糊
float PATH_PID[4][6] = 
{
//{0.390 ,0 ,2.2 ,0.23 ,45 ,2},
//{0.450 ,0 ,2.1 ,0.22 ,45 ,2},
//{0.550 ,0 ,1.9 ,0.21 ,45 ,2},
//{0.600 ,0 ,1.8 ,0.18  ,45 ,2}}; // 省赛参数														// 模糊
{0.410 ,0 ,2.4 ,0.30 ,45 ,2},
{0.490 ,0 ,2.2 ,0.22 ,45 ,2},
{0.590 ,0 ,1.9 ,0.21 ,45 ,2},
{0.620 ,0 ,1.6 ,0.16 ,45 ,2}}; // linear_speed = 80-120	积分限幅和陀螺仪微分项调整需注意															// 模糊

#endif
	
/* 
	X追踪PID参数 
	P I D 输出限幅 积分项限幅
*/
#if X_AI_TRACK_PID_CHOOSE == 0
// 增量式
float X_AI_TRACK_PID[5] = {0.000 ,0.00565 ,0 ,8 ,1};
#elif X_AI_TRACK_PID_CHOOSE == 1
// 位置式
float X_AI_TRACK_PID[5] = {0.45 ,0 ,0.07 ,35 ,2};
#endif
	
/* 
	Y追踪PID参数 
	P I D 输出限幅 积分项限幅
*/
#if Y_AI_TRACK_PID_CHOOSE == 0
// 增量式
float Y_AI_TRACK_PID[5] = {0.000 ,0.00565 ,0 ,8 ,1};
#elif Y_AI_TRACK_PID_CHOOSE == 1
// 位置式
float Y_AI_TRACK_PID[5] = {0.45 ,0 ,0.07 ,35 ,2};
#endif

/******************************************************************/

/* 标志位初始化 */	
void flag_init(void)
{
	euler_angle_flag = FALSE;	// 欧拉角解算标志位
	translate_shift_flag = TRUE;	// 平动位移解算标志位
	chassis_motion_flag = CHASSIS_MOVE;		// 底盘运动模式标志位
	chassis_rotate_finsh_flag = FALSE;	// 底盘旋转完成标志位
	chassis_move_time_count_flag = FALSE;	// 底盘移动时间标志位
	zebra_crossing_path_element_judge_start_time_count_flag = FALSE;	// 斑马线元素开始判断计时标志位
	zebra_crossing_path_element_stop_delay_time_count_flag = FALSE;	// 斑马线元素停车延时计时标志位
	circle_in_time_count_flag = FALSE;		// 圆环进环后计时标志位
	circle_out_time_count_flag = TRUE;		// 圆环出环后计时标志位
	debug_time_count_flag = FALSE;
	speed_control_time_count_flag = FALSE;
	circle_in_flag = 0;
	circle_out_flag = 0;
	control_mode_flag = PATH_CONTROL_MODE;	// 控制模式标志位
	track_finsh_next_mode_flag = BLOCK_RETRACK_MODE;	// 下一次追踪模式标志位
	path_element_flag = STRIGHT_PATH;	// 赛道类型标志位
	path_follow_kind_flag = 0;	// 赛道循线模式标志位
}
	
/* 变量初始化 */	
void variable_init(void)
{
	mid_x = MT9V03X_W/2;	// 循线开始中点
	longest_white_col_x = 0;	// 最长白列X坐标
	memset(L_side, 0, sizeof(L_side));	// 左边线坐标
	memset(R_side, 0, sizeof(R_side));	// 右边线坐标
	L_side_point_num = 0;		// 左边线点数量
	R_side_point_num = 0;		// 右边线点数量
	L_frame_point_num = 0;	// 左边框点数量
	R_frame_point_num = 0;	// 右边框点数量
	memset(L_bend_point, 0, sizeof(L_bend_point));	// 左边线弯点坐标
	memset(R_bend_point, 0, sizeof(R_bend_point));	// 右边线弯点坐标
	L_bend_point_num = 0;		// 左边线弯点数量
	R_bend_point_num = 0;		// 右边线弯点数量
	circle_in_time_count = 0;  // 入环计时（计时达到后才可以判断出环）
	circle_out_time_count = 100000;  // 出环计时（计时达到后才可以再次判断入环）
	zebra_crossing_path_element_start_judge_time_count = 0;	// 斑马线元素开启判断计时（计时达到后才可以开始判断斑马线）
	zebra_crossing_path_element_stop_delay_time_count = 0;	// 斑马线元素停车延时计时（计时达到后才可以停车）
}
	



