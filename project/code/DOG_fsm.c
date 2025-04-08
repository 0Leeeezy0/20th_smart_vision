/*
该文件用于任务调度

API：
摄像头控制任务调度
*/          

#include "common.h"

/* 控制模式选择 */
static void control_mode_choose(void)
{
	if((control_mode_flag == BLOCK_RETRACK_MODE || control_mode_flag == BLOCK_MOVE_OUT_MODE || track_finsh_next_mode_flag == BLOCK_MOVE_OUT_MODE) && ai_camera_0_enable_flag == TRUE)
	{
		if(detection_box_width == 0 && track_x_center == 0)
			control_mode_flag = PATH_CONTROL_MODE;
	}
	else if(detection_box_width > detection_box_width_limit && abs(track_x_center-AI_CAMERA_0_IMAGE_WIDTH/2) < detection_box_center_limit && ai_camera_0_enable_flag == TRUE)
		control_mode_flag = AI_TRACK_MODE;
	else
		control_mode_flag = PATH_CONTROL_MODE;
}

/* 控制模式调度 */
void control_mode_dispatch(void)
{
	control_mode_choose();	// 摄像头控制选择
	switch(control_mode_flag)
	{
		case PATH_CONTROL_MODE:{ path_control(path_linear_speed_target); track_finsh_next_mode_flag = BLOCK_RETRACK_MODE; break; }	// 循迹控制
		case AI_TRACK_MODE:{ ai_track_control(track_linear_speed_target,track_finsh_next_mode_flag); break; }	// MCXVISION跟踪控制
		case BLOCK_RETRACK_MODE:{ system_delay_ms(500); fxxk_box(0); control_mode_flag = AI_TRACK_MODE; track_finsh_next_mode_flag = BLOCK_MOVE_OUT_MODE; break; }		// 方块侧面重追踪模式
		case BLOCK_MOVE_OUT_MODE:{ fxxk_box(1); control_mode_flag = PATH_CONTROL_MODE; track_finsh_next_mode_flag = BLOCK_RETRACK_MODE; break; }	// 方块推离模式
	}
}