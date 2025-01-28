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
	PATH_CONTROL_MODE = 0,
	MCXVISION_TRACK_MODE = 1,
	OPENART_TRACK_MODE = 2
}_CONTROL_MODE_;

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
	float delta;
	float now_err;
	float last_err;
	float last_last_err;
	float sigma_err;
}_PID_;

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
	_PID_ motor_1_pid;
	_PID_ motor_2_pid;
	_PID_ motor_3_pid;
	_PID_ rotate_pid;
}_CHASSIS_PID_;

/* 标志位 */
extern uint8 gyro_calibration_flag;	// 陀螺仪校准
extern uint8 acc_calibration_flag;	// 加速度计校准
extern uint8 euler_angle_flag;			// 欧拉角解算标志位
extern uint8 translate_shift_flag;				// 平动位移解算标志位
extern uint8 mcxvision_upgrade_time_count_flag;	// MCXVISION更新计时标志位
extern _CHASSIS_MOTION_ chassis_motion_flag;	// 底盘运动方式标志位
extern _CONTROL_MODE_ control_mode_flag;	// 控制模式标志位
extern uint8 mcxvision_enable_flag;	// MCXVISION摄像头使能标志位

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

/* 循迹 */
extern int16 path_err;

/* 路径线坐标 */
extern int16 path[MT9V03X_H][2];	// 路径线x、y坐标

/* AI追踪 */
extern int16 mcxvision_upgrade_time_count;	// MCXVISION摄像头更新计时
extern int16 track_x_center;	// 追踪中心X坐标
extern int16 max_detection_box_width;	// 最大识别框宽度
extern int16 track_err;	// 追踪误差

/**********************************************************************/

/****************************** 参数 ******************************/

/* 单电机PID参数 */
extern float PID_MOTOR_1[3];
extern float PID_MOTOR_2[3];
extern float PID_MOTOR_3[3];

/* 转动PID参数 */
extern float ROTATE_PID[3];

/* 循迹PID参数 */
extern float PATH_PID[4];

/* 底盘控制参数 */
extern float chassis_yaw;				// 底盘航向角
extern float chassis_linear_speed;		// 底盘线速度
extern float chassis_angular_speed;		// 底盘角速度
extern float chassis_rotate_angle;		// 底盘转动角度
extern _CHASSIS_CONTROL_ chassis_control;
extern _CHASSIS_PID_ chassis_pid;

/* 循迹控制参数 */
extern _PID_ path_pid;

/* AI追踪控制参数 */
extern _PID_ mcxvision_track_pid;	// MCXVISION追踪

/* 循迹 */
extern float path_linear_speed_target;	// 循迹线速度
extern int16 path_start;	// 路径线寻找开始高度
extern int16 path_end;	// 路径线寻找结束高度
extern int16 control_point;	// 控制点高度（速度 3 30 速度 8 45）
extern int16 prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点

/* AI追踪 */
extern float track_linear_speed_target;	// 追踪线速度
extern float track_linear_speed_revise;	// 追踪修正线速度
extern int16 detection_box_width_limit;	// MCXVISION摄像头识别框宽度阈值
extern int16 detection_box_width_std;	// MCXVISION摄像头识别框宽度标准阈值
extern int16 detection_box_center_limit;	// MCXVISION摄像头识别框中心阈值

/* PID */
extern float duty_limit;	// PID占空比限幅
extern float chassis_pid_i_limit;	// 底盘PID位置式积分项限幅
extern float path_err_limit;	// PID循迹误差限幅
extern float path_pid_i_limit;	// 循迹PID位置式积分项限幅
extern float rotate_speed_limit;			// PID转动速度限幅
extern float rotate_pid_i_limit;		// 转动PID位置式积分项限幅
extern float translate_speed_limit;			// PID平动修正角速度限幅
extern float translate_pid_i_limit;		// 平动PID位置式积分项限幅


/******************************************************************/

#endif