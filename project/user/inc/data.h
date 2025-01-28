#ifndef _DATA_H_
#define _DATA_H_

#include "zf_common_headfile.h"

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
	float value;
	float delta;
	float now_err;
	float last_err;
	float last_last_err;
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

/* 单电机PID参数 */
extern float PID_MOTOR_1[3];
extern float PID_MOTOR_2[3];
extern float PID_MOTOR_3[3];

/* 底盘控制参数 */
extern float yaw;
extern float speed;
extern _CHASSIS_CONTROL_ chassis_control;

/* 图像 */
extern uint8 image_OTSU[MT9V03X_H][MT9V03X_W];

#endif