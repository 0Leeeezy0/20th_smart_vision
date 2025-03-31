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

/* AI摄像头1 识别标签 */
typedef enum
{
	wrench = 0,				// 扳手
	soldering_iron = 1,		// 电烙铁
	electrodrill = 2,		// 电钻
	tape_measure = 3,		// 米尺
	screwdriver = 4,		// 螺丝刀
	pliers = 5,				// 签字
	oscillograph = 6,		// 示波器
	multimeter = 7,			// 万用表
	printer = 8,			// 打印机
	keyboard = 9,			// 键盘
	mobilephone = 10,		// 手机
	mouse = 11,				// 鼠标
	headphones = 12,		// 耳机
	monitor = 13,			// 显示器
	speaker = 14			// 音响
}_AI_CAMERA_1_DETECTION_LABLE_;

/* 电机运动控制 */
typedef struct
{
	int16 duty;
	int16 dir;
}_MOTOR_CONTROL_;

/* PID闭环参数 */
typedef struct
{
	float p;
	float i;
	float d;
	float output_limit;
	float i_limit;
	float value;
}_PID_PARAMETERS_;

/* PID闭环变量 */
typedef struct
{
	float delta;
	float now_err;
	float last_err;
	float last_last_err;
	float sigma_err;
}_PID_VARIABLE_;

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
	_PID_PARAMETERS_ motor_1_pid_parameters;
	_PID_VARIABLE_ motor_1_pid_variable;
	_PID_PARAMETERS_ motor_2_pid_parameters;
	_PID_VARIABLE_ motor_2_pid_variable;
	_PID_PARAMETERS_ motor_3_pid_parameters;
	_PID_VARIABLE_ motor_3_pid_variable;
	_PID_PARAMETERS_ rotate_pid_parameters[8];
	_PID_VARIABLE_ rotate_pid_variable;
}_CHASSIS_PID_;

/* 循迹PID */
typedef struct
{
	_PID_PARAMETERS_ path_pid_parameters[4];	
	_PID_VARIABLE_ path_pid_variable;				
}_PATH_PID_;

/* AI追踪PID */
typedef struct
{
	_PID_PARAMETERS_ ai_track_pid_paraments;	
	_PID_VARIABLE_ ai_track_pid_variable;	
}_AI_TRACK_PID_;

/* AI识别结果 */
typedef struct
{
	uint8 result_kind;					// 识别结果类别（0：标签 1：手写字 2：啥都没有）
	uint8 is_move_out;					// 方块推出赛道（0：未推出 1：推出）
	_AI_CAMERA_1_DETECTION_LABLE_ lable;	// 识别标签结果
	uint8 num;							// 识别手写数字结果
}_AI_CAMERA_1_DETECTION_RESULT_;

/* 标志位 */
/* 程序内部 */
extern uint8 gyro_calibration_flag;	// 陀螺仪校准
extern uint8 acc_calibration_flag;	// 加速度计校准
extern uint8 euler_angle_flag;			// 欧拉角解算标志位
extern uint8 translate_shift_flag;				// 平动位移解算标志位
extern _CHASSIS_MOTION_ chassis_motion_flag;	// 底盘运动方式标志位
extern uint8 chassis_rotate_finsh_flag;			// 底盘旋转结束标志位
extern uint8 chassis_move_time_count_flag;				// 底盘移动计时标志位
extern uint8 circle_in_time_count_flag;				// 圆环入环计时标志位
extern _CONTROL_MODE_ control_mode_flag;	// 控制模式标志位
extern _CONTROL_MODE_ track_finsh_next_mode_flag;	// 追踪结束模式切换标志位
extern _PATH_ELEMENT_ path_element_flag;		// 赛道元素标志位
extern uint8 path_follow_kind_flag;				// 路径循线方式标志位（0：最长白列 1：中线拟合）
/* 使能 */
extern uint8 circle_path_enable_flag;	// 圆环赛道使能标志位
extern uint8 ai_camera_0_enable_flag;	// AI摄像头0 使能标志位
extern uint8 ai_camera_1_enable_flag;	// AI摄像头1 使能标志位

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

/* 路径线坐标 */
extern int16 path[MT9V03X_H][2];	// 路径线x、y坐标

/* AI追踪 */
extern int16 track_x_center;	// 追踪中心X坐标
extern int16 detection_box_width;	// 识别框宽度
extern int16 track_err;	// 追踪误差
extern int16 track_x;

/**********************************************************************/

/****************************** 参数 ******************************/

/* 单电机PID参数 */
extern float PID_MOTOR_1[5];
extern float PID_MOTOR_2[5];
extern float PID_MOTOR_3[5];

/* 转动PID参数 */
extern float ROTATE_PID[8][5];

/* 循迹PID参数 */
extern float PATH_PID[4][6];

/* 底盘控制参数 */
extern float chassis_yaw;					// 底盘航向角
extern float chassis_linear_speed;			// 底盘线速度
extern float chassis_angular_speed;			// 底盘角速度
extern float chassis_rotate_angle;			// 底盘转动角度
extern uint32 chassis_move_time_count;  		// 底盘移动计时
extern _CHASSIS_CONTROL_ chassis_control;	// 底盘电机解算参数
extern _CHASSIS_PID_ chassis_pid;			// 底盘PID

/* 循迹控制参数 */
extern _PATH_PID_ path_pid;							// 循迹PID

/* AI追踪控制参数 */
extern _AI_TRACK_PID_ ai_track_pid;	// MCXVISION追踪PID

/* 循迹参数 */
extern int16 mid_x;	// 循线开始中点
extern float path_linear_speed_target;	// 循迹线速度
extern int16 path_start;	// 路径线提取开始高度
extern int16 path_end;	// 路径线提取结束高度
extern int16 L_side[MT9V03X_H*3][2];	// 左边线坐标
extern int16 R_side[MT9V03X_H*3][2];	// 右边线坐标
extern int16 L_side_point_num;		// 左边线点数量
extern int16 R_side_point_num;		// 右边线点数量
extern int16 L_frame_point_num;		// 左边框点数量
extern int16 R_frame_point_num;		// 右边框点数量
extern int16 L_inflection_point[MT9V03X_H*2][2];	// 左边线拐点坐标
extern int16 R_inflection_point[MT9V03X_H*2][2];	// 右边线拐点坐标
extern int8 L_inflection_angle_dir[MT9V03X_H*2];	// 左边线拐点夹角方向（方向垂直：1 方向平行：-1）
extern int8 R_inflection_angle_dir[MT9V03X_H*2];	// 右边线拐点夹角方向（方向垂直：1 方向平行：-1）
extern float L_inflection_y_dir[MT9V03X_H*2];		// 左边线拐点和向量纵坐标方向（方向向上：-1 方向向下：1）
extern float R_inflection_y_dir[MT9V03X_H*2];		// 右边线拐点和向量纵坐标方向（方向向上：-1 方向向下：1）
extern int16 circle_inflection_point[2];			// 圆环拐点坐标（图像中从下至上出现的第一个拐点）
extern int16 L_inflection_point_num;		// 左边线拐点数量
extern int16 R_inflection_point_num;		// 右边线拐点数量
extern int16 L_bend_point[MT9V03X_H*2][2];		// 左边线弯点坐标
extern int16 R_bend_point[MT9V03X_H*2][2];		// 右边线弯点坐标
extern int16 L_bend_point_num;		// 左边线弯点数量
extern int16 R_bend_point_num;		// 右边线弯点数量
extern int16 control_point;	// 控制点高度（速度 3 30 速度 8 45）
extern int16 prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点
extern int16 longest_white_col_x;	// 最长白列坐标
extern uint32 circle_in_time_count;  // 入环计时（计时达到后才可以判断出环）

/* 元素提取参数 */
extern double inflection_point_angle_min[3];	// 拐点最小角度阈值
extern double inflection_point_angle_max[3];	// 拐点最大角度阈值

/* AI追踪 */
extern float track_linear_speed_target;	// 追踪线速度
extern float track_linear_speed_revise;	// 追踪修正线速度
extern int16 detection_box_width_limit;	// AI摄像头识别框宽度阈值
extern int16 detection_box_width_std;	// AI摄像头识别框宽度标准阈值
extern int16 detection_box_center_limit;	// AI摄像头识别框中心阈值 

/* AI识别结果 */
extern _AI_CAMERA_1_DETECTION_RESULT_ ai_camera_1_detection_result;

/******************************************************************/

extern float angle;

#endif