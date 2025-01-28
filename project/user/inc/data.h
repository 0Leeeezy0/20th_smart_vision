#ifndef _DATA_H_
#define _DATA_H_

#include "common.h"

/* 电机索引 */
typedef enum
{
	MOTOR_1 = 1,
	MOTOR_2 = 2,
	MOTOR_3 = 3
}_MOTOR_NUM_;

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
}_CHASSIS_PID_;

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

/* 图像 */
extern uint8 image_OTSU[MT9V03X_H][MT9V03X_W];

/* 标志位 */
extern uint8 GYRO_ACC_CALIBRATION;	// 陀螺仪、加速度计校准完成标志位

/****************************** 参数 ******************************/

/* 单电机PID参数 */
extern float PID_MOTOR_1[3];
extern float PID_MOTOR_2[3];
extern float PID_MOTOR_3[3];

/* 循迹PID参数 */
extern float PATH_PID[4];

/* 底盘控制参数 */
extern float yaw;
extern float linear_speed;
extern float angular_speed;
extern _CHASSIS_CONTROL_ chassis_control;
extern _CHASSIS_PID_ chassis_pid;

/* 循迹控制参数 */
extern int16 path_err;
extern _PID_ path_pid;

/* 循线 */
extern float linear_speed_target;	// 循迹线速度
extern int16 path_start;	// 路径线寻找开始高度
extern int16 path_end;	// 路径线寻找结束高度
extern int16 control_point;	// 控制点高度（速度 3 30 速度 8 45）
extern int16 prediction_point;	// 预测点高度：其横坐标将作为下一帧的搜线起点

/* PID */
extern float duty_limit;	// PID占空比限幅
extern float chassis_pid_i_limit;	// 底盘PID位置式积分项限幅
extern float path_err_limit;	// PID循迹误差限幅
extern float path_pid_i_limit;	// 循迹PID位置式积分项限幅

/******************************************************************/

/* 路径线坐标 */
extern int16 path[MT9V03X_H][2];	// 路径线x、y坐标

#endif