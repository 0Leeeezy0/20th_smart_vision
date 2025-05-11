/*
该文件用于OpenART和MCXVision的通信

API：
MCXVISION摄像头初始化
AI推理最大识别框索引获取
接收中断处理函数
*/           
#ifndef _DOG_AI_H_
#define _DOG_AI_H_

#include "common.h"

/* AI摄像头初始化 */
void ai_camera_init(void);

/* AI摄像头0 初始化 */
void ai_camera_0_init(void);

/* AI摄像头1（工具） 初始化 */
void ai_camera_1_init(void);

/* AI摄像头2（数字） 初始化 */
void ai_camera_2_init(void);

/* AI摄像头0 推理最大识别框中心坐标获取 */
void ai_camera_0_max_detection_box_center_get(void);	// YJC是大傻逼  

/* AI摄像头0 追踪控制 */
void ai_track_control(float track_linear_speed,_CONTROL_MODE_ track_finsh_next_mode_flag);

/* 接收中断处理函数 */
void uart_rx_interrupt_handler_ai_camera_0 (void);

void uart_rx_interrupt_handler_ai_camera_1 (void);

#endif