#ifndef _DATA_H_
#define _DATA_H_

/* 逐飞库头文件 */
#include "zf_common_headfile.h"
#include "zf_common_debug.h"
#include "isr.h"

/* DOG库头文件 */
#include "DOG_motor.h"
#include "DOG_data.h"
#include "DOG_vofa.h"
#include "DOG_sensor.h"
#include "DOG_solve.h"
#include "DOG_cv.h"
#include "DOG_path.h"
#include "DOG_filter.h"
#include "DOG_pid.h"
#include "DOG_menu.h"
#include "DOG_timer.h"
#include "DOG_data.h"

<<<<<<< HEAD
/* 底盘运动方式 */
typedef enum
{
	CHASSIS_STOP =  0,
	CHASSIS_MOVE =  1,
	CHASSIS_ANGLE_ROTATE = 2,
	CHASSIS_DEBUG = 3
}_CHASSIS_MOTION_;
=======
/* 枚举定义 */
/* 控制类型 */
/* 赛道状态 */
typedef enum _path_state_{
	common_path = 0,			// 普通赛道
	L_circle_in = 1,			// 左圆环进环
	R_circle_in = 2,			// 右圆环进环
	L_circle = 3,				// 左圆环内
	R_circle = 4,				// 右圆环内
	L_circle_out = 5,			// 左圆环出环
	R_circle_out = 6,			// 右圆环出环
	zebra_path = 7,				// 斑马线赛道
	zebra_path_stop = 8,		// 斑马线赛道停车
	box_first_track = 9,		// 箱子一次定位
	box_calibration = 10,		// 箱子矫正
	box_inv_calibration = 11,	// 箱子逆矫正
	box_second_track = 12,		// 箱子二次定位
	box_fxxk = 13,				// 推箱子
	path_back = 14,				// 回赛道
}_path_state_;
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

typedef enum _control_kind_{
	Angle2Inv2Speed = 0,	// 角度环->运动学逆解算->速度环
	X2Inv2Speed = 1,		// 箱子X->运动学逆解算->速度环
	Y2Inv2Speed = 2,		// 箱子Y->运动学逆解算->速度环
	XY2Inv2Speed = 3,		// 箱子XY->运动学逆解算->速度环
	Inv2Speed = 4,			// 运动学逆解算->速度环
	Speed = 5,				// 纯速度环
	PWM = 6,				// 纯PWM控制
	Stop = 7,				// 电机停车
}_control_kind_;

/* AI摄像头序号 */
typedef enum _ai_camera_idx_{
	AI_CAMERA_0 = 0,		// AI摄像头0
	AI_CAMERA_1 = 1,		// AI摄像头1
	AI_CAMERA_2 = 2,		// AI摄像头2
}_ai_camera_idx_;		

/* AI摄像头识别标签 */
<<<<<<< HEAD
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

/* 电机运动控制 */
typedef struct
{
	uint16 duty;
	uint16 dir;
}_MOTOR_CONTROL_;
=======
typedef enum _ai_lable_{
	wrench = 0x01,				// 扳手			右
	soldering_iron = 0x02,		// 电烙铁		右
	electrodrill = 0x03,		// 电钻			右
	tape_measure = 0x04,		// 米尺			右
	screwdriver = 0x05,			// 螺丝刀		右
	pliers = 0x06,				// 钳子			右
	oscillograph = 0x07,		// 示波器		右
	multimeter = 0x08,			// 万用表		右
	printer = 0x09,				// 打印机		左
	keyboard = 0x0A,			// 键盘			左
	mobilephone = 0x0B,			// 手机			左
	mouse = 0x0C,				// 鼠标			左
	headphones = 0X0D,			// 耳机			左
	monitor = 0X0E,				// 显示器		左
	speaker = 0X0F,				// 音响			左
	other = 0X10,				// 其他（数字）	
}_ai_lable_;

/* 结构体定义 */
typedef struct _ai_camera_detection_result_{
	_bool_ ai_camera_init_flag[2];		// AI摄像头初始化完成标志位
	_bool_ tool_detection_finsh_flag;	// 工具识别完成标志位
	_bool_ num_detection_finsh_flag;	// 数字识别完成标志位
	uint8 tool_raw;		// 工具识别结果原始值
	uint8 num_raw;		// 数字识别结果原始值
	_ai_lable_ tool;	// 工具识别结果
	uint8 num;			// 数字识别结果
	/*
		发送识别信号后，等待识别完成，标志位置True,再完成箱子所有步骤后，标志位置False
		只有当两个标志位都为True时才进入箱子步骤
	*/
}_ai_camera_detection_result_;

/* 类定义 */
extern DOG_MOTOR motor_1;					// 电机1
extern DOG_MOTOR motor_2;					// 电机2
extern DOG_MOTOR motor_3;					// 电机3
extern DOG_ENCODER encoder_1;				// 编码器1
extern DOG_ENCODER encoder_2;				// 编码器2
extern DOG_ENCODER encoder_3;				// 编码器3
extern DOG_CURRENT current_1;				// 电流采样1
extern DOG_CURRENT current_2;				// 电流采样2
extern DOG_CURRENT current_3;				// 电流采样3
extern DOG_VOLTAGE gray_sensor;				// 灰度传感器
extern DOG_VOLTAGE bat_voltage;				// 电池电压检测
extern DOG_KARMAN_FILTER current_1_karman;	// 电流采样1 卡尔曼滤波 
extern DOG_KARMAN_FILTER current_2_karman;	// 电流采样2 卡尔曼滤波 
extern DOG_KARMAN_FILTER current_3_karman;	// 电流采样3 卡尔曼滤波 
extern DOG_PID motor_1_pid;					// 电机PID1
extern DOG_PID motor_2_pid;					// 电机PID2
extern DOG_PID motor_3_pid;					// 电机PID3
extern DOG_PID current_1_pid;				// 电机电流PID1
extern DOG_PID current_2_pid;				// 电机电流PID2
extern DOG_PID current_3_pid;				// 电机电流PID3
extern DOG_PID path_pid;						// 路径PID
extern DOG_PID path_gyroz_pid;				// 路径陀螺仪PID
extern DOG_PID rotate_pid;					// 旋转PID
extern DOG_PID box_x_pid;					// 箱子X PID
extern DOG_PID box_y_pid;					// 箱子Y PID
extern DOG_VOFA wireless_vofa;				// 无线串口VOFA
extern DOG_IMU imu660ra;						// IMU660RA陀螺仪
extern DOG_SOLVE euler_angle_solve;			// 欧拉角解算
extern DOG_SOLVE rotate_euler_angle_solve;	// 旋转欧拉角解算
extern DOG_SOLVE circle_euler_angle_solve;	// 圆环欧拉角解算
extern DOG_SOLVE box_euler_angle_solve;		// 箱子欧拉角解算
extern DOG_SOLVE chassis_solve;				// 底盘解算
extern DOG_SOLVE displacement_solve;			// 位移解算
extern DOG_TIMER zebra_path_timer;			// 斑马线计时器
extern DOG_TIMER circle_in_timer;			// 圆环入环计时器（入环后开始计时，计时超过阈值时间才允许进入出环状态）
extern DOG_TIMER circle_out_timer;			// 圆环出环计时器（出环后开始计时，计时超过阈值时间才允许进入进环状态）
extern DOG_CV dog_cv;						// 计算机视觉
extern DOG_PATH dog_path;					// 循迹
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

/* 使能标志位 */
extern _bool_ circle_enable_flag;			// 圆环 使能标志位
extern _bool_ zebra_enable_flag;			// 斑马线 使能标志位
extern _bool_ ai_camera_0_enable_flag;		// AI相机0 使能标志位
extern _bool_ ai_camera_1_enable_flag;		// AI相机1 使能标志位
extern _bool_ ai_camera_2_enable_flag;		// AI相机2 使能标志位
extern _bool_ supplement_lamp_enable_flag;	// 补光灯 使能标志位

/* 完成标志位 */
extern _bool_ rotate_finsh_flag;		// 旋转完成标志位
extern _bool_ box_X_finsh_flag;			// 箱子X定位完成标志位
extern _bool_ box_Y_finsh_flag;			// 箱子Y定位完成标志位
extern _bool_ box_XY_finsh_flag;		// 箱子XY定位完成标志位

/* 初始化标志位 */
extern _bool_ ai_camera_0_init_flag;					// AI摄像头0 初始化标志位

/* 全局变量 */
/* 赛道提取 */
extern int16 path_err;					// 路径误差
extern uint16 path_start;				// 路径线起始高度
extern uint16 path_end;					// 路径线结束高度
extern uint16 side_extract_start_y;		// 边线提取起始高度
extern uint16 side_extract_end_y;		// 边线提取结束高度
extern uint16 prediction_point;			// 预测点高度：其横坐标将作为下一帧的搜线起点
extern uint16 control_point[2];			// 控制点高度（0：最长白列；1：路径线提取）
/* 圆环 */
extern uint16 circle_check_y;			// 圆环检测线高度
extern uint16 side_x_delta_range[2];	// 边线X差值阈值范围
/* 斑马线 */
extern uint16 zebra_check_y;			// 斑马线检测线高度
extern uint16 zebra_stop_distance;  	// 斑马线停车距离
/* 赛道其他 */
extern _path_state_ path_state;			// 赛道状态
extern _path_state_ last_path_state;	// 上一次赛道状态
/* 控制 */
extern _control_kind_ control_kind;			// 控制类型
extern float wheel_speed_target[3];			// 轮子目标速度
extern float motor_current_target[3];		// 电机电流目标值
extern float motor_pwm_duty[3];		        // 电机PWM占空比
extern _move_solve_kind_ move_solve_kind;	// 运动解算类型
extern float linear_speed_target;			// 目标线速度
extern float translation_yaw_target;		// 目标平动角度
extern float x_speed_target;				// 目标x速度
extern float y_speed_target;				// 目标y速度
extern float angular_speed_target;			// 目标旋转速度
extern float x_speed_rate;					// x速度比例（目标x速度/目标旋转速度）
extern float rotation_yaw_target;			// 目标旋转角度	
extern float data_1;						// 运动学逆解算参数1（线速度/X速度）
extern float data_2;						// 运动学逆解算参数2（航向角/Y速度）
/* 箱子 */
extern int16 detection_center_err;						// 识别框中心误差
extern uint8 detection_box_width;						// 识别框宽度
extern uint8 detection_box_width_limit;					// 识别框宽度阈值（大于此阈值才可以进入箱子追踪模式）
extern uint8 detection_box_width_target;				// 识别框目标宽度
extern uint8 detection_box_height;						// 识别框高度度
extern uint8 detection_box_height_limit;				// 识别框高度阈值（大于此阈值才可以进入箱子追踪模式）
extern int16 detection_box_center_x;					// 识别框中心横坐标
extern uint16 detection_box_center_x_limit;				// 识别框中心横坐标阈值（在阈值范围内才可以进入箱子追踪模式）
extern _ai_camera_detection_result_ detection_result;	// 识别结果
extern _ai_camera_detection_result_ detection_result_list[100];	// 识别结果列表
extern uint8 detection_result_num;						// 识别结果列表数量
extern uint16 rectificate_weight[4];					// 矫正权重（中线±MT9V03X_W/8 ，中线±2*MT9V03X_W/8 ，中线±3*MT9V03X_W/8 ，中线±4*MT9V03X_W/8）
extern uint32 sum_weight;								// 加权和
extern uint16 symmetry_rectificate_start_y;				// 对称法矫正图像遍历起始点高度
extern uint16 symmetry_rectificate_end_y;				// 对称法矫正图像遍历结束点高度
extern float sum_weight_normalization;					// 加权和归一化	
extern float sum_weight_normalization_limit[2];			// 加权和归一化阈值
extern float frame_white_num_normalization[2];			// 对称法矫正图像左右边框白点数量归一化
extern float frame_white_num_normalization_limit;		// 对称法矫正图像左右边框白点数量归一化阈值
extern uint16 frame_offset;								// 图像边框偏移量（左框右偏，右框左偏，防止曲率超级大的弯道无法使用对称法进行矫正） 
extern float last_box_distance;							// 上一个箱子的路程
/* 速度/角度 */
extern float path_y_speed_target;				// 目标循迹Y速度
extern float circle_y_speed_target;				// 出入环目标Y速度
extern float circle_angular_speed_target;		// 出入环目标角速度
extern float circle_angle_target;				// 出入环目标转动角度
extern float box_x_speed_target;				// 箱子目标X速度
extern float box_x_angular_speed_rate;			// 箱子 转动速度/X速度 比例
extern float box_fxxk_y_speed_target;			// 推箱子Y速度目标值

<<<<<<< HEAD
/* 循迹PID */
typedef struct
{
	_PID_PARAMETERS_ path_pid_parameters[3];	
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
extern uint8 circle_in_flag;								// 进环标志位
extern uint8 circle_out_flag;								// 出环标志位
extern _CONTROL_MODE_ control_mode_flag;	// 控制模式标志位
extern _CONTROL_MODE_ track_finsh_next_mode_flag;	// 追踪结束模式切换标志位
extern _PATH_ELEMENT_ path_element_flag;		// 赛道元素标志位
extern uint8 path_follow_kind_flag;				// 路径循线方式标志位（0：最长白列 1：中线拟合）
/* 使能 */
extern uint8 circle_path_enable_flag;	// 圆环赛道使能标志位
extern uint8 zebra_path_element_start_judge_enable_flag;	// 斑马线判断使能标志位
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
extern float PID_MOTOR_1[5];
extern float PID_MOTOR_2[5];
extern float PID_MOTOR_3[5];

/* 转动PID参数 */
extern float ROTATE_PID[8][5];

/* 循迹PID参数 */
extern float PATH_PID[3][6];
=======
/* PID参数 */
// 电机
extern float MOTOR_1_PID[5];
extern float MOTOR_2_PID[5];
extern float MOTOR_3_PID[5];
// 电流
extern float I_1_PID[5];
extern float I_2_PID[5];
extern float I_3_PID[5];
// 循线
extern float PATH_RANGE[2][3];
extern float PATH_PID[4][6];
// 旋转
extern float ROTATE_RANGE[3];
extern float ROTATE_PID[4][5];						  
// BOX X
extern float BOX_X_RANGE[3];	
extern float BOX_X_PID[4][5];						  
// BOX Y
extern float BOX_Y_RANGE[3];		
extern float BOX_Y_PID[4][5];
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

/* KARMAN滤波器参数 */
extern float MOTOR_1_KARMAN[2];
extern float MOTOR_2_KARMAN[2];
extern float MOTOR_3_KARMAN[2];
extern float I_KARMAN[2];

/* 模糊PID 规则表 */
extern _fuzzy_subset_ fuzzy_rules[8][8];

<<<<<<< HEAD
/* AI追踪控制参数 */
extern _AI_TRACK_PID_ ai_track_pid;	// MCXVISION追踪PID

/* 循迹参数 */
extern int16 mid_x;	// 循线开始中点
extern float path_linear_speed_target;	// 循迹线速度
extern int16 path_start;	// 路径线提取开始高度
extern int16 path_end;	// 路径线提取结束高度
extern int16 control_point[2];	// 控制点高度（速度 3 30 速度 8 45）
extern int16 prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点
extern int16 longest_white_col_x;	// 最长白列坐标
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
extern float path_curvature_normalization;	// 赛道曲率归一化
extern float path_curvature_normalization_max;	// 赛道曲率归一化最大值
extern uint32 circle_in_time_count;  // 入环计时（计时达到后才可以判断出环）
extern uint32 circle_out_time_count;  // 出环计时（计时达到后才可以再次判断入环）
extern uint32 zebra_crossing_path_element_start_judge_time_count;	// 斑马线元素开启判断计时（计时达到后才可以开始判断斑马线）
extern uint32 zebra_crossing_path_element_stop_delay_time_count;	// 斑马线元素停车延时计时（计时达到后才可以停车）
extern uint32 program_time_count;	// 程序计时

/* 赛道元素参数 */
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
extern float track_linear_speed_revise;	// 追踪修正线速度
extern int16 detection_box_width_limit;	// AI摄像头识别框宽度阈值
extern int16 detection_box_width_std;	// AI摄像头识别框宽度标准阈值
extern int16 detection_box_center_limit;	// AI摄像头识别框中心阈值 
extern int16 rectificate_weight[4];	// 矫正权重（中线±MT9V03X_W/8 ，中线±2*MT9V03X_W/8 ，中线±3*MT9V03X_W/8 ，中线±4*MT9V03X_W/8）
extern int16 symmetry_rectificate_start_y;	// 对称法矫正图像遍历起始点高度
extern int16 symmetry_rectificate_end_y;		// 对称法矫正图像遍历结束点高度
extern uint32 sum_weight;	// 加权和
extern float sum_weight_normalization;	// 加权和归一化
extern float sum_weight_normalization_limit[2];	// 加权和归一化阈值
extern float frame_white_num__normalization[2];	// 对称法矫正图像边框白点数量归一化
extern float frame_white_num__normalization_limit;	// 对称法矫正图像边框白点数量归一化阈值
extern int16 frame_offset;	// 图像边框偏移量（左框右偏，右框左偏，防止曲率超级大的圆环无法使用对称法进行矫正） 
extern float rotate_linear_speed;	// 绕箱子旋转线速度
extern float linear_angular_speed_rate;	// 线速度/角速度 比例（用于绕箱子转）

/******************************************************************/

/* 标志位初始化 */	
void flag_init(void);

=======
/* 标志位初始化 */	
void flag_init(void);
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
/* 变量初始化 */	
void variable_init(void);

#endif