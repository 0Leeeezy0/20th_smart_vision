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
uint8 translate_shift_flag = TRUE;				// 平动位移解算标志位
_CHASSIS_MOTION_ chassis_motion_flag = CHASSIS_STOP;	// 底盘运动方式标志位
uint8 chassis_rotate_finsh_flag = FALSE;				// 底盘旋转结束标志位
uint8 chassis_move_time_count_flag = FALSE;				// 底盘移动计时标志位
uint8 zebra_crossing_path_element_judge_start_time_count_flag = FALSE;	// 斑马线元素开启判断计时标志位
uint8 zebra_crossing_path_element_stop_delay_time_count_flag = FALSE;	// 斑马线元素停车延时计时标志位
uint8 circle_in_time_count_flag = FALSE;				// 圆环入环计时标志位（入环后开始计时，防止入环失败后错误出环）
uint8 circle_out_time_count_flag = TRUE;				// 圆环出环计时标志位（出环后开始计时，防止出环后姿态不好导致错误入环）
uint8 program_time_count_flag = FALSE;					// 程序计时标志位
uint8 circle_in_flag = 0;								// 进环标志位
uint8 circle_out_flag = 0;								// 出环标志位
_CONTROL_MODE_ control_mode_flag = PATH_CONTROL_MODE;	// 摄像头类型标志位
_CONTROL_MODE_ track_finsh_next_mode_flag = BLOCK_RETRACK_MODE;	// 追踪结束模式切换标志位
_PATH_ELEMENT_ path_element_flag = STRIGHT_PATH;			// 赛道元素标志位
uint8 path_follow_kind_flag = 0;			// 路径循线方式标志位（0：最长白列 1：中线拟合）
/* 使能 */
uint8 circle_path_enable_flag = TRUE;	// 圆环赛道使能标志位
uint8 zebra_path_element_start_judge_enable_flag = TRUE;	// 斑马线判断使能标志位
uint8 ai_camera_0_enable_flag = TRUE;	// AI摄像头0 使能标志位
uint8 ai_camera_1_enable_flag = TRUE;	// AI摄像头1 使能标志位

/**********************************************************************/

/****************************** 参数 ******************************/

/* PID */
_CHASSIS_PID_ chassis_pid;						// 底盘
_PATH_PID_ path_pid;							// 循迹
_AI_TRACK_PID_ ai_track_pid;					// AI追踪

/* 循线 */
int16 mid_x = MT9V03X_W/2;	// 循线开始中点
float path_linear_speed_target = 100;	// 循迹线速度（cm/s）
int16 path_start = 95;			// 路径线提取开始高度
int16 path_end = 30;			// 路径线提取结束高度
int16 control_point[2] = {72 ,50};		// 控制点高度（速度：3：40，40 速度：5：65，45 速度：6.5：70，47）
int16 prediction_point = 30;	// 预测点高度：其横坐标将作为下一帧的搜线起点
int16 longest_white_col_x = 0;	// 最长白列X坐标
int16 L_side[MT9V03X_H*3][2] = {0};	// 左边线坐标
int16 R_side[MT9V03X_H*3][2] = {0};	// 右边线坐标
int16 L_side_point_num = 0;		// 左边线点数量
int16 R_side_point_num = 0;		// 右边线点数量
int16 L_frame_point_num = 0;	// 左边框点数量
int16 R_frame_point_num = 0;	// 右边框点数量
int16 L_bend_point[MT9V03X_H*2][2] = {0};	// 左边线弯点坐标
int16 R_bend_point[MT9V03X_H*2][2] = {0};	// 右边线弯点坐标
int16 L_bend_point_num = 0;		// 左边线弯点数量
int16 R_bend_point_num = 0;		// 右边线弯点数量
float path_curvature_normalization = 0;	// 赛道曲率归一化
float path_curvature_normalization_max = 0.25;	// 赛道曲率归一化最大值
uint32 circle_in_time_count = 0;  // 入环计时（计时达到后才可以判断出环）
uint32 circle_out_time_count = 100000;  // 出环计时（计时达到后才可以再次判断入环）
uint32 zebra_crossing_path_element_start_judge_time_count = 0;	// 斑马线元素开启判断计时（计时达到后才可以开始判断斑马线）
uint32 zebra_crossing_path_element_stop_delay_time_count = 0;	// 斑马线元素停车延时计时（计时达到后才可以停车）
uint32 program_time_count = 0;	// 程序计时

/* 赛道元素参数 */
//int16 circle_check_y = 65;					// linear_speed = 5	 圆环检测线高度（必须小于path_start）
int16 circle_check_y = 60;					// linear_speed = 6.5	 圆环检测线高度（必须小于path_start）
float circle_in_linear_speed_target = 79;	// 入环目标线速度（linear_speed：87.5：79 linear_speed：100：79）
float circle_in_angular_speed_target = 28;	// 入环目标角速度（linear_speed：87.5：28 linear_speed：100：28）
int16 circle_in_angle = 60;	// 入环转动角度
float circle_out_linear_speed_target = 79;	// 出环目标线速度
float circle_out_angular_speed_target = 28;	// 入环目标角速度
int16 circle_out_angle = 60;	// 出环转动角度
int16 side_extract_start_y = 80;	// 边线开始提取高度
int16 side_extract_end_y = 20;		// 边线结束提取高度
int16 side_X_delta_limit[2] = {15,3};	// 边线X差值最大值/最小阈值

/* AI追踪 */
float track_linear_speed_target = 43.75;	// 追踪线速度
float track_linear_speed_revise = 8.75;	// 追踪修正线速度
int16 detection_box_width_limit = 25;	// 摄像头识别框宽度阈值
int16 detection_box_width_std = 80;	// 摄像头识别框宽度标准阈值
int16 detection_box_center_limit = 80;	// 摄像头识别框中心误差阈值
int16 rectificate_weight[4] = {1 ,5 ,55 ,85};	// 矫正权重（中线±MT9V03X_W/8 ，中线±2*MT9V03X_W/8 ，中线±3*MT9V03X_W/8 ，中线±4*MT9V03X_W/8）
uint32 sum_weight = 0;	// 加权和
int16 symmetry_rectificate_start_y = 99;	// 对称法矫正图像遍历起始点高度
int16 symmetry_rectificate_end_y = 40;		// 对称法矫正图像遍历结束点高度
float sum_weight_normalization = 0;	// 加权和归一化	
float sum_weight_normalization_limit[2] = {0.90, 0.80};	// 加权和归一化阈值
float frame_white_num__normalization[2] = {0};	// 对称法矫正图像左右边框白点数量归一化
float frame_white_num__normalization_limit = 0.25;	// 对称法矫正图像左右边框白点数量归一化阈值
int16 frame_offset = 15;	// 图像边框偏移量（左框右偏，右框左偏，防止曲率超级大的弯道无法使用对称法进行矫正） 
float rotate_linear_speed = 3;	// 绕箱子旋转线速度
float linear_angular_speed_rate = 0.37;	// 线速度/角速度 比例（用于绕箱子转）（rotate_linear_speed：2：0.8，rotate_linear_speed：3：0.4 ）

/* 
	单电机PID参数 
	P I D 输出限幅 积分项限幅
*/
#if MOTOR_PID_CHOOSE == 0
// 增量式
//float PID_MOTOR_1[5] = {880 ,250 ,0 ,9000 ,500};
//float PID_MOTOR_2[5] = {880 ,250 ,0 ,9000 ,500};
//float PID_MOTOR_3[5] = {880 ,250 ,0 ,9000 ,500};
float PID_MOTOR_1[5] = {200 ,40 ,0 ,9000 ,500};	// 后
float PID_MOTOR_2[5] = {160 ,60 ,0 ,9000 ,500}; // 左
float PID_MOTOR_3[5] = {160 ,60 ,0 ,9000 ,500}; // 右
#elif MOTOR_PID_CHOOSE == 1
// 位置式
float PID_MOTOR_1[5] = {250 ,0.1 ,400 ,9000 ,500};
float PID_MOTOR_2[5] = {250 ,0.1 ,400 ,9000 ,500};
float PID_MOTOR_3[5] = {250 ,0.1 ,400 ,9000 ,500};
#endif

/* 
	转动PID参数 
	P I D 输出限幅 积分项限幅
*/
#if ROTATE_PID_CHOOSE == 0
// 增量式 ( 小角度 中角度 大角度 )
float ROTATE_PID[8][5] = {{0 ,0 ,0.005 ,1 ,0.1},{0 ,0 ,0.005 ,1 ,0.1},{0  ,0 ,0.005 ,1.6 ,0.1},{0 ,0 ,0.005 ,1.6 ,0.1},{0 ,0 ,0.005 ,1.8 ,0.1},{0 ,0 ,0.005 ,1.8 ,0.1},{0 ,0 ,0.005 ,2.2 ,0.1},{0 ,0 ,0.005 ,2.2 ,0.1}};
#elif ROTATE_PID_CHOOSE == 1
// 位置式 ( 小角度 中角度 大角度 )
float ROTATE_PID[8][5] = {{0.007 ,0 ,0.008 ,1 ,0.1},{0.012 ,0 ,0.008 ,1.3 ,0.1},{0.017  ,0 ,0.008 ,2.0 ,0.1},{0.027 ,0 ,0.008 ,2.2 ,0.1},{0.036 ,0 ,0.008 ,2.7 ,0.1},{0.047 ,0 ,0.008 ,3.0 ,0.1},{0.056 ,0 ,0.008 ,3.5 ,0.1},{0.067 ,0 ,0.008 ,4.5 ,0.1}};
#endif

/* 
	循迹PID参数 
	P I D 陀螺仪微分项 输出限幅 积分项限幅
*/
#if PATH_PID_CHOOSE == 0
// 增量式 ( 小误差 中误差 大误差 超大误差 )
// float PATH_PID[6] = {0.040 ,0.0026 ,0.005 ,0.005 ,0.8 ,1};	// linear_speed = 3
// float PATH_PID[6] = {0.041 ,0.0038 ,0.00949 ,0.0055 ,1 ,1};	// linear_speed = 6
float PATH_PID[4][6] = {{0.000 ,0.00565 ,0 ,0.004 ,8 ,1},{0.036 ,0.039 ,0.1 ,0.0055 ,1.1 ,1},{0.041 ,0.040 ,0.1 ,0.0055 ,1.2 ,1},{0.043 ,0.0043 ,0.1 ,0.0055 ,1.2 ,1}};	// linear_speed = 6t
#elif PATH_PID_CHOOSE == 1
// 位置式
//float PATH_PID[3][6] = {{0.027 ,0 ,0.0035 ,0.0025 ,1 ,0.1},{0.030 ,0 ,0.004 ,0.0030 ,1 ,0.1},{0.032 ,0 ,0.005 ,0.0035 ,1 ,0.1}}; // linear_speed = 5	积分限幅和陀螺仪微分项调整需注意
float PATH_PID[3][6] = {{0.026 ,0 ,0.0035 ,0.0025 ,1 ,0.1},{0.0305 ,0 ,0.008 ,0.0050 ,1.1 ,0.1},{0.0325 ,0 ,0.009 ,0.0045 ,1.2 ,0.1}}; // linear_speed = 6	积分限幅和陀螺仪微分项调整需注意
	
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
	



