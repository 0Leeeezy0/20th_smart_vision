/*
该文件用于车模底盘控制

API：
****用户****
初始化
移动
************

****底层****
电机编码器初始化
电机驱动
编码器值获取
编码器值清空
底盘PID参数结构体初始化
单电机PID控制
增量式PID
位置式PID
运动学逆解算
************
*/

#ifndef _CHASSIS_CONTROL_H_
#define _CHASSIS_CONTROL_H_

#include "common.h"

//-----------------------------------用户函数-----------------------------------//
/* 初始化 */
void chassis_control_init();

/* 移动 */
void chassis_control_move(float yaw,float speed);
//-----------------------------------------------------------------------------//

//-----------------------------------底盘底层函数-----------------------------------//
/* 电机编码器初始化 */
void motor_encoder_init(void);

/* 电机驱动 */
void motor_set_duty(_MOTOR_NUM_ motor_num,const uint32 duty,uint8 dir);

/* 编码器值获取 */
void encoder_get(void);

/* 编码器值清空 */
void encoder_clear(void);

/* 底盘PID参数结构体初始化 */
_CHASSIS_PID_ chassis_pid_init(void);

/* 单电机PID控制 */
_CHASSIS_CONTROL_ motor_pid(_CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed);

/* 增量式PID */
int16 incremental_pid(_PID_* pid,float motor_speed,float motor_feedback_speed);

/* 运动学逆解算 */
_CHASSIS_CONTROL_ inverse_kinematics(float yaw,float speed);
//-----------------------------------------------------------------------------//

#endif