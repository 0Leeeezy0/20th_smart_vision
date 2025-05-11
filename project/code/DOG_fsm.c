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
		if(detection_box_width == 0 && track_x_center == 0) // && track_finsh_next_mode_flag != BLOCK_MOVE_OUT_MODE
			control_mode_flag = PATH_CONTROL_MODE;
	}
	else if(detection_box_width > detection_box_width_limit && abs(track_x_center-AI_CAMERA_0_IMAGE_WIDTH/2) < detection_box_center_limit && shift_distance >= 0.5 && ai_camera_0_enable_flag == TRUE)
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
		case PATH_CONTROL_MODE:
		{ 
			threshold(mt9v03x_image);	// 二值化
	//		dilate(mt9v03x_image);
	//		erode(mt9v03x_image);
			side_extract();	// 八邻域边线获取
			side_point_kind_judge();	// 边线点类型判断，判断是否是弯道
			path_curvature_normalization_judge();	// 赛道归一化曲率计算
			path_extract();	// 路径提取
			longest_white_col();	// 最长白列
			// 圆环使能
			if(circle_path_enable_flag == TRUE && shift_distance >= 0.2)	
			{
				circle_path_element_judge();	// 圆环元素识别
			}
			// 斑马线
			if(zebra_path_element_start_judge_enable_flag == TRUE)
			{
				zebra_crossing_path_element_judge();
				if(path_element_flag == ZEBRA_CROSSING_PATH)
				{
					chassis_motion_flag = CHASSIS_STOP;
					zebra_crossing_path_element_stop_delay_time_count_flag = TRUE;
					while(1)
					{
						if(zebra_crossing_path_element_stop_delay_time_count < 500)
						{
							longest_white_col();	// 其他赛道使用最长白列
							path_control(path_linear_speed_target); 	// 控制
						}
						else if(zebra_crossing_path_element_stop_delay_time_count >= 500)
						{
							gpio_set_level(BUZZER_PIN, 0);
							chassis_motion_flag = CHASSIS_STOP;
							while(1)
							{
								menu_root_page();
							}
						}
					}	
				}
			}
			path_control(path_linear_speed_target); 	// 控制
			track_finsh_next_mode_flag = BLOCK_RETRACK_MODE; 
			break; 
		}	// 循迹控制
		case AI_TRACK_MODE:{ ai_track_control(track_linear_speed_target,track_finsh_next_mode_flag); break; }	// MCXVISION跟踪控制
		case BLOCK_RETRACK_MODE:{ system_delay_ms(500); fxxk_box(0); control_mode_flag = AI_TRACK_MODE; track_finsh_next_mode_flag = BLOCK_MOVE_OUT_MODE; break; }		// 方块侧面重追踪模式
		case BLOCK_MOVE_OUT_MODE:{ fxxk_box(1); control_mode_flag = PATH_CONTROL_MODE; track_finsh_next_mode_flag = BLOCK_RETRACK_MODE; break; }	// 方块推离模式
	}
}