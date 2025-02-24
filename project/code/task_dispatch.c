/*
该文件用于任务调度

API：
摄像头控制任务调度
*/          

#include "common.h"

/* 控制模式选择 */
static void control_mode_choose(void)
{
	if(control_mode_flag == BLOCK_RETRACK_MODE || control_mode_flag == BLOCK_MOVE_OUT_MODE || track_finsh_next_mode_flag == BLOCK_MOVE_OUT_MODE);
	else if(max_detection_box_width > detection_box_width_limit && abs(track_x_center-MCXVISION_IMAGE_WIDTH/2) < detection_box_center_limit && mcxvision_enable_flag == TRUE && control_mode_flag != BLOCK_MOVE_OUT_MODE)
	{
		control_mode_flag = MCXVISION_TRACK_MODE;
	}
	else
	{
		control_mode_flag = PATH_CONTROL_MODE;
	}
	
}

/* 控制模式调度 */
void control_mode_dispatch(void)
{
	if(mcxvision_enable_flag == TRUE)
	{
		detection_result_upgrade_judge();	// AI摄像头更新判断
		mcxvision_max_detection_box_center_get();
	}	
	control_mode_choose();	// 摄像头控制选择
	switch(control_mode_flag)
	{
		case PATH_CONTROL_MODE:{ path_control(path_linear_speed_target); track_finsh_next_mode_flag = BLOCK_RETRACK_MODE; break; }	// 循迹控制
		case MCXVISION_TRACK_MODE:{ mcxvision_track_control(track_linear_speed_target,track_finsh_next_mode_flag); break; }	// MCXVISION跟踪控制
		case OPENART_TRACK_MODE:{ break; }	// OPENART跟踪控制
		case BLOCK_RETRACK_MODE:{ chassis_total_control(CHASSIS_MOVE,45,2,0,0,1250); chassis_total_control(CHASSIS_ANGLE_ROTATE,0,0,0,-90,3000); control_mode_flag = MCXVISION_TRACK_MODE; track_finsh_next_mode_flag = BLOCK_MOVE_OUT_MODE; break; }		// 方块侧面重追踪模式
		case BLOCK_MOVE_OUT_MODE:{ block_move_out_control(); control_mode_flag = PATH_CONTROL_MODE; track_finsh_next_mode_flag = BLOCK_RETRACK_MODE; break; }	// 方块推离模式
	}
}

/* 推箱子 */
void block_move_out_control(void)
{
	// 推
	chassis_total_control(CHASSIS_MOVE,0,2,0,0,2500);
	// 回
	chassis_total_control(CHASSIS_MOVE,180,2,0,0,2500);
	chassis_total_control(CHASSIS_ANGLE_ROTATE,0,0,0,90,3000);
	chassis_total_control(CHASSIS_MOVE,-135,2,0,0,1250);
}