/*
该文件用于车模底盘控制

API：
****用户****
初始化
移动
底盘PID参数结构体初始化
************

****底层****
电机编码器初始化
电机驱动
编码器值获取
编码器值清空
单电机PID控制
增量式PID
位置式PID
运动学逆解算
************
*/

#ifndef _DOG_CHASSIS_H_
#define _DOG_CHASSIS_H_

#include "common.h"

//-----------------------------------用户函数-----------------------------------//
/* 初始化 */
void chassis_control_init();

/* 停止 */
void chassis_control_stop(void);

/* 移动 */
void chassis_control_move(float (*FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float chassis_yaw,float linear_speed,float angular_speed);

/* 转动角度 */
void chassis_control_angle_rotate(float (*FUNC_MOTOR)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float (*FUNC_ROTATE)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float rotate_angle);

/* 底盘总控制 */
void chassis_total_control(_CHASSIS_MOTION_ _chassis_motion_flag_,float _chassis_yaw_,float _chassis_linear_speed_,float _chassis_angular_speed_,float _chassis_rotate_angle_,uint32 _delay_ms_);

/* 底盘PID参数结构体初始化 */
_CHASSIS_PID_ chassis_pid_init(void);
//-----------------------------------------------------------------------------//

//-----------------------------------底盘底层函数-----------------------------------//
/* 电机传感器初始化 */
void motor_sensor_init(void);

/* 电机驱动 */
void motor_set_duty(_MOTOR_NUM_ motor_num,const uint32 duty,uint8 dir);

/* 编码器值获取 */
void encoder_get(void);

/* 编码器值清空 */
void encoder_clear(void);

/* 陀螺仪值获取(现实值 °/s) */
void gyro_get(void);

/* 加速度计值获取(现实值 g(m/s^2)) */
void acc_get(void);

/* 欧拉角解算 */
void euler_angle(void);

/* 平动位移解算 */
void translate_shift(void);

/* 单电机PID控制 */
_CHASSIS_CONTROL_ motor_pid(float (*FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),_CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed);

/* 运动学逆解算 */
_CHASSIS_CONTROL_ inverse_kinematics(float yaw,float linear_speed,float angular_speed);
//-----------------------------------------------------------------------------//

#endif