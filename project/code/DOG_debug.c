#include "common.h"

// 周期
static uint32 period = 3600;
// 幅度
static uint32 amplitude = 70;
// 速度
static float speed = 100;

/* 串口信息发送 */
void menu_uart_service(void)
{
	setbuf(stdout,NULL);
	/*****************************************/
	theory_motor_speed_update();
	update_data_add();
//	real_motor_speed_update();
//	update_data_add();
	printf("%f,%f,%f",motor_1_I,motor_2_I,motor_3_I);
//	update_data_add();
//	motor_duty_update();
//	update_data_add();
//    motor_error_update();
//    update_data_add();
//    motor_delta_update();
//    update_data_add();
//    motor_value_delta_update();
	update_data_end();
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