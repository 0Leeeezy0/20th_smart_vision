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
	
	// 蜂鸣器引脚初始化
	pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
	
	// 灰度传感器引脚初始化
	adc_init(GRAYSCALE_SENSOR_PIN,ADC_12BIT);
	
	// 电池电压引脚初始化
	adc_init(BAT_VOLTAGE_PIN,ADC_12BIT);
	
    // 电机电压引脚初始化
    adc_init(MOTOR_1_I_PIN,ADC_12BIT);
	adc_init(MOTOR_2_I_PIN,ADC_12BIT);    
    adc_init(MOTOR_3_I_PIN,ADC_12BIT);
	
	// 补光灯引脚初始化
	gpio_init(SUPPLEMENT_LAMP_EN_PIN,GPO,0,GPO_PUSH_PULL);	// 开/关灯
	gpio_init(SUPPLEMENT_LAMP_DIN_PIN,GPO,0,GPO_PUSH_PULL);	// 通信
    
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
	encoder_1_count = ENCODER_1_FRONT_DIR*encoder_get_count(ENCODER_1_MODULE_NUM);
	encoder_2_count = ENCODER_2_FRONT_DIR*encoder_get_count(ENCODER_2_MODULE_NUM);
	encoder_3_count = ENCODER_3_FRONT_DIR*encoder_get_count(ENCODER_3_MODULE_NUM);
	
	encoder_1_speed = (float)encoder_1_count/(ENCODER_LINE_NUM*(float)SENSOR_IT_TIME/1000);
	encoder_2_speed = (float)encoder_2_count/(ENCODER_LINE_NUM*(float)SENSOR_IT_TIME/1000);
	encoder_3_speed = (float)encoder_3_count/(ENCODER_LINE_NUM*(float)SENSOR_IT_TIME/1000);
	
	motor_1_speed = WHEEL_CIRCUMFERENCE*(float)encoder_1_speed/GEAR_RATIO;
	motor_2_speed = WHEEL_CIRCUMFERENCE*(float)encoder_2_speed/GEAR_RATIO;
	motor_3_speed = WHEEL_CIRCUMFERENCE*(float)encoder_3_speed/GEAR_RATIO;
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
			gyro_x_max = 0;
			gyro_x_min = 0;
			gyro_y_max = 0;
			gyro_y_min = 0;
			gyro_z_max = 0;
			gyro_z_min = 0;
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
		epoch++;
		if(epoch > GYRO_ACC_CALIBRATION_EPOCH)
		{
			epoch = 0;
			gyro_calibration_flag = TRUE;
		}
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
			acc_x_max = 0;
			acc_x_min = 0;
			acc_y_max = 0;
			acc_y_min = 0;
			acc_z_max = 0;
			acc_z_min = 0;
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
		epoch++;
		if(epoch > GYRO_ACC_CALIBRATION_EPOCH)
		{
			epoch = 0;
			acc_calibration_flag = TRUE;
		}	
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
		
		roll =  fmod(roll, 360);
		pitch = fmod(pitch, 360);
		yaw = fmod(yaw, 360);
	}
	else
	{
		roll = 0;
		pitch = 0;
		yaw = 0;
	}
}

/* 灰度传感器获取 */
void grayscale_sensor_get(void)
{
	grayscale = adc_mean_filter_convert(GRAYSCALE_SENSOR_PIN, 5); 
}

/* 电池电压获取*/
void bat_voltage_get(void)
{
	bat_voltage = (float)adc_mean_filter_convert(BAT_VOLTAGE_PIN, 5)*(float)BAT_VOLTAGE_CALIBRATION/4096.0; 
}

/* 电流检测adc */
void motor_I_get(void)
{
//    if(chassis_control.motor_1.dir==1) 
//		motor_1_V = (float)adc_mean_filter_convert(MOTOR_1_I_PIN, 5);
//    else if (chassis_control.motor_1.dir==0)
//		motor_1_V = -1.0*(float)adc_mean_filter_convert(MOTOR_1_I_PIN, 5);
//    if(chassis_control.motor_2.dir==1) 
//		motor_2_V = (float)adc_mean_filter_convert(MOTOR_2_I_PIN, 5);
//    else if (chassis_control.motor_2.dir==0)
//		motor_2_V = -1.0*(float)adc_mean_filter_convert(MOTOR_2_I_PIN, 5);
//    if(chassis_control.motor_3.dir==1) 
//		motor_3_V = (float)adc_mean_filter_convert(MOTOR_3_I_PIN, 5);
//    else if (chassis_control.motor_3.dir==0)
//		motor_3_V = -1.0*(float)adc_mean_filter_convert(MOTOR_3_I_PIN, 5);
    
    motor_1_V = (float)adc_mean_filter_convert(MOTOR_1_I_PIN, 5);
    motor_2_V = (float)adc_mean_filter_convert(MOTOR_2_I_PIN, 5);
    motor_3_V = (float)adc_mean_filter_convert(MOTOR_3_I_PIN, 5);
    
    motor_1_V_karman = karman(&current_filter.motor_current_1_karman_parameters,&current_filter.motor_current_1_karman_variable ,motor_1_V);
    motor_2_V_karman = karman(&current_filter.motor_current_1_karman_parameters,&current_filter.motor_current_2_karman_variable ,motor_2_V);
    motor_3_V_karman = karman(&current_filter.motor_current_1_karman_parameters,&current_filter.motor_current_3_karman_variable ,motor_3_V);

    motor_1_I = (motor_1_V_karman-2035) / 4096 * 3.3/20/0.01;
    motor_2_I = (motor_2_V_karman-2035) / 4096 * 3.3/20/0.01;
    motor_3_I = (motor_3_V_karman-2035) / 4096 * 3.3/20/0.01;    
}

/* 补光灯控制 */ 
void supplement_lamp(uint8_t status)
{
	if(supplement_lamp_enable_flag == TRUE)
	{
		/* 开灯 */
		if(status == 1)
		{
			gpio_set_level(SUPPLEMENT_LAMP_EN_PIN,1);
		}
		else
		{
			gpio_set_level(SUPPLEMENT_LAMP_EN_PIN,0);
		}
	}
}

/* 平动位移解算 */
void translate_shift(void)
{
	static float x_distance,y_distance;
	if(translate_shift_flag)
	{
		wheel_1_shift += motor_1_speed*SENSOR_IT_TIME/1000;
		wheel_2_shift += motor_2_speed*SENSOR_IT_TIME/1000;
		wheel_3_shift += motor_3_speed*SENSOR_IT_TIME/1000;
		
		x_distance = (-2.*wheel_1_shift+wheel_2_shift+wheel_3_shift)/3.;
		y_distance = (wheel_2_shift-wheel_3_shift)/1.7320508075688772935274463415059;

		shift_yaw = RAD2DEG(atan(x_distance/y_distance));
		if(x_distance > 0 && y_distance <0)
		{
			shift_yaw = shift_yaw+180;
		}
		else if(x_distance < 0 && y_distance <0)
		{
			shift_yaw = shift_yaw-180;
		}
		
		shift_distance = sqrt(x_distance*x_distance+y_distance*y_distance);
	}
	else
	{
		wheel_1_shift = 0;
		wheel_2_shift = 0;
		wheel_3_shift = 0;
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

	// 电机1速度环 PID
	pid_init(&chassis_pid.motor_1_speed_pid_parameters,&chassis_pid.motor_1_speed_pid_variable,PID_SPEED_MOTOR_1[0],PID_SPEED_MOTOR_1[1],PID_SPEED_MOTOR_1[2],PID_SPEED_MOTOR_1[3],PID_SPEED_MOTOR_1[4]);
	// 电机2速度环 PID
	pid_init(&chassis_pid.motor_2_speed_pid_parameters,&chassis_pid.motor_2_speed_pid_variable,PID_SPEED_MOTOR_2[0],PID_SPEED_MOTOR_2[1],PID_SPEED_MOTOR_2[2],PID_SPEED_MOTOR_2[3],PID_SPEED_MOTOR_2[4]);
	// 电机3速度环 PID
	pid_init(&chassis_pid.motor_3_speed_pid_parameters,&chassis_pid.motor_3_speed_pid_variable,PID_SPEED_MOTOR_3[0],PID_SPEED_MOTOR_3[1],PID_SPEED_MOTOR_3[2],PID_SPEED_MOTOR_3[3],PID_SPEED_MOTOR_3[4]);
	
	// 电机1速度环 PID
	pid_init(&chassis_pid.motor_1_I_pid_parameters,&chassis_pid.motor_1_I_pid_variable,PID_I_MOTOR_1[0],PID_I_MOTOR_1[1],PID_I_MOTOR_1[2],PID_I_MOTOR_1[3],PID_I_MOTOR_1[4]);
	// 电机2速度环 PID
	pid_init(&chassis_pid.motor_2_I_pid_parameters,&chassis_pid.motor_2_I_pid_variable,PID_I_MOTOR_2[0],PID_I_MOTOR_2[1],PID_I_MOTOR_2[2],PID_I_MOTOR_2[3],PID_I_MOTOR_2[4]);
	// 电机3速度环 PID
	pid_init(&chassis_pid.motor_3_I_pid_parameters,&chassis_pid.motor_3_I_pid_variable,PID_I_MOTOR_3[0],PID_I_MOTOR_3[1],PID_I_MOTOR_3[2],PID_I_MOTOR_3[3],PID_I_MOTOR_3[4]);
	
	// 底盘转动 PID
	for(int i = 0;i < 8;i++)
	{
		pid_init(&chassis_pid.rotate_pid_parameters[i],&chassis_pid.rotate_pid_variable,ROTATE_PID[i][0],ROTATE_PID[i][1],ROTATE_PID[i][2],ROTATE_PID[i][3],ROTATE_PID[i][4]);
	}
	
	return chassis_pid;
}

/* 底盘滤波器参数结构体初始化 */
_CHASSIS_FILTER_ chassis_filter_init(void)
{
	static _CHASSIS_FILTER_ chassis_filter;

	// 电机1 滤波器
	karman_init(&chassis_filter.motor_1_karman_parameters,&chassis_filter.motor_1_karman_variable,KARMAN_MOTOR_1[0],KARMAN_MOTOR_1[1]);
	
	// 电机2 滤波器
	karman_init(&chassis_filter.motor_2_karman_parameters,&chassis_filter.motor_2_karman_variable,KARMAN_MOTOR_2[0],KARMAN_MOTOR_2[1]);
	
	// 电机3 滤波器
	karman_init(&chassis_filter.motor_3_karman_parameters,&chassis_filter.motor_3_karman_variable,KARMAN_MOTOR_3[0],KARMAN_MOTOR_3[1]);
	
	return chassis_filter;
}

/* 电流滤波器参数结构体初始化 */
_CURRENT_FILTER_ current_filter_init(void)
{
	static _CURRENT_FILTER_ current_filter;

	// 电机1 滤波器
	karman_init(&current_filter.motor_current_1_karman_parameters,&current_filter.motor_current_1_karman_variable,KARMAN_CURRENT[0],KARMAN_CURRENT[1]);
	
	// 电机2 滤波器
	karman_init(&current_filter.motor_current_2_karman_parameters,&current_filter.motor_current_2_karman_variable,KARMAN_CURRENT[0],KARMAN_CURRENT[1]);
	
	// 电机3 滤波器
	karman_init(&current_filter.motor_current_3_karman_parameters,&current_filter.motor_current_3_karman_variable,KARMAN_CURRENT[0],KARMAN_CURRENT[1]);
	
	return current_filter;
}
///* 单电机PID控制 */
_CHASSIS_CONTROL_ motor_pid(float (*FUNC_SPEED)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),float (*FUNC_I)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),_CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed)
{
	_CHASSIS_CONTROL_ motor_control;

	switch(motor_num)
	{
		case MOTOR_1:
		{ 
			motor_control.motor_1.duty = FUNC_I(&(chassis_pid -> motor_1_I_pid_parameters),&(chassis_pid -> motor_1_I_pid_variable),FUNC_SPEED(&(chassis_pid -> motor_1_speed_pid_parameters),&(chassis_pid -> motor_1_speed_pid_variable),motor_speed,motor_1_speed),motor_1_I);
			
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
			motor_control.motor_2.duty = FUNC_I(&(chassis_pid -> motor_2_I_pid_parameters),&(chassis_pid -> motor_2_I_pid_variable),FUNC_SPEED(&(chassis_pid -> motor_2_speed_pid_parameters),&(chassis_pid -> motor_2_speed_pid_variable),motor_speed,motor_2_speed),motor_2_I);			
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
			motor_control.motor_3.duty = FUNC_I(&(chassis_pid -> motor_3_I_pid_parameters),&(chassis_pid -> motor_3_I_pid_variable),FUNC_SPEED(&(chassis_pid -> motor_3_speed_pid_parameters),&(chassis_pid -> motor_3_speed_pid_variable),motor_speed,motor_3_speed),motor_3_I);
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
/* 单电机PID控制 */
//_CHASSIS_CONTROL_ motor_pid(
//                float (*FUNC_SPEED)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),
//                    float (*FUNC_I)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),
//                        _CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed)
//{
//	_CHASSIS_CONTROL_ motor_control;

//	switch(motor_num)
//	{
//		case MOTOR_1:
//		{ 
//			motor_control.motor_1.duty = FUNC_I(&(chassis_pid -> motor_1_I_pid_parameters),
//            &(chassis_pid -> motor_1_I_pid_variable),    
//            motor_speed/10,
//            motor_1_I);            
//            if(motor_control.motor_1.duty > 0)
//			{
//				motor_control.motor_1.dir = 0;
//			}
//			else
//			{
//				motor_control.motor_1.dir = 1;
//			}
//			motor_control.motor_1.duty = (int16)abs(motor_control.motor_1.duty);
//			break;
//		}
//		case MOTOR_2:
//		{
//			motor_control.motor_2.duty = FUNC_I(&(chassis_pid -> motor_2_I_pid_parameters),&(chassis_pid -> motor_2_I_pid_variable),motor_speed/10,motor_2_I);			
//			if(motor_control.motor_2.duty > 0)
//			{
//				motor_control.motor_2.dir = 0;
//			}
//			else
//			{
//				motor_control.motor_2.dir = 1;
//			}
//			motor_control.motor_2.duty = (int16)abs(motor_control.motor_2.duty);
//			break;
//		}
//		case MOTOR_3:
//		{
//			motor_control.motor_3.duty = FUNC_I(&(chassis_pid -> motor_3_I_pid_parameters),&(chassis_pid -> motor_3_I_pid_variable),motor_speed/10,motor_3_I);
//			if(motor_control.motor_3.duty > 0)
//			{
//				motor_control.motor_3.dir = 0;
//			}
//			else
//			{
//				motor_control.motor_3.dir = 1;
//			}
//			motor_control.motor_3.duty = (int16)abs(motor_control.motor_3.duty);
//			break;
//		}
//	}
//	return motor_control;
//}
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
	chassis_filter = chassis_filter_init();
   	current_filter = current_filter_init();
 
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

/* 调试 */
void chassis_control_debug(void)
{
	chassis_yaw = 0;
	chassis_linear_speed = 0;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 0;
	// 电机驱动
	motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
	motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
	motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
}


/* 底盘控制转换（X/Y速度->线速度/航向角） */
void chassis_control_transform(float x_speed,float y_speed,float angular_speed)
{
	if(y_speed != 0)
	{
		if(y_speed > 0)
			chassis_yaw = RAD2DEG(atan(x_speed/y_speed));
		else if(y_speed < 0)
			chassis_yaw = 180+RAD2DEG(atan(x_speed/y_speed));
	}	
	else
		chassis_yaw = 90*x_speed/abs(x_speed);
	
	chassis_linear_speed = sqrt(x_speed*x_speed+y_speed*y_speed);
	chassis_angular_speed = angular_speed;
}

/* 移动 */
void chassis_control_move(float chassis_yaw,float linear_speed,float angular_speed)
{
	// 运动学逆解算
	chassis_control = inverse_kinematics(chassis_yaw,linear_speed,angular_speed);
	
	// 电机闭环PID解算
	chassis_control.motor_1 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_1,chassis_control.motor_1_speed).motor_1;
	chassis_control.motor_2 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_2,chassis_control.motor_2_speed).motor_2;
	chassis_control.motor_3 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_3,chassis_control.motor_3_speed).motor_3;
	
	// 电机驱动
	motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
	motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
	motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
}

/* 原地转动角度 */
void chassis_control_angle_rotate(float chassis_yaw,float linear_speed,float rotate_angle)
{
	euler_angle_flag = TRUE;
	static uint8 chassis_rotate_finsh_num_count = 0;
	
	// 运动学逆解算
	if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) > 0.5)
	{
		if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 5)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[0]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) >= 5 && abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 15)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[1]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) >= 15 && abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 25)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[2]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) >= 25 && abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 35)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[3]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) >= 35 && abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 45)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[4]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) >= 45 && abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 55)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[5]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) >= 55 && abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 65)
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[6]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		else
			chassis_control = inverse_kinematics(chassis_yaw,linear_speed,-ROTATE_PID_KIND(&(chassis_pid.rotate_pid_parameters[7]),&(chassis_pid.rotate_pid_variable),-rotate_angle,GYRO_Z_FORWARD*yaw));
		
		// 电机闭环PID解算
		chassis_control.motor_1 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_1,chassis_control.motor_1_speed).motor_1;
		chassis_control.motor_2 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_2,chassis_control.motor_2_speed).motor_2;
		chassis_control.motor_3 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_3,chassis_control.motor_3_speed).motor_3;
	
		// 电机驱动
		motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
		motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
		motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
		
		chassis_rotate_finsh_flag = FALSE;
		
		if(abs(rotate_angle+GYRO_Z_FORWARD*yaw) < 4.5)
			chassis_rotate_finsh_num_count++;
		if(chassis_rotate_finsh_num_count >= 5)
		{
			// 电机闭环PID解算
			chassis_control.motor_1 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_1,0).motor_1;
			chassis_control.motor_2 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_2,0).motor_2;
			chassis_control.motor_3 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_3,0).motor_3;
			// 电机停止
			motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
			motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
			motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
	//		motor_set_duty(MOTOR_1,0,chassis_control.motor_1.dir);
	//		motor_set_duty(MOTOR_2,0,chassis_control.motor_2.dir);
	//		motor_set_duty(MOTOR_3,0,chassis_control.motor_3.dir);
		chassis_rotate_finsh_flag = TRUE;
			chassis_rotate_finsh_num_count = 0;
		}
	}
	else
	{
		// 电机闭环PID解算
		chassis_control.motor_1 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_1,0).motor_1;
		chassis_control.motor_2 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_2,0).motor_2;
		chassis_control.motor_3 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_3,0).motor_3;
		// 电机停止
		motor_set_duty(MOTOR_1,chassis_control.motor_1.duty,chassis_control.motor_1.dir);
		motor_set_duty(MOTOR_2,chassis_control.motor_2.duty,chassis_control.motor_2.dir);
		motor_set_duty(MOTOR_3,chassis_control.motor_3.duty,chassis_control.motor_3.dir);
//		motor_set_duty(MOTOR_1,0,chassis_control.motor_1.dir);
//		motor_set_duty(MOTOR_2,0,chassis_control.motor_2.dir);
//		motor_set_duty(MOTOR_3,0,chassis_control.motor_3.dir);
		chassis_rotate_finsh_flag = TRUE;
	}
}

/* 
	底盘总控制
	用于推箱子任务/圆环
*/
void chassis_total_control(_CHASSIS_MOTION_ _chassis_motion_flag_,float _chassis_yaw_,float _chassis_linear_speed_,float _chassis_angular_speed_,float _chassis_rotate_angle_,uint32 _delay_ms_)
{
	screen_clear();
	
	chassis_motion_flag = _chassis_motion_flag_;
	chassis_rotate_finsh_flag = FALSE;
	chassis_move_time_count_flag = FALSE;
	
	// 定义X方向追踪PID指针函数
	float (*X_FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float);
	float x_speed = 0;
	float y_speed = 0;
	X_FUNC = X_AI_TRACK_PID_KIND;
	
	// 阻塞式等待旋转结束
	if(chassis_motion_flag == CHASSIS_ANGLE_ROTATE)
	{
		chassis_yaw = _chassis_yaw_;
		chassis_linear_speed = _chassis_linear_speed_;
		chassis_angular_speed = _chassis_angular_speed_;
		chassis_rotate_angle = _chassis_rotate_angle_;
		while(1)
		{
			if(chassis_rotate_finsh_flag == TRUE)
			{
				break;
			}	
		}
	}
	// 延时等待移动完成
	else
	{
		chassis_move_time_count_flag = TRUE;
		
		uint8 is_in_track = FALSE;	// 在赛道内
		int16 num = 0;		// 在赛道内的计数
		
		float max_sum_weight_normalization_yaw = 0;	// 最大归一化加权和航向角
		float max_sum_weight_normalization = 0;	// 最大归一化加权和
		float max_sum_weight_normalization_yaw_cache = 0;	// 最大归一化加权和航向角缓存
		float max_sum_weight_normalization_cache = 0;	// 最大归一化加权和缓存
		
		// 若方块推出赛道，则退出循环
		while(1)
		{
			if(_delay_ms_ != 0)
			{
				chassis_yaw = _chassis_yaw_;
				chassis_linear_speed = _chassis_linear_speed_;
				chassis_angular_speed = _chassis_angular_speed_;
				chassis_rotate_angle = _chassis_rotate_angle_;
			}
			// 平移直到达到设定时间
			if(_delay_ms_ != 0 && chassis_move_time_count > _delay_ms_ && _chassis_angular_speed_ == 0 && _chassis_rotate_angle_ == 0)
			{
				break;
			}	
			// 平移直到推箱子出界
			if(_delay_ms_ == 0 && _chassis_angular_speed_ == 0 && _chassis_rotate_angle_ == 0)
			{
				x_speed = X_FUNC(&(ai_track_pid.x_ai_track_pid_paraments),&(ai_track_pid.x_ai_track_pid_variable),0,-track_err);
				y_speed = _chassis_linear_speed_;
				if(y_speed != 0)
				{
					if(y_speed > 0)
						chassis_yaw = RAD2DEG(atan(x_speed/y_speed));
					else if(y_speed < 0)
						chassis_yaw = 180+RAD2DEG(atan(x_speed/y_speed));
				}	
				else
					chassis_yaw = 90*x_speed/abs(x_speed);
				
				chassis_linear_speed = sqrt(x_speed*x_speed+y_speed*y_speed);
				chassis_angular_speed = PATH_PID[0][3]*GYRO_Z_FORWARD*gyro_z;
				chassis_rotate_angle = _chassis_rotate_angle_;
				
				if(grayscale < 1000 && num < 22)
					num++;
				if(num > 20)
					is_in_track = TRUE;
				if(is_in_track == TRUE && grayscale > 3000)
				{
					break;
				}
			}				
			// 绕圆心转动直到箱子矫正完成
			else if(_delay_ms_ == 0 && _chassis_angular_speed_ != 0 && _chassis_rotate_angle_ == 0)
			{
				chassis_yaw = _chassis_yaw_;
				chassis_linear_speed = _chassis_linear_speed_;
				chassis_angular_speed = _chassis_angular_speed_;
				chassis_rotate_angle = _chassis_rotate_angle_;
				
				euler_angle_flag = TRUE;	// 开启欧拉角解算
				threshold(mt9v03x_image);
				symmetry_rectificate();
				
				screen_float(0, 2*MT9V03X_H+2*MENU_ROW_PITCH, yaw, 2, 3);
				screen_float(0, 2*MT9V03X_H+3*MENU_ROW_PITCH, sum_weight_normalization, 2, 3);
				screen_float(0, 2*MT9V03X_H+4*MENU_ROW_PITCH, frame_white_num_normalization[0], 2, 3);
				screen_float(0, 2*MT9V03X_H+5*MENU_ROW_PITCH, frame_white_num_normalization[1], 2, 3);
				
				// 找最大归一化加权和与其对应航向角（取加权和对应的角度较大的那个）
				// 满足不正对赛道
				if(frame_white_num_normalization[0] >= frame_white_num_normalization_limit && frame_white_num_normalization[1] >= frame_white_num_normalization_limit && sum_weight_normalization >= sum_weight_normalization_limit[1])
				{					
					if(sum_weight_normalization >= max_sum_weight_normalization_cache)	// 加权和大于之前的
					{
						max_sum_weight_normalization_cache = sum_weight_normalization;
						max_sum_weight_normalization_yaw_cache = yaw;
					}
					else	// 加权和小于之前的
					{
						max_sum_weight_normalization = max_sum_weight_normalization_cache;
						max_sum_weight_normalization_yaw = max_sum_weight_normalization_yaw_cache;
						max_sum_weight_normalization_cache = 0;
						max_sum_weight_normalization_yaw_cache = 0;
					}
				}
				
				// 达到阈值就停止，去推箱子
				if(sum_weight_normalization >= sum_weight_normalization_limit[0] && frame_white_num_normalization[0] >= frame_white_num_normalization_limit && frame_white_num_normalization[1] >= frame_white_num_normalization_limit)
				{
					euler_angle_flag = FALSE;
					break;
				}
				// 转动超过180°没达到阈值，就反过来转
				if(abs(yaw) > 180)
				{
					chassis_yaw = -_chassis_yaw_;
					chassis_angular_speed = -_chassis_angular_speed_;
					while(1)
					{
						if(abs(yaw) <= abs(max_sum_weight_normalization_yaw))
						{
							euler_angle_flag = FALSE;
							break;
						}
					}
					break;
				}
			}	
			// 绕圆心转动直到达到目标角度
			else if(_delay_ms_ == 0 && _chassis_angular_speed_ != 0 && _chassis_rotate_angle_ != 0)
			{
				euler_angle_flag = TRUE;
				chassis_yaw = _chassis_yaw_;
				chassis_linear_speed = _chassis_linear_speed_;
				chassis_angular_speed = _chassis_angular_speed_;
				chassis_rotate_angle = _chassis_rotate_angle_;
				
				if(abs(yaw) >= abs(_chassis_rotate_angle_))
				{
					euler_angle_flag = FALSE;
					break;
				}
			}			
			else if(_delay_ms_ == 0)
			{
				break;
			}
		}
		chassis_move_time_count_flag = FALSE;
	}
		
	// 停车 
	chassis_motion_flag = CHASSIS_STOP;
		
	euler_angle_flag = FALSE;
}


