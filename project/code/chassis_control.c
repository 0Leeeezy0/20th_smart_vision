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

#include "common.h"

/* 电机传感器初始化 */
void motor_sensor_init(void)
{
	/* 传感器初始化 */
	imu660ra_init();
	
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
	
	// 控制中断初始化
	pit_ms_init (CONTROL_IT_CH, CONTROL_IT_TIME);	// 控制中断初始化
	
	// 传感器中断初始化
	pit_ms_init (SENSOR_IT_CH, SENSOR_IT_TIME);	// 传感器中断初始化
	
	// 中断使能
	pit_enable(CONTROL_IT_CH);
	pit_enable(SENSOR_IT_CH);
//	interrupt_global_enable(0);
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
	
	encoder_1_speed = (float)encoder_get_count(ENCODER_1_MODULE_NUM)/(1024*(float)SENSOR_IT_TIME/1000);
	encoder_2_speed = (float)encoder_get_count(ENCODER_2_MODULE_NUM)/(1024*(float)SENSOR_IT_TIME/1000);
	encoder_3_speed = (float)encoder_get_count(ENCODER_3_MODULE_NUM)/(1024*(float)SENSOR_IT_TIME/1000);
	
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

/* 陀螺仪值获取(现实值 °/s) */
void gyro_get(void)
{
	/* 陀螺仪校准值 */
	static float gyro_x_calibration = 0;
	static float gyro_y_calibration = 0;
	static float gyro_z_calibration = 0;
	static float gyro_x_max = 0;
	static float gyro_x_min = 0;
	static float gyro_y_max = 0;
	static float gyro_y_min = 0;
	static float gyro_z_max = 0;
	static float gyro_z_min = 0;

	static int epoch = 0;
	imu660ra_get_gyro();
	
	if(gyro_calibration_flag == FALSE)
	{
		if(epoch == 0)
		{
			gyro_x_calibration = 0;
			gyro_y_calibration = 0;
			gyro_z_calibration = 0;
		}
		// 求解去零飘偏移量
		else if(epoch > 0 && epoch <= GYRO_ACC_CALIBRATION_EPOCH/2)
		{
			gyro_x = imu660ra_gyro_transition(imu660ra_gyro_x);
			gyro_y = imu660ra_gyro_transition(imu660ra_gyro_y);
			gyro_z = imu660ra_gyro_transition(imu660ra_gyro_z);
		
			gyro_x_calibration += gyro_x/GYRO_ACC_CALIBRATION_EPOCH;
			gyro_y_calibration += gyro_y/GYRO_ACC_CALIBRATION_EPOCH;
			gyro_z_calibration += gyro_z/GYRO_ACC_CALIBRATION_EPOCH;
		}
		// 求解上下门限
		else if(epoch > GYRO_ACC_CALIBRATION_EPOCH/2 && epoch <= GYRO_ACC_CALIBRATION_EPOCH)
		{
			gyro_x = imu660ra_gyro_transition(imu660ra_gyro_x)-gyro_x_calibration;
			gyro_y = imu660ra_gyro_transition(imu660ra_gyro_y)-gyro_y_calibration;
			gyro_z = imu660ra_gyro_transition(imu660ra_gyro_z)-gyro_z_calibration;
			
			if(gyro_x > gyro_x_max)
			{
				gyro_x_max = gyro_x;
			}
			if(gyro_x < gyro_x_min)
			{
				gyro_x_min = gyro_x;
			}
			if(gyro_y > gyro_y_max)
			{
				gyro_y_max = gyro_y;
			}
			if(gyro_y < gyro_y_min)
			{
				gyro_y_min = gyro_y;
			}
			if(gyro_z > gyro_z_max)
			{
				gyro_z_max = gyro_z;
			}
			if(gyro_z < gyro_z_min)
			{
				gyro_z_min = gyro_z;
			}
		}
		else
		{
			epoch = 0;
			gyro_calibration_flag = TRUE;
		}
		epoch++;
	}	
	else
	{
		gyro_x = imu660ra_gyro_transition(imu660ra_gyro_x)-gyro_x_calibration;
		gyro_y = imu660ra_gyro_transition(imu660ra_gyro_y)-gyro_y_calibration;
		gyro_z = imu660ra_gyro_transition(imu660ra_gyro_z)-gyro_z_calibration;
		if(gyro_x >= gyro_x_min && gyro_x <= gyro_x_max)
		{
			gyro_x = 0;
		}
		if(gyro_y >= gyro_y_min && gyro_y <= gyro_y_max)
		{
			gyro_y = 0;
		}
		if(gyro_z >= gyro_z_min && gyro_z <= gyro_z_max)
		{
			gyro_z = 0;
		}
	}
}

/* 加速度计值获取(现实值 g(m/s^2)) */
void acc_get(void)
{
	/* 加速度计校准值 */
	static float acc_x_calibration = 0;
	static float acc_y_calibration = 0;
	static float acc_z_calibration = 0;
	static float acc_x_max = 0;
	static float acc_x_min = 0;
	static float acc_y_max = 0;
	static float acc_y_min = 0;
	static float acc_z_max = 0;
	static float acc_z_min = 0;
	
	static int epoch = 0;
	imu660ra_get_acc();
	
	if(acc_calibration_flag == FALSE)
	{
		if(epoch == 0)
		{
			acc_x_calibration = 0;
			acc_y_calibration = 0;
			acc_z_calibration = 0;
		}
		// 求解去零飘偏移量
		else if(epoch > 0 && epoch <= GYRO_ACC_CALIBRATION_EPOCH/2)
		{
			acc_x = imu660ra_acc_transition(imu660ra_acc_x);
			acc_y = imu660ra_acc_transition(imu660ra_acc_y);
			acc_z = imu660ra_acc_transition(imu660ra_acc_z);
		
			acc_x_calibration += acc_x/GYRO_ACC_CALIBRATION_EPOCH;
			acc_y_calibration += acc_y/GYRO_ACC_CALIBRATION_EPOCH;
			acc_z_calibration += acc_z/GYRO_ACC_CALIBRATION_EPOCH;
		}
		// 求解上下门限
		else if(epoch > GYRO_ACC_CALIBRATION_EPOCH/2 && epoch <= GYRO_ACC_CALIBRATION_EPOCH)
		{
			acc_x = imu660ra_acc_transition(imu660ra_acc_x)-acc_x_calibration;
			acc_y = imu660ra_acc_transition(imu660ra_acc_y)-acc_y_calibration;
			acc_z = imu660ra_acc_transition(imu660ra_acc_z)-acc_z_calibration;
			
			if(acc_x > acc_x_max)
			{
				acc_x_max = acc_x;
			}
			if(acc_x < acc_x_min)
			{
				acc_x_min = acc_x;
			}
			if(acc_y > acc_y_max)
			{
				acc_y_max = acc_y;
			}
			if(acc_y < acc_y_min)
			{
				acc_y_min = acc_y;
			}
			if(acc_z > acc_z_max)
			{
				acc_z_max = acc_z;
			}
			if(acc_z < acc_z_min)
			{
				acc_z_min = acc_z;
			}
		}
		else
		{
			epoch = 0;
			acc_calibration_flag = TRUE;
		}
		epoch++;
	}
	else
	{
		acc_x = imu660ra_acc_transition(imu660ra_acc_x)-acc_x_calibration;
		acc_y = imu660ra_acc_transition(imu660ra_acc_y)-acc_y_calibration;
		acc_z = imu660ra_acc_transition(imu660ra_acc_z)-acc_z_calibration;
		if(acc_x >= acc_x_min && acc_x <= acc_x_max)
		{
			acc_x = 0;
		}
		if(acc_y >= acc_y_min && acc_y <= acc_y_max)
		{
			acc_y = 0;
		}
		if(acc_z >= acc_z_min && acc_z <= acc_z_max)
		{
			acc_z = 0;
		}
	}
}

/* 欧拉角解算 */
void euler_angle(void)
{	
	if((gyro_calibration_flag || acc_calibration_flag) && euler_angle_flag)
	{
		roll += gyro_x*SENSOR_IT_TIME/1000;
		pitch += gyro_y*SENSOR_IT_TIME/1000;
		yaw += gyro_z*SENSOR_IT_TIME/1000;
	}
	else
	{
		roll = 0;
		pitch = 0;
		yaw = 0;
	}
}

/* 平动位移解算 */
void translate_shift(void)
{
	static float x_distance,y_distance;
	if(translate_shift_flag)
	{
		float converte = 1000/SENSOR_IT_TIME;
		float x_speed = (motor_2_speed*COS60+motor_3_speed*COS60-motor_1_speed);
		float y_speed = (motor_2_speed*SIN60-motor_3_speed*SIN60);
	
		x_distance += x_speed/converte;
		y_distance += y_speed/converte;
		shift_yaw = RAD2DEG(atan(x_distance/y_distance));
		if(x_distance > 0 && y_distance <0)
		{
			shift_yaw = shift_yaw+180;
		}
		else if(x_distance < 0 && y_distance <0)
		{
			shift_yaw = shift_yaw-180;
		}
		
		shift_distance = sqrt(x_distance*x_distance+y_distance*y_distance)*TRANSLATE_SHIFT_REVISE;
	}
	else
	{
		x_distance = 0;
		y_distance = 0;
		shift_yaw = 0;
		shift_distance = 0;
	}
}

/* 底盘PID参数结构体初始化 */
_CHASSIS_PID_ chassis_pid_init(void)
{
	static _CHASSIS_PID_ chassis_pid;

	// 电机1 PID
	chassis_pid.motor_1_pid_parameters.p = PID_MOTOR_1[0];
	chassis_pid.motor_1_pid_parameters.i = PID_MOTOR_1[1];
	chassis_pid.motor_1_pid_parameters.d = PID_MOTOR_1[2];
	chassis_pid.motor_1_pid_parameters.output_limit = PID_MOTOR_1[3];
	chassis_pid.motor_1_pid_parameters.i_limit = PID_MOTOR_1[4];
	chassis_pid.motor_1_pid_variable.now_err = 0;
	chassis_pid.motor_1_pid_variable.last_err = 0;
	chassis_pid.motor_1_pid_variable.last_last_err = 0;
	
	// 电机2 PID
	chassis_pid.motor_2_pid_parameters.p = PID_MOTOR_2[0];
	chassis_pid.motor_2_pid_parameters.i = PID_MOTOR_2[1];
	chassis_pid.motor_2_pid_parameters.d = PID_MOTOR_2[2];
	chassis_pid.motor_2_pid_parameters.output_limit = PID_MOTOR_2[3];
	chassis_pid.motor_2_pid_parameters.i_limit = PID_MOTOR_2[4];
	chassis_pid.motor_2_pid_variable.now_err = 0;
	chassis_pid.motor_2_pid_variable.last_err = 0;
	chassis_pid.motor_2_pid_variable.last_last_err = 0;
	
	// 电机3 PID
	chassis_pid.motor_3_pid_parameters.p = PID_MOTOR_3[0];
	chassis_pid.motor_3_pid_parameters.i = PID_MOTOR_3[1];
	chassis_pid.motor_3_pid_parameters.d = PID_MOTOR_3[2];
	chassis_pid.motor_3_pid_parameters.output_limit = PID_MOTOR_3[3];
	chassis_pid.motor_3_pid_parameters.i_limit = PID_MOTOR_3[4];
	chassis_pid.motor_3_pid_variable.now_err = 0;
	chassis_pid.motor_3_pid_variable.last_err = 0;
	chassis_pid.motor_3_pid_variable.last_last_err = 0;
	
	// 底盘转动 PID
	for(int i = 0;i < 4;i++)
	{
		chassis_pid.rotate_pid_parameters[i].p = ROTATE_PID[i][0];
		chassis_pid.rotate_pid_parameters[i].i = ROTATE_PID[i][1];
		chassis_pid.rotate_pid_parameters[i].d = ROTATE_PID[i][2];
		chassis_pid.rotate_pid_parameters[i].output_limit = ROTATE_PID[i][3];
		chassis_pid.rotate_pid_parameters[i].i_limit = ROTATE_PID[i][4];
	}
	chassis_pid.rotate_pid_variable.now_err = 0;
	chassis_pid.rotate_pid_variable.last_err = 0;
	chassis_pid.rotate_pid_variable.last_last_err = 0; 
	
	return chassis_pid;
}

/* 单电机PID控制 */
_CHASSIS_CONTROL_ motor_pid(float (*FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),_CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed)
{
	_CHASSIS_CONTROL_ motor_control;

	switch(motor_num)
	{
		case MOTOR_1:
		{ 
			motor_control.motor_1.duty = FUNC(&(chassis_pid -> motor_1_pid_parameters),&(chassis_pid -> motor_1_pid_variable),motor_speed,motor_1_speed);
			if(motor_control.motor_1.duty > 0)
			{
				motor_control.motor_1.dir = 0;
			}
			else
			{
				motor_control.motor_1.dir = 1;
			}
			motor_control.motor_1.duty = (int16)abs(motor_control.motor_1.duty);
			break;
		}
		case MOTOR_2:
		{
			motor_control.motor_2.duty = FUNC(&(chassis_pid -> motor_2_pid_parameters),&(chassis_pid -> motor_2_pid_variable),motor_speed,motor_2_speed);
			if(motor_control.motor_2.duty > 0)
			{
				motor_control.motor_2.dir = 0;
			}
			else
			{
				motor_control.motor_2.dir = 1;
			}
			motor_control.motor_2.duty = (int16)abs(motor_control.motor_2.duty);
			break;
		}
		case MOTOR_3:
		{
			motor_control.motor_3.duty = FUNC(&(chassis_pid -> motor_3_pid_parameters),&(chassis_pid -> motor_3_pid_variable),motor_speed,motor_3_speed);
			if(motor_control.motor_3.duty > 0)
			{
				motor_control.motor_3.dir = 0;
			}
			else
			{
				motor_control.motor_3.dir = 1;
			}
			motor_control.motor_3.duty = (int16)abs(motor_control.motor_3.duty);
			break;
		}
	}
	return motor_control;
}

/* 增量式PID */
float incremental_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{
	pid_variable -> now_err = target-feedback;
	// 增量式 p
	pid_variable -> delta += (pid_paraments -> p)*(pid_variable -> now_err-pid_variable -> last_err);
	// 增量式 i
	pid_variable -> delta += (pid_paraments -> i)*pid_variable -> now_err;
	// 增量式 d
	pid_variable -> delta += (pid_paraments -> d)*(pid_variable -> now_err-2*pid_variable -> last_err+pid_variable -> last_last_err);
				
	// 更新参数
	pid_paraments -> value += pid_variable -> delta;
	pid_variable -> last_err = pid_variable -> now_err;
	pid_variable -> last_last_err = pid_variable -> last_err;
	pid_variable -> delta = 0;
	
	// 输出限幅
	if(pid_paraments -> value > pid_paraments -> output_limit)
	{
		pid_paraments -> value = pid_paraments -> output_limit;
	}
	if(pid_paraments -> value < -pid_paraments -> output_limit)
	{
		pid_paraments -> value = -pid_paraments -> output_limit;
	}
	
	return pid_paraments -> value;
}

/*位置式PID*/
float positional_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{
	pid_variable -> now_err = target-feedback;
	// 增量式 p
	pid_paraments -> value += (pid_paraments -> p)*(pid_variable -> now_err);
	// 增量式 i
	pid_paraments -> value += (pid_paraments -> i)*pid_variable -> sigma_err;
	// 增量式 d
	pid_paraments -> value += (pid_paraments -> d)*(pid_variable -> now_err-pid_variable -> last_err);
				
	// 更新参数
	pid_variable -> sigma_err += pid_variable -> now_err;
	pid_variable -> last_err = pid_variable -> now_err;
	
	// 输出限幅
	if(pid_paraments -> value > pid_paraments -> output_limit)
	{
		pid_paraments -> value = pid_paraments -> output_limit;
	}
	if(pid_paraments -> value < -pid_paraments -> output_limit)
	{
		pid_paraments -> value = -pid_paraments -> output_limit;
	}
	// 积分限幅
	if(pid_variable -> sigma_err > pid_paraments -> i_limit)
	{
		pid_variable -> sigma_err = pid_paraments -> i_limit;
	}
	if(pid_variable -> sigma_err < -pid_paraments -> i_limit)
	{
		pid_variable -> sigma_err = -pid_paraments -> i_limit;
	}
	
	return pid_paraments -> value;
}

/* 运动学逆解算 */
_CHASSIS_CONTROL_ inverse_kinematics(float chassis_yaw,float chassis_linear_speed,float chassis_angular_speed)
{
	_CHASSIS_CONTROL_ chassis_control;
	float x_speed = chassis_linear_speed*sinf(DEG2RAD(chassis_yaw));
	float y_speed = (float)chassis_linear_speed*cosf(DEG2RAD(chassis_yaw));
	
	chassis_control.motor_1_speed = -x_speed+chassis_angular_speed;
	chassis_control.motor_2_speed = x_speed*COS60+y_speed*COS30+chassis_angular_speed;
	chassis_control.motor_3_speed = x_speed*COS60-y_speed*COS30+chassis_angular_speed;
	
	return chassis_control;
}

/* 初始化 */
void chassis_control_init()
{
	motor_sensor_init();
	chassis_pid = chassis_pid_init();
}

/* 停止 */
void chassis_control_stop(void)
{
	chassis_yaw = 0;
	chassis_linear_speed = 0;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 0;
	// 电机驱动
	motor_set_duty(MOTOR_1,0,chassis_control.motor_1.dir);
	motor_set_duty(MOTOR_2,0,chassis_control.motor_2.dir);
	motor_set_duty(MOTOR_3,0,chassis_control.motor_3.dir);
}

/* 移动 */
void chassis_control_move(float (*FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float chassis_yaw,float linear_speed,float angular_speed)
{
	// 运动学逆解算
	chassis_control = inverse_kinematics(chassis_yaw,linear_speed,angular_speed);
	
	// 电机闭环PID解算
	chassis_control.motor_1 = motor_pid(FUNC,&chassis_pid,MOTOR_1,chassis_control.motor_1_speed).motor_1;
	chassis_control.motor_2 = motor_pid(FUNC,&chassis_pid,MOTOR_2,chassis_control.motor_2_speed).motor_2;
	chassis_control.motor_3 = motor_pid(FUNC,&chassis_pid,MOTOR_3,chassis_control.motor_3_speed).motor_3;
	
	// 电机驱动
	motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
	motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
	motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
}

/* 转动角度 */
void chassis_control_angle_rotate(float (*FUNC_MOTOR)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float (*FUNC_ROTATE)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float rotate_angle)
{
	euler_angle_flag = TRUE;
	
	// 运动学逆解算
	if(abs(GYRO_Z_FORWARD*yaw+rotate_angle) > 0.5)
	{
		if(abs(GYRO_Z_FORWARD*yaw+rotate_angle) < 5)
		{
			chassis_control = inverse_kinematics(0,0,-FUNC_ROTATE(&(chassis_pid.rotate_pid_parameters[0]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		}
		else if(abs(GYRO_Z_FORWARD*yaw+rotate_angle) >= 5 && abs(GYRO_Z_FORWARD*yaw+rotate_angle) < 20)
		{
			chassis_control = inverse_kinematics(0,0,-FUNC_ROTATE(&(chassis_pid.rotate_pid_parameters[1]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		}
		else if(abs(GYRO_Z_FORWARD*yaw+rotate_angle) >= 20 && abs(GYRO_Z_FORWARD*yaw+rotate_angle) < 60)
		{
			chassis_control = inverse_kinematics(0,0,-FUNC_ROTATE(&(chassis_pid.rotate_pid_parameters[2]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		}
		else
		{
			chassis_control = inverse_kinematics(0,0,-FUNC_ROTATE(&(chassis_pid.rotate_pid_parameters[3]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		}
		// 电机闭环PID解算
		chassis_control.motor_1 = motor_pid(FUNC_MOTOR,&chassis_pid,MOTOR_1,chassis_control.motor_1_speed).motor_1;
		chassis_control.motor_2 = motor_pid(FUNC_MOTOR,&chassis_pid,MOTOR_2,chassis_control.motor_2_speed).motor_2;
		chassis_control.motor_3 = motor_pid(FUNC_MOTOR,&chassis_pid,MOTOR_3,chassis_control.motor_3_speed).motor_3;
	
		// 电机驱动
		motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
		motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
		motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
	}
	else
	{
		// 电机驱动
		motor_set_duty(MOTOR_1,0,chassis_control.motor_1.dir);
		motor_set_duty(MOTOR_2,0,chassis_control.motor_2.dir);
		motor_set_duty(MOTOR_3,0,chassis_control.motor_3.dir); 
	}
}

/* 底盘总控制 */
void chassis_total_control(_CHASSIS_MOTION_ _chassis_motion_flag_,float _chassis_yaw_,float _chassis_linear_speed_,float _chassis_angular_speed_,float _chassis_rotate_angle_,uint32 _delay_ms_)
{
	chassis_motion_flag = _chassis_motion_flag_;
	chassis_yaw = _chassis_yaw_;
	chassis_linear_speed = _chassis_linear_speed_;
	chassis_angular_speed = _chassis_angular_speed_;
	chassis_rotate_angle = _chassis_rotate_angle_;
	system_delay_ms(_delay_ms_);
	euler_angle_flag = FALSE;
}

