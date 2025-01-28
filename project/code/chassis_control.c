/*
该文件用于车模底盘控制

API：
电机编码器初始化
电机驱动
编码器值获取
编码器值清空
PID闭环控制
运动学逆解算
*/

#include "common.h"

/* 电机编码器初始化 */
void motor_encoder_init(void)
{
	// 编码器初始化
	encoder_dir_init(ENCODER_1_MODULE_NUM,ENCODER_1_CH1,ENCODER_1_CH2);
	encoder_dir_init(ENCODER_2_MODULE_NUM,ENCODER_2_CH1,ENCODER_2_CH2);
	encoder_dir_init(ENCODER_3_MODULE_NUM,ENCODER_3_CH1,ENCODER_3_CH2);
	
	encoder_1_count = 0;
	encoder_1_count = 0;
	encoder_1_count = 0;
	
	// 电机驱动PWM引脚初始化
	pwm_init(MOTOR_1_PWM,10000,0);
	pwm_init(MOTOR_2_PWM,10000,0);
	pwm_init(MOTOR_3_PWM,10000,0);
	
	// 电机驱动方向引脚初始化
	gpio_init(MOTOR_1_DIR,GPO,1,GPO_PUSH_PULL);
	gpio_init(MOTOR_2_DIR,GPO,0,GPO_PUSH_PULL);
	gpio_init(MOTOR_3_DIR,GPO,0,GPO_PUSH_PULL);
}


/* 电机驱动 */
/*
dir:
1 顺时针
0 逆时针
*/
void motor_set_duty(_MOTOR_NUM_ motor_num,const uint32 duty,uint8 dir)
{
	uint8 dir_fix;
	switch(motor_num)
	{
		case MOTOR_1:{ if(MOTOR_1_FRONT_DIR == 1){ if(dir){ dir_fix = 1; }else{ dir_fix = 0; } }else{ if(dir){ dir_fix = 0; }else{ dir_fix = 1; } } break; }
		case MOTOR_2:{ if(MOTOR_2_FRONT_DIR == 1){ if(dir){ dir_fix = 1; }else{ dir_fix = 0; } }else{ if(dir){ dir_fix = 0; }else{ dir_fix = 1; } } break; }
		case MOTOR_3:{ if(MOTOR_3_FRONT_DIR == 1){ if(dir){ dir_fix = 1; }else{ dir_fix = 0; } }else{ if(dir){ dir_fix = 0; }else{ dir_fix = 1; } } break; }
	}
	switch(motor_num)
	{
		case MOTOR_1:{ pwm_set_duty(MOTOR_1_PWM,duty); gpio_set_level(MOTOR_1_DIR,dir_fix); break; }
		case MOTOR_2:{ pwm_set_duty(MOTOR_2_PWM,duty); gpio_set_level(MOTOR_2_DIR,dir_fix); break; }
		case MOTOR_3:{ pwm_set_duty(MOTOR_3_PWM,duty); gpio_set_level(MOTOR_3_DIR,dir_fix); break; }
	}
}

/* 编码器值获取 */
void encoder_get(void)
{
	encoder_1_count = encoder_get_count(ENCODER_1_MODULE_NUM);
	encoder_2_count = encoder_get_count(ENCODER_2_MODULE_NUM);
	encoder_3_count = encoder_get_count(ENCODER_3_MODULE_NUM);
}

/* 编码器值清空 */
void encoder_clear(void)
{
	encoder_1_count = 0;
	encoder_2_count = 0;
	encoder_3_count = 0;
	
	encoder_clear_count(ENCODER_1_MODULE_NUM);
	encoder_clear_count(ENCODER_2_MODULE_NUM);
	encoder_clear_count(ENCODER_3_MODULE_NUM);
}


/* */
