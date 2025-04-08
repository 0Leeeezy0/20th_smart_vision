/*
该文件用于车模元素动作

API：
*/
#include "common.h"
#include "DOG_element.h"

/* 对称法矫正初始化 */
void symmetry_rectificate_init(void)
{
	sum_weight = 0;
	for(int X = MT9V03X_W/2;X >= 0;X--)
	{
		for(int Y = symmetry_rectificate_end_y;Y < symmetry_rectificate_start_y;Y++)
		{
			if(MT9V03X_W/2-X >= 0 && MT9V03X_W/2-X < MT9V03X_W/8)	
				sum_weight += rectificate_weight[0];
			else if(MT9V03X_W/2-X >= MT9V03X_W/8 && MT9V03X_W/2-X < 2*MT9V03X_W/8)	
				sum_weight += rectificate_weight[1];
			else if(MT9V03X_W/2-X >= 2*MT9V03X_W/8 && MT9V03X_W/2-X < 3*MT9V03X_W/8)	
				sum_weight += rectificate_weight[2];
			else 
				sum_weight += rectificate_weight[3];			
		}
	}
}

/* 对称法矫正 */
void symmetry_rectificate(void)
{
	// 对称法矫正权重和
	uint32 sum_weight_rectificate = 0;
	
	for(int X = MT9V03X_W/2;X >= 0;X--)
	{
		for(int Y = symmetry_rectificate_end_y;Y < symmetry_rectificate_start_y;Y++)
		{
			if(image_OTSU[Y][X] == image_OTSU[Y][MT9V03X_W-1-X])
			{
				if(MT9V03X_W/2-X >= 0 && MT9V03X_W/2-X < MT9V03X_W/8)	
					sum_weight_rectificate += rectificate_weight[0];
				else if(MT9V03X_W/2-X >= MT9V03X_W/8 && MT9V03X_W/2-X < 2*MT9V03X_W/8)	
					sum_weight_rectificate += rectificate_weight[1];
				else if(MT9V03X_W/2-X >= 2*MT9V03X_W/8 && MT9V03X_W/2-X < 3*MT9V03X_W/8)	
					sum_weight_rectificate += rectificate_weight[2];
				else 
					sum_weight_rectificate += rectificate_weight[3];			
			}
		}
	}
	sum_weight_normalization = (float)sum_weight_rectificate/(float)sum_weight;
}

/* 艹箱子 */
void fxxk_box(uint8 steps)
{
	static _AI_CAMERA_1_DETECTION_RESULT_ ai_camera_1_detection_result_swap;
	if(steps == 0)
	{
		memcpy(&ai_camera_1_detection_result_swap, &ai_camera_1_detection_result, sizeof(ai_camera_1_detection_result));
	}
	if(ai_camera_1_detection_result_swap.result_kind == 0 || ai_camera_1_detection_result_swap.result_kind == 1)
	{
		// 右推
		if((ai_camera_1_detection_result_swap.lable >= 0 && ai_camera_1_detection_result_swap.lable <= 8 && ai_camera_1_detection_result_swap.result_kind == 0) || (ai_camera_1_detection_result_swap.num&1 == 0 && ai_camera_1_detection_result_swap.result_kind == 1))
		{
			switch(steps)
			{
				case 0:
				{
//					chassis_total_control(CHASSIS_MOVE,-45,2,0,0,1250); 
//					chassis_total_control(CHASSIS_ANGLE_ROTATE,0,0,0,90,0);
					chassis_total_control(CHASSIS_MOVE,-90,2,0.8,0,0); 
					break;
				}
				case 1:
				{
					// 推
					chassis_total_control(CHASSIS_MOVE,0,2,0,0,0);
					// 回
					chassis_total_control(CHASSIS_ANGLE_ROTATE,0,0,0,-120,0);
					break;
				}
			}
		}
		// 左推
		else if((ai_camera_1_detection_result_swap.lable >= 9 && ai_camera_1_detection_result_swap.lable <= 15 && ai_camera_1_detection_result_swap.result_kind == 0) || (ai_camera_1_detection_result_swap.num&1 == 1 && ai_camera_1_detection_result_swap.result_kind == 1))
		{
			switch(steps)
			{
				case 0:
				{
//					chassis_total_control(CHASSIS_MOVE,45,2,0,0,1250); 
//					chassis_total_control(CHASSIS_ANGLE_ROTATE,0,0,0,-90,0);
					chassis_total_control(CHASSIS_MOVE,90,2,-0.8,0,0); 
					break;
				}
				case 1:
				{
					// 推
					chassis_total_control(CHASSIS_MOVE,0,2,0,0,0);
					// 回
					chassis_total_control(CHASSIS_ANGLE_ROTATE,0,0,0,120,0);
					break;
				}
			}
		}
	}
	mid_x = MT9V03X_W/2;
}