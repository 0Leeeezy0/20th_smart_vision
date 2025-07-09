#include "common.h"

// 周期
static uint32 period = 3600;
// 幅度
static uint32 amplitude = 70;
// 速度
static float speed = 100;

/* 
	串口信息发送 
	比赛时务必关闭
*/
extern float gyro_err;
extern _PID_PARAMETERS_  path_fuzzy_pid_parameters;
extern _PID_PARAMETERS_  path_fuzzy_gyro_z_pid_parameters;
void menu_uart_service(void)
{
	/*****************************************/
//	theory_motor_speed_update();	
    //float path_pid_output = path_control_pid(PATH_PID_KIND,path_pid,path_err);

//	real_motor_speed_update();
    
//	motor_duty_update();
////    motor_error_update();
////    motor_delta_update();
////    motor_value_delta_update();I_Original_ADC_data_2
//    motor_current_update();  
//    just_float(2,path_err,path_pid_output);
//    just_float(1,bat_voltage);
////    just_float(1,chassis_linear_speed);    
    just_float(3,bat_voltage,(float)path_err,(float)gyro_err);   
    just_float(3,path_fuzzy_pid_parameters.p,path_fuzzy_pid_parameters.d,path_fuzzy_gyro_z_pid_parameters.d);
//    just_float(1,chassis_linear_speed);
	update_data_end();
//	update_data_end();
	/*****************************************/
}

/* 调参服务 */
void debug_service(_DEBUG_MODE_ debug_mode)
{
	menu_uart_service();
	debug_time_count_flag = TRUE;
	/*****************************************/
	switch(debug_mode)
	{
		case SIN_TRACK_ERR_MODE:	/* 正弦 track_err */
		{
			debug_time_count = debug_time_count%period;
			path_err = amplitude*sin(DEG2RAD(ROUND(debug_time_count,(period/360))));
			
			float path_pid_output = path_control_pid(PATH_PID_KIND,path_pid,path_err);
		
			chassis_linear_speed = speed;
			chassis_yaw = 0;
			chassis_angular_speed = path_pid_output;
			break;
		}
		default:
			break;
	}
	/*****************************************/
}