#ifndef _DATA_H_
#define _DATA_H_

#include "common.h"

/* 枚举定义 */
/* 控制类型 */
typedef enum _control_kind_{
	Angle2Inv2Speed = 0,	// 角度环->运动学逆解算->速度环
	XY2Inv2Speed = 1,		// 箱子XY->运动学逆解算->速度环
	Inv2Speed = 2,			// 运动学逆解算->速度环
	Speed = 3,				// 纯速度环
	PWM = 4,				// 纯PWM控制
	Stop = 5				// 电机停车
}_control_kind_;

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
extern struct DOG_SOLVE chassis_solve;				// 底盘解算
extern struct DOG_SOLVE displacement_solve;			// 位移解算
extern struct DOG_CV dog_cv;						// 计算机视觉
extern struct DOG_PATH dog_path;					// 循迹

/* 使能标志位 */
extern _bool_ circle_enable_flag;		// 圆环 使能标志位
extern _bool_ zebra_enable_flag;		// 斑马线 使能标志位
extern _bool_ ai_camera_1_enable_flag;	// AI相机1 使能标志位
extern _bool_ ai_camera_2_enable_flag;	// AI相机2 使能标志位
extern _bool_ ai_camera_3_enable_flag;	// AI相机3 使能标志位

/* 完成标志位 */
extern _bool_ rotate_finsh_flag;		// 旋转完成标志位

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
/* 赛道其他 */
extern _path_state_ path_state;			// 赛道状态
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
extern int16 detection_center_err;			// 识别框中心误差
extern uint16 detection_box_width;			// 识别框宽度
extern uint16 detection_box_width_limit;	// 识别框宽度阈值（大于此阈值才可以进入箱子追踪模式）
extern uint16 detection_box_width_target;	// 目标识别框宽度
extern int16 detection_box_center_x;				// 识别框中心横坐标
extern uint16 detection_box_center_x_limit;	// 识别框中心横坐标阈值（在阈值范围内才可以进入箱子追踪模式）

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
extern float BOX_X_PID[5];						  
// BOX Y
extern float BOX_Y_PID[5];

/* KARMAN滤波器参数 */
extern float MOTOR_1_KARMAN[2];
extern float MOTOR_2_KARMAN[2];
extern float MOTOR_3_KARMAN[2];
extern float I_KARMAN[2];

/* 模糊PID 规则表 */
extern _fuzzy_subset_ fuzzy_rules[8][8];

#endif