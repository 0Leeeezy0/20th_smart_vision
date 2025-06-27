#ifndef _DOG_MOTOR_H_
#define _DOG_MOTOR_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

struct DOG_MOTOR{
	/* 电机参数 */
	gpio_pin_enum dir_pin;		// 方向引脚
	pwm_channel_enum pwm_pin;	// PWM引脚
	_bool_ rotate_reverse_flag;	// 反转参考方向标志位
	
	/* 成员函数 */
	void (*motor_run)(struct DOG_MOTOR *this, _rotate_dir_ dir, uint32 duty);	// 电机启动
	void (*motor_stop)(struct DOG_MOTOR *this);							// 电机停止
};

// 电机启动
void motor_run(struct DOG_MOTOR *this, _rotate_dir_ dir, uint32 duty);
// 电机停止
void motor_stop(struct DOG_MOTOR *this);

// 构造函数
void motor(struct DOG_MOTOR *this, gpio_pin_enum dir_pin, pwm_channel_enum pwm_pin, uint32 freq, _bool_ rotate_reverse_flag);
// 析构函数
void _motor(struct DOG_MOTOR *this);

#endif