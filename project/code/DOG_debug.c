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
void menu_uart_service(void)
{
	/*****************************************/
//	theory_motor_speed_update();
//	real_motor_speed_update();
//	motor_duty_update();
//    motor_error_update();
//    motor_delta_update();
//    motor_value_delta_update();
//    motor_current_update();

//	just_float(3,(float)motor_1_I,(float)motor_2_I,(float)motor_3_I);
//	just_float(3,(float)motor_1_I,(float)motor_2_I,(float)motor_3_I);
//    just_float(3,(float)motor_1_V,(float)motor_1_V_karman,(float)motor_1_I);

    just_float(3,(float)motor_1_I,(float)motor_3_I,0);

////    just_float(3,(float)motor_3_V,(float)motor_3_V_karman,(float)motor_3_I);
    just_float(4,(float)motor_2_I,(float)chassis_control.motor_2.duty,chassis_control.motor_2_speed,motor_2_speed);
//    just_float(3,(float)motor_1_V,(float)motor_2_V,(float)motor_3_V);
	
    update_data_end();

//	theory_motor_speed_update();
//    real_motor_speed_update();
//    just_float(3,(float)motor_1_I,(float)motor_2_I,(float)motor_3_I);
//    just_float(1,chassis_linear_speed);
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