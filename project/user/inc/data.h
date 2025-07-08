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

typedef enum _control_kind_{
	Angle2Inv2Speed = 0,	// 角度环->运动学逆解算->速度环
	X2Inv2Speed = 1,		// 箱子X->运动学逆解算->速度环
	XY2Inv2Speed = 2,		// 箱子XY->运动学逆解算->速度环
	Inv2Speed = 3,			// 运动学逆解算->速度环
	Speed = 4,				// 纯速度环
	PWM = 5,				// 纯PWM控制
	Stop = 6,				// 电机停车
}_control_kind_;

/* AI摄像头序号 */
typedef enum _ai_camera_idx_{
	AI_CAMERA_0 = 0,		// AI摄像头0
	AI_CAMERA_1 = 1,		// AI摄像头1
	AI_CAMERA_2 = 2,		// AI摄像头2
}_ai_camera_idx_;		

/* AI摄像头识别标签 */
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
extern struct DOG_MOTOR motor_1;					// 电机1
extern struct DOG_MOTOR motor_2;					// 电机2
extern struct DOG_MOTOR motor_3;					// 电机3
extern struct DOG_ENCODER encoder_1;				// 编码器1
extern struct DOG_ENCODER encoder_2;				// 编码器2
extern struct DOG_ENCODER encoder_3;				// 编码器3
extern struct DOG_CURRENT current_1;				// 电流采样1
extern struct DOG_CURRENT current_2;				// 电流采样2
extern struct DOG_CURRENT current_3;				// 电流采样3
extern struct DOG_VOLTAGE gray_sensor;				// 灰度传感器
extern struct DOG_VOLTAGE bat_voltage;				// 电池电压检测
extern struct DOG_KARMAN_FILTER current_1_karman;	// 电流采样1 卡尔曼滤波 
extern struct DOG_KARMAN_FILTER current_2_karman;	// 电流采样2 卡尔曼滤波 
extern struct DOG_KARMAN_FILTER current_3_karman;	// 电流采样3 卡尔曼滤波 
extern struct DOG_PID motor_1_pid;					// 电机PID1
extern struct DOG_PID motor_2_pid;					// 电机PID2
extern struct DOG_PID motor_3_pid;					// 电机PID3
extern struct DOG_PID current_1_pid;				// 电机电流PID1
extern struct DOG_PID current_2_pid;				// 电机电流PID2
extern struct DOG_PID current_3_pid;				// 电机电流PID3
extern struct DOG_PID path_pid;						// 路径PID
extern struct DOG_PID path_gyroz_pid;				// 路径陀螺仪PID
extern struct DOG_PID rotate_pid;					// 旋转PID
extern struct DOG_PID box_x_pid;					// 箱子X PID
extern struct DOG_PID box_y_pid;					// 箱子Y PID
extern struct DOG_VOFA wireless_vofa;				// 无线串口VOFA
extern struct DOG_IMU imu660ra;						// IMU660RA陀螺仪
extern struct DOG_SOLVE euler_angle_solve;			// 欧拉角解算
extern struct DOG_SOLVE rotate_euler_angle_solve;	// 旋转欧拉角解算
extern struct DOG_SOLVE circle_euler_angle_solve;	// 圆环欧拉角解算
extern struct DOG_SOLVE box_euler_angle_solve;		// 箱子欧拉角解算
extern struct DOG_SOLVE chassis_solve;				// 底盘解算
extern struct DOG_SOLVE displacement_solve;			// 位移解算
extern struct DOG_TIMER zebra_path_timer;			// 斑马线计时器
extern struct DOG_TIMER circle_in_timer;			// 圆环入环计时器（入环后开始计时，计时超过阈值时间才允许进入出环状态）
extern struct DOG_TIMER circle_out_timer;			// 圆环出环计时器（出环后开始计时，计时超过阈值时间才允许进入进环状态）
extern struct DOG_CV dog_cv;						// 计算机视觉
extern struct DOG_PATH dog_path;					// 循迹

/* 使能标志位 */
extern _bool_ circle_enable_flag;		// 圆环 使能标志位
extern _bool_ zebra_enable_flag;		// 斑马线 使能标志位
extern _bool_ ai_camera_0_enable_flag;	// AI相机0 使能标志位
extern _bool_ ai_camera_1_enable_flag;	// AI相机1 使能标志位
extern _bool_ ai_camera_2_enable_flag;	// AI相机2 使能标志位

/* 完成标志位 */
extern _bool_ rotate_finsh_flag;		// 旋转完成标志位
extern _bool_ box_X_finsh_flag;			// 箱子X定位完成标志位
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
extern int16 detection_box_center_x;					// 识别框中心横坐标
extern uint16 detection_box_center_x_limit;				// 识别框中心横坐标阈值（在阈值范围内才可以进入箱子追踪模式）
extern _ai_camera_detection_result_ detection_result;	// 识别结果
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

/* KARMAN滤波器参数 */
extern float MOTOR_1_KARMAN[2];
extern float MOTOR_2_KARMAN[2];
extern float MOTOR_3_KARMAN[2];
extern float I_KARMAN[2];

/* 模糊PID 规则表 */
extern _fuzzy_subset_ fuzzy_rules[8][8];

#endif