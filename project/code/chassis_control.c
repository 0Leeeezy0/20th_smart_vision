/*
该文件用于车模底盘控制

API：
电机编码器初始化
电机驱动
编码器值获取
编码器值清空
单电机PID闭环控制
运动学逆解算
*/

#include "common.h"

static _CHASSIS_PID_ chassis_pid;
_CHASSIS_CONTROL_ chassis_control;

/* 电机编码器初始化 */
void motor_encoder_init(void)
{
	// 控制中断初始化
	pit_ms_init (CONTROL_IT_CH, CONTROL_IT_TIME);	// 编码器中断初始化
	
	// 编码器初始化
	pit_ms_init (ENCODER_IT_CH, ENCODER_IT_TIME);	// 编码器中断初始化
	
	encoder_dir_init(ENCODER_1_MODULE_NUM,ENCODER_1_CH1,ENCODER_1_CH2);
	encoder_dir_init(ENCODER_2_MODULE_NUM,ENCODER_2_CH1,ENCODER_2_CH2);
	encoder_dir_init(ENCODER_3_MODULE_NUM,ENCODER_3_CH1,ENCODER_3_CH2);
	
	encoder_1_count = 0;
	encoder_2_count = 0;
	encoder_3_count = 0;
	encoder_1_speed = 0;
	encoder_2_speed = 0;
	encoder_3_speed = 0;
	motor_1_speed = 0;
	motor_2_speed = 0;
	motor_3_speed = 0;
	
	// 电机驱动PWM引脚初始化
	pwm_init(MOTOR_1_PWM,10000,0);
	pwm_init(MOTOR_2_PWM,10000,0);
	pwm_init(MOTOR_3_PWM,10000,0);
	
	// 电机驱动方向引脚初始化
	gpio_init(MOTOR_1_DIR,GPO,0,GPO_PUSH_PULL);
	gpio_init(MOTOR_2_DIR,GPO,0,GPO_PUSH_PULL);
	gpio_init(MOTOR_3_DIR,GPO,0,GPO_PUSH_PULL);
	
	// 中断使能
	pit_enable(CONTROL_IT_CH);
	pit_enable(ENCODER_IT_CH);
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

/* 编码器值获取(现实值 rad/s) */
void encoder_get(void)
{
	encoder_1_count = encoder_get_count(ENCODER_1_MODULE_NUM);
	encoder_2_count = encoder_get_count(ENCODER_2_MODULE_NUM);
	encoder_3_count = encoder_get_count(ENCODER_3_MODULE_NUM);
	
	encoder_1_speed = (float)encoder_get_count(ENCODER_1_MODULE_NUM)/(1024*(float)ENCODER_IT_TIME/1000);
	encoder_2_speed = (float)encoder_get_count(ENCODER_2_MODULE_NUM)/(1024*(float)ENCODER_IT_TIME/1000);
	encoder_3_speed = (float)encoder_get_count(ENCODER_3_MODULE_NUM)/(1024*(float)ENCODER_IT_TIME/1000);
	
	motor_1_speed = (float)encoder_1_speed/GEAR_RATIO;
	motor_2_speed = (float)encoder_2_speed/GEAR_RATIO;
	motor_3_speed = (float)encoder_3_speed/GEAR_RATIO;
}

/* 编码器值清空 */
void encoder_clear(void)
{
	encoder_clear_count(ENCODER_1_MODULE_NUM);
	encoder_clear_count(ENCODER_2_MODULE_NUM);
	encoder_clear_count(ENCODER_3_MODULE_NUM);
}

/* 底盘PID参数结构体初始化 */
_CHASSIS_PID_ chassis_pid_init(void)
{
	static _CHASSIS_PID_ chassis_pid;

	// 电机1 pid
	chassis_pid.motor_1_pid.p = PID_MOTOR_1[0];
	chassis_pid.motor_1_pid.i = PID_MOTOR_1[1];
	chassis_pid.motor_1_pid.d = PID_MOTOR_1[2];
	chassis_pid.motor_1_pid.now_err =  0;
	chassis_pid.motor_1_pid.last_err =  0;
	chassis_pid.motor_1_pid.last_last_err =  0;
	
	// 电机2 pid
	chassis_pid.motor_2_pid.p = PID_MOTOR_2[0];
	chassis_pid.motor_2_pid.i = PID_MOTOR_2[1];
	chassis_pid.motor_2_pid.d = PID_MOTOR_2[2];
	chassis_pid.motor_2_pid.now_err =  0;
	chassis_pid.motor_2_pid.last_err =  0;
	chassis_pid.motor_2_pid.last_last_err =  0;
	
	// 电机3 pid
	chassis_pid.motor_3_pid.p = PID_MOTOR_3[0];
	chassis_pid.motor_3_pid.i = PID_MOTOR_3[1];
	chassis_pid.motor_3_pid.d = PID_MOTOR_3[2];
	chassis_pid.motor_3_pid.now_err =  0;
	chassis_pid.motor_3_pid.last_err =  0;
	chassis_pid.motor_3_pid.last_last_err =  0;
	
	return chassis_pid;
}

/* 单电机PID控制 */
_CHASSIS_CONTROL_ motor_pid(_CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed)
{
	_CHASSIS_CONTROL_ motor_control;

	switch(motor_num)
	{
		case MOTOR_1:
		{ 
			motor_control.motor_1.duty = incremental_pid(&(chassis_pid -> motor_1_pid),motor_speed,motor_1_speed);
			if(motor_control.motor_1.duty > 0)
			{
				motor_control.motor_1.dir = 0;
			}
			else
			{
				motor_control.motor_1.dir = 1;
			}
			motor_control.motor_1.duty = abs(motor_control.motor_1.duty);
			break;
		}
		case MOTOR_2:
		{
			motor_control.motor_2.duty = incremental_pid(&(chassis_pid -> motor_2_pid),motor_speed,motor_2_speed);
			if(motor_control.motor_2.duty > 0)
			{
				motor_control.motor_2.dir = 0;
			}
			else
			{
				motor_control.motor_2.dir = 1;
			}
			motor_control.motor_2.duty = abs(motor_control.motor_2.duty);
			break;
		}
		case MOTOR_3:
		{
			motor_control.motor_3.duty = incremental_pid(&(chassis_pid -> motor_3_pid),motor_speed,motor_3_speed);
			if(motor_control.motor_3.duty > 0)
			{
				motor_control.motor_3.dir = 0;
			}
			else
			{
				motor_control.motor_3.dir = 1;
			}
			motor_control.motor_3.duty = abs(motor_control.motor_3.duty);
			break;
		}
	}
	return motor_control;
}

/* 增量式PID */
int16 incremental_pid(_PID_* pid,float motor_speed,float motor_feedback_speed)
{
	pid -> now_err = motor_speed-motor_feedback_speed;
	// 增量式 p
	pid -> delta += (pid -> p)*(pid -> now_err-pid -> last_err);
	// 增量式 i
	pid -> delta += (pid -> i)*pid -> now_err;
	// 增量式 d
	pid -> delta += (pid -> d)*(pid -> now_err-2*pid -> last_err+pid -> last_last_err);
				
	// 更新参数
	pid -> value += pid -> delta;
	pid -> last_err = pid -> now_err;
	pid -> last_last_err = pid -> last_err;
	pid -> delta = 0;
	
	// 限幅
	if(pid -> value > DUTY_LIMIT)
	{
		pid -> value = DUTY_LIMIT;
	}
	if(pid -> value < -DUTY_LIMIT)
	{
		pid -> value = -DUTY_LIMIT;
	}
	
	return pid -> value;
}


/*位置式PID*/

/* 运动学逆解算 */
_CHASSIS_CONTROL_ inverse_kinematics(float yaw,float speed)
{
	_CHASSIS_CONTROL_ chassis_control;
	float x_speed = speed*sinf(DEG2RAD(yaw));
	float y_speed = (float)speed*cosf(DEG2RAD(yaw));
	
	chassis_control.motor_1_speed = -x_speed;
	chassis_control.motor_2_speed = x_speed*COS60+y_speed*COS30;
	chassis_control.motor_3_speed = x_speed*COS60-y_speed*COS30;
	
	return chassis_control;
}

/* 初始化 */
void chassis_control_init()
{
	motor_encoder_init();
	chassis_pid = chassis_pid_init();
}
/* 移动 */
void chassis_control_move(float yaw,float speed)
{
	// 运动学逆解算
	chassis_control = inverse_kinematics(yaw,speed);
	
	// 电机闭环PID解算
	chassis_control.motor_1 = motor_pid(&chassis_pid,MOTOR_1,chassis_control.motor_1_speed).motor_1;
	chassis_control.motor_2 = motor_pid(&chassis_pid,MOTOR_2,chassis_control.motor_2_speed).motor_2;
	chassis_control.motor_3 = motor_pid(&chassis_pid,MOTOR_3,chassis_control.motor_3_speed).motor_3;
	
	// 电机驱动
	motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
	motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
	motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
}
