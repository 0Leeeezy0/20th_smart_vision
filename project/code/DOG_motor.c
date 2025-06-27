#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_motor.h"

// 电机启动
void motor_run(struct DOG_MOTOR *this, _rotate_dir_ dir, uint32 duty){
	if(this -> rotate_reverse_flag == True){
		if(dir == positive)
			gpio_set_level(this -> dir_pin, negative);
		else if(dir == negative)
			gpio_set_level(this -> dir_pin, positive);
		else
			gpio_set_level(this -> dir_pin, negative);
	}
	else
		gpio_set_level(this -> dir_pin, dir);
	pwm_set_duty(this -> pwm_pin, duty);
}

// 电机停止
void motor_stop(struct DOG_MOTOR *this){
	gpio_set_level(this -> dir_pin,0);
	pwm_set_duty(this -> pwm_pin, 0);
}

// 构造函数
void motor(struct DOG_MOTOR *this, gpio_pin_enum dir_pin, pwm_channel_enum pwm_pin, uint32 freq, _bool_ rotate_reverse_flag){
	/* 成员变量 */ 
	this -> dir_pin = dir_pin;
	this -> pwm_pin = pwm_pin;
	this -> rotate_reverse_flag = rotate_reverse_flag;
	
	/* 成员函数 */
	this -> motor_run = motor_run;
	this -> motor_stop = motor_stop;
	
	/* 初始化 */
	gpio_init(dir_pin, GPO, 0, GPO_PUSH_PULL);
	pwm_init(pwm_pin, freq, 0);
	
	return;
}

// 析构函数
void _motor(struct DOG_MOTOR *this){
	gpio_set_level(this -> dir_pin,0);
	pwm_set_duty(this -> pwm_pin, 0);
}