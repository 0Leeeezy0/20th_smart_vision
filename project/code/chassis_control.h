/*
该文件用于车模底盘控制

API：
电机编码器初始化
电机驱动
编码器值获取
PID闭环控制
运动学逆解算
*/

#ifndef _CHASSIS_CONTROL_H_
#define _CHASSIS_CONTROL_H_

#include "common.h"

/* 电机编码器初始化 */
void motor_encoder_init(void);

/* 电机驱动 */
void motor_set_duty(_MOTOR_NUM_ motor_num,const uint32 duty,uint8 dir);

/* 编码器值获取 */
void encoder_get(void);

/* 编码器值清空 */
void encoder_clear(void);

#endif