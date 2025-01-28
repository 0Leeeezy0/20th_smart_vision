/*
该文件用于任务调度

API：
摄像头控制任务调度
*/          

#include "common.h"

/* 控制模式选择 */
static void control_mode_choose(void)
{ 
	if(max_detection_box_width > detection_box_width_limit && abs(track_x_center-MCXVISION_IMAGE_WIDTH/2) < detection_box_center_limit && mcxvision_enable_flag == TRUE && control_mode_flag != BLOCK_MOVE_OUT_MODE)
	{
		control_mode_flag = MCXVISION_TRACK_MODE;
	}
	else if(control_mode_flag == BLOCK_MOVE_OUT_MODE)
	{
		control_mode_flag = BLOCK_MOVE_OUT_MODE;
	}
	else
	{
		control_mode_flag = PATH_CONTROL_MODE;
	}
	
}

/* 摄像头控制任务调度 */
void camera_control_dispatch(void)
{
	if(mcxvision_enable_flag == TRUE)
	{
		detection_result_upgrade_judge();	// AI摄像头更新判断
		mcxvision_max_detection_box_center_get();
	}	
	control_mode_choose();	// 摄像头控制选择
	switch(control_mode_flag)
	{
		case PATH_CONTROL_MODE:{ path_control(path_linear_speed_target); break; }	// 循迹控制
		case MCXVISION_TRACK_MODE:{ mcxvision_track_control(track_linear_speed_target); break; }	// MCXVISION跟踪控制
		case OPENART_TRACK_MODE:{ break; }	// OPENART跟踪控制
		case BLOCK_MOVE_OUT_MODE:{ block_move_out_control(); control_mode_flag = PATH_CONTROL_MODE; break; }
	}
}

/* 推箱子 */
void block_move_out_control(void)
{
	// 推
	chassis_motion_flag = CHASSIS_MOVE;
	chassis_yaw = 45;
	chassis_linear_speed = 1;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 0;
	system_delay_ms(3000);
	euler_angle_flag = FALSE;
	chassis_motion_flag = CHASSIS_ANGLE_ROTATE;
	chassis_yaw = 0;
	chassis_linear_speed = 0;
	chassis_angular_speed = 0;
	chassis_rotate_angle = -90;
	system_delay_ms(3000);
	euler_angle_flag = FALSE;
	chassis_motion_flag = CHASSIS_MOVE;
	chassis_yaw = 0;
	chassis_linear_speed = 2;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 0;
	system_delay_ms(2500);
	euler_angle_flag = FALSE;
	// 回
	chassis_motion_flag = CHASSIS_MOVE;
	chassis_yaw = 180;
	chassis_linear_speed = 2;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 0;
	system_delay_ms(2500);
	euler_angle_flag = FALSE;
	chassis_motion_flag = CHASSIS_ANGLE_ROTATE;
	chassis_yaw = 0;
	chassis_linear_speed = 0;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 90;
	system_delay_ms(3000);
	euler_angle_flag = FALSE;
	chassis_motion_flag = CHASSIS_MOVE;
	chassis_yaw = -135;
	chassis_linear_speed = 1;
	chassis_angular_speed = 0;
	chassis_rotate_angle = 0;
	system_delay_ms(3000);
	euler_angle_flag = FALSE;
}