#ifndef _DATA_H_
#define _DATA_H_

#include "common.h"

/* 电机索引 */
typedef enum
{
	MOTOR_1 = 0,
	MOTOR_2 = 1,
	MOTOR_3 = 2
}_MOTOR_NUM_;

/* 底盘运动方式 */
typedef enum
{
	CHASSIS_STOP =  0,
	CHASSIS_MOVE =  1,
	CHASSIS_ANGLE_ROTATE = 2,
	CHASSIS_DEBUG = 3
}_CHASSIS_MOTION_;

/* 控制模式类型 */
typedef enum
{
	PATH_CONTROL_MODE = 0,		// 循迹控制模式
	AI_TRACK_MODE = 1,			// AI追踪控制模式
	BLOCK_RETRACK_MODE = 2,		// 方块侧面重追踪控制模式
	BLOCK_MOVE_OUT_MODE = 3		// 方块推离模式
}_CONTROL_MODE_;

/* 赛道元素 */
typedef enum
{
	STRIGHT_PATH = 0,			// 直道元素
	BEND_PATH = 1,				// 弯道元素
	L_CIRCLE_PATH = 3,			// 左圆环元素
	R_CIRCLE_PATH = 2,			// 右圆环元素
	ZEBRA_CROSSING_PATH = 4		// 斑马线元素
}_PATH_ELEMENT_;

/* AI摄像头识别标签 */
typedef enum
{
	wrench = 0,				// 扳手
	soldering_iron = 1,		// 电烙铁
	electrodrill = 2,		// 电钻
	tape_measure = 3,		// 米尺
	screwdriver = 4,		// 螺丝刀
	pliers = 5,				// 钳子
	oscillograph = 6,		// 示波器
	multimeter = 7,			// 万用表
	printer = 8,			// 打印机
	keyboard = 9,			// 键盘
	mobilephone = 10,		// 手机
	mouse = 11,				// 鼠标
	headphones = 12,		// 耳机
	monitor = 13,			// 显示器
	speaker = 14			// 音响
}_AI_CAMERA_DETECTION_LABLE_;

// 调试模式
typedef enum 
{
	NONE = 0,
	SIN_TRACK_ERR_MODE = 1
}_DEBUG_MODE_;

/* 电机运动控制 */
typedef struct
{
	int16 duty;
	int16 dir;
}_MOTOR_CONTROL_;

/* 底盘运动控制 */
typedef struct
{
	float motor_1_speed;
	float motor_2_speed;
	float motor_3_speed;
	_MOTOR_CONTROL_ motor_1;
	_MOTOR_CONTROL_ motor_2;
	_MOTOR_CONTROL_ motor_3;
}_CHASSIS_CONTROL_;

/* 底盘PID */
typedef struct
{
	_PID_PARAMETERS_ motor_1_speed_pid_parameters;
	_PID_VARIABLE_ motor_1_speed_pid_variable;
	_PID_PARAMETERS_ motor_1_I_pid_parameters;
	_PID_VARIABLE_ motor_1_I_pid_variable;
	
	_PID_PARAMETERS_ motor_2_speed_pid_parameters;
	_PID_VARIABLE_ motor_2_speed_pid_variable;
	_PID_PARAMETERS_ motor_2_I_pid_parameters;
	_PID_VARIABLE_ motor_2_I_pid_variable;
	
	_PID_PARAMETERS_ motor_3_speed_pid_parameters;
	_PID_VARIABLE_ motor_3_speed_pid_variable;
	_PID_PARAMETERS_ motor_3_I_pid_parameters;
	_PID_VARIABLE_ motor_3_I_pid_variable;
	
	_PID_PARAMETERS_ rotate_pid_parameters[8];
	_PID_VARIABLE_ rotate_pid_variable;
}_CHASSIS_PID_;

/* 底盘滤波器 */
typedef struct
{
	_KALMAN_PARAMETERS_ motor_1_karman_parameters;
	_KALMAN_VARIABLE_ motor_1_karman_variable;
	_KALMAN_PARAMETERS_ motor_2_karman_parameters;
	_KALMAN_VARIABLE_ motor_2_karman_variable;
	_KALMAN_PARAMETERS_ motor_3_karman_parameters;
	_KALMAN_VARIABLE_ motor_3_karman_variable;
}_CHASSIS_FILTER_;


/* 电流环滤波器 */
typedef struct
{
    _KALMAN_PARAMETERS_ motor_current_1_karman_parameters;
	_KALMAN_VARIABLE_ motor_current_1_karman_variable;
	_KALMAN_PARAMETERS_ motor_current_2_karman_parameters;
	_KALMAN_VARIABLE_ motor_current_2_karman_variable;
	_KALMAN_PARAMETERS_ motor_current_3_karman_parameters;
	_KALMAN_VARIABLE_ motor_current_3_karman_variable;   
    
}_CURRENT_FILTER_;


    
/* 循迹PID */
typedef struct
{
	_PID_PARAMETERS_ path_pid_parameters[4];	
	_PID_VARIABLE_ path_pid_variable;				
}_PATH_PID_;

/* 追踪PID */
typedef struct
{
	_PID_PARAMETERS_ x_ai_track_pid_paraments;	
	_PID_VARIABLE_ x_ai_track_pid_variable;	
	_PID_PARAMETERS_ y_ai_track_pid_paraments;	
	_PID_VARIABLE_ y_ai_track_pid_variable;	
}_AI_TRACK_PID_;

/* AI识别结果 */
typedef struct
{
	uint8 result_kind;					// 识别结果类别（0：标签 1：手写字 2：啥都没有）
	_AI_CAMERA_DETECTION_LABLE_ lable;	// 识别标签结果
	uint8 num;							// 识别手写数字结果
}_AI_CAMERA_DETECTION_RESULT_;

/* 标志位 */
/* 程序内部 */
extern uint8 gyro_calibration_flag;	// 陀螺仪校准
extern uint8 acc_calibration_flag;	// 加速度计校准
extern uint8 euler_angle_flag;			// 欧拉角解算标志位
extern uint8 translate_shift_flag;				// 平动位移解算标志位
extern _CHASSIS_MOTION_ chassis_motion_flag;	// 底盘运动方式标志位
extern uint8 chassis_rotate_finsh_flag;			// 底盘旋转结束标志位
extern uint8 chassis_move_time_count_flag;				// 底盘移动计时标志位
extern uint8 zebra_crossing_path_element_judge_start_time_count_flag;	// 斑马线元素开启判断计时标志位
extern uint8 zebra_crossing_path_element_stop_delay_time_count_flag;	// 斑马线元素停车延时计时标志位
extern uint8 circle_in_time_count_flag;				// 圆环入环计时标志位（入环后开始计时，防止入环失败后错误出环）
extern uint8 circle_out_time_count_flag;			// 圆环出环计时标志位（出环后开始计时，防止出环后姿态不好导致错误入环）
extern uint8 program_time_count_flag;					// 程序计时标志位
extern uint8 debug_time_count_flag;					// 调试计时标志位
extern uint8 speed_control_time_count_flag;					// 速度控制计时标志位
extern uint8 circle_in_flag;								// 进环标志位
extern uint8 circle_out_flag;								// 出环标志位
extern _CONTROL_MODE_ control_mode_flag;	// 控制模式标志位
extern _CONTROL_MODE_ track_finsh_next_mode_flag;	// 追踪结束模式切换标志位
extern _PATH_ELEMENT_ path_element_flag;		// 赛道元素标志位
extern uint8 path_follow_kind_flag;				// 路径循线方式标志位（0：最长白列 1：中线拟合）
/* 使能 */
extern uint8 circle_path_enable_flag;				// 圆环赛道使能标志位
extern uint8 zebra_path_element_start_judge_enable_flag;	// 斑马线判断使能标志位
extern uint8 ai_camera_0_enable_flag;				// AI摄像头0 使能标志位
extern uint8 supplement_lamp_enable_flag;			// 补光灯 使能标志位

/****************************** 实时数据 ******************************/

/* 编码器计数数值（rad*1024） */
extern int16 encoder_1_count;
extern int16 encoder_2_count;
extern int16 encoder_3_count;

/* 编码器速度（rad/s） */
extern float encoder_1_speed;
extern float encoder_2_speed;
extern float encoder_3_speed;

/* 电机速度（rad/s） */
extern float motor_1_speed;
extern float motor_2_speed;
extern float motor_3_speed;

/* 轮子位移（cm） */
extern float wheel_1_shift;
extern float wheel_2_shift;
extern float wheel_3_shift;

/* 三轴角速度（°/s） */
extern float gyro_x;
extern float gyro_y;
extern float gyro_z;

/* 三轴角加速度（g(m/s^2)） */
extern float acc_x;
extern float acc_y;
extern float acc_z;

/* 欧拉角 */
extern float roll;	// 滚转角
extern float pitch;	// 俯仰角	
extern float yaw;	// 偏航角

/* 灰度传感器（V） */
extern uint16 grayscale;

/* 电池电压（V） */
extern float bat_voltage;

/* 电流adc参数 */
extern float motor_1_I;
extern float motor_2_I;
extern float motor_3_I;
extern float motor_1_V;
extern float motor_2_V;
extern float motor_3_V;
extern float motor_1_V_karman;
extern float motor_2_V_karman;
extern float motor_3_V_karman;
/* 位移解算 */
extern float shift_yaw;
extern float shift_linear_speed;
extern float shift_distance;

/* 图像 */
extern uint8 image_OTSU[MT9V03X_H][MT9V03X_W];
extern uint8 image_dilate[MT9V03X_H][MT9V03X_W];
extern uint8 image_erode[MT9V03X_H][MT9V03X_W];
extern uint8 *PerImg_ip[MT9V03X_H][MT9V03X_W];

/* 循迹 */
extern int16 path_err;
extern float x_speed_rate_rt;	// 实时x速度比例

/* 路径线坐标 */
extern int16 path[MT9V03X_H][2];	// 路径线x、y坐标

/* 赛道元素 */
extern int16 path_width[MT9V03X_H];	// 赛道宽度

/* AI追踪 */
extern int16 track_x_center;	// 追踪中心X坐标
extern int16 detection_box_width;	// 识别框宽度
extern int16 track_err;	// 追踪误差
extern int16 track_x;

/* AI识别 */
extern uint8 ai_camera_1_data_raw;	// 原始识别结果
extern uint8 ai_camera_2_data_raw;	// 原始识别结果
extern _AI_CAMERA_DETECTION_RESULT_ ai_camera_detection_result;
extern _AI_CAMERA_DETECTION_RESULT_ ai_camera_detection_result_list[100];	// 识别结果列表
extern int16 ai_camera_detection_result_list_num;	// 识别结果列表内容数量

/**********************************************************************/

/****************************** 参数 ******************************/

/* 单电机PID参数 */
/* 速度环 */
extern float PID_SPEED_MOTOR_1[5];
extern float PID_SPEED_MOTOR_2[5];
extern float PID_SPEED_MOTOR_3[5];
/* 电流环 */
extern float PID_I_MOTOR_1[5];
extern float PID_I_MOTOR_2[5];
extern float PID_I_MOTOR_3[5];

/* 单电机KARMAN参数 */
extern float KARMAN_MOTOR_1[2];
extern float KARMAN_MOTOR_2[2];
extern float KARMAN_MOTOR_3[2];

/* 电流KARMAN参数 */
extern float KARMAN_CURRENT[2];    //Q R Q越小越平滑   R越小越接近(收敛越快);

/* 转动PID参数 */
extern float ROTATE_PID[8][5];

/* 循迹PID参数 */
extern float PATH_PID[4][6];


/* 追踪PID参数 */
extern float X_AI_TRACK_PID[5];
extern float Y_AI_TRACK_PID[5];

/* 底盘控制参数 */
extern float chassis_yaw;					// 底盘航向角
extern float chassis_linear_speed;			// 底盘线速度
extern float chassis_angular_speed;			// 底盘角速度
extern float chassis_rotate_angle;			// 底盘转动角度
extern uint32 chassis_move_time_count;  	// 底盘移动计时
extern _CHASSIS_CONTROL_ chassis_control;	// 底盘电机解算参数
extern _CHASSIS_PID_ chassis_pid;			// 底盘PID
extern _CHASSIS_FILTER_ chassis_filter;		// 底盘滤波器
extern _CURRENT_FILTER_ current_filter;		// 电流环滤波器
/* 循迹控制参数 */
extern _PATH_PID_ path_pid;							// 循迹PID

/* 追踪控制参数 */
extern _AI_TRACK_PID_ ai_track_pid;	// 追踪PID

/* 循迹参数 */
extern int16 mid_x;	// 循线开始中点
extern float path_linear_speed_target[3];	// 循迹线速度
extern int16 path_start;	// 路径线提取开始高度
extern int16 path_end;	// 路径线提取结束高度
extern int16 control_point[2];	// 控制点高度（速度 3 30 速度 8 45）
extern int16 prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点
extern int16 longest_white_col_x;	// 最长白列坐标
extern float x_speed_rate;			// x速度比例
extern int16 L_side[MT9V03X_H*3][2];	// 左边线坐标
extern int16 R_side[MT9V03X_H*3][2];	// 右边线坐标
extern int16 L_side_point_num;		// 左边线点数量
extern int16 R_side_point_num;		// 右边线点数量
extern int16 L_frame_point_num;		// 左边框点数量
extern int16 R_frame_point_num;		// 右边框点数量
extern int16 L_bend_point[MT9V03X_H*2][2];		// 左边线弯点坐标
extern int16 R_bend_point[MT9V03X_H*2][2];		// 右边线弯点坐标
extern int16 L_bend_point_num;		// 左边线弯点数量
extern int16 R_bend_point_num;		// 右边线弯点数量
extern float path_err_normalization;	// 循线误差归一化
extern uint32 circle_in_time_count;  // 入环计时（计时达到后才可以判断出环）
extern uint32 circle_out_time_count;  // 出环计时（计时达到后才可以再次判断入环）
extern uint32 zebra_crossing_path_element_start_judge_time_count;	// 斑马线元素开启判断计时（计时达到后才可以开始判断斑马线）
extern uint32 zebra_crossing_path_element_stop_delay_time_count;	// 斑马线元素停车延时计时（计时达到后才可以停车）
extern uint32 program_time_count;	// 程序计时
extern uint32 debug_time_count;	// 调试计时
extern uint32 speed_control_time_count;	// 速度控制计时

/* 赛道元素参数 */
extern float circle_path_linear_speed_target;			// 圆环循迹线速度（cm/s）
extern int16 circle_check_y;		// 圆环检测线高度
extern float circle_in_linear_speed_target;	// 入环目标线速度
extern float circle_in_angular_speed_target;	// 入环目标角速度
extern int16 circle_in_angle;	// 入环转动角度
extern float circle_out_linear_speed_target;	// 出环目标线速度
extern float circle_out_angular_speed_target;	// 入环目标角速度
extern int16 circle_out_angle;	// 出环转动角度
extern int16 side_extract_start_y;	// 边线开始提取高度
extern int16 side_extract_end_y;		// 边线结束提取高度
extern int16 side_X_delta_limit[2];	// 边线X差值最大值/最小阈值

/* AI追踪 */
extern float track_linear_speed_target;	// 追踪线速度
extern int16 detection_box_width_limit;	// AI摄像头识别框宽度阈值
extern int16 detection_box_width_std;	// AI摄像头识别框宽度标准阈值
extern int16 detection_box_center_limit;	// AI摄像头识别框中心阈值 
extern int16 rectificate_weight[4];	// 矫正权重（中线±MT9V03X_W/8 ，中线±2*MT9V03X_W/8 ，中线±3*MT9V03X_W/8 ，中线±4*MT9V03X_W/8）
extern int16 symmetry_rectificate_start_y;	// 对称法矫正图像遍历起始点高度
extern int16 symmetry_rectificate_end_y;		// 对称法矫正图像遍历结束点高度
extern uint32 sum_weight;	// 加权和
extern float sum_weight_normalization;	// 加权和归一化
extern float sum_weight_normalization_limit[2];	// 加权和归一化阈值
extern float frame_white_num_normalization[2];	// 对称法矫正图像边框白点数量归一化
extern float frame_white_num_normalization_limit;	// 对称法矫正图像边框白点数量归一化阈值
extern int16 frame_offset;	// 图像边框偏移量（左框右偏，右框左偏，防止曲率超级大的圆环无法使用对称法进行矫正） 
extern float rotate_linear_speed;	// 绕箱子旋转线速度
extern float linear_angular_speed_rate;	// 线速度/角速度 比例（用于绕箱子转）
extern float supplement_lamp_brightness;		// 补光灯亮度
extern uint8_t supplement_lamp_color;			// 补光灯颜色

/******************************************************************/

/* 标志位初始化 */	
void flag_init(void);

/* 变量初始化 */	
void variable_init(void);

#endif