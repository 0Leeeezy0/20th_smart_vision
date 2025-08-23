#ifndef _AI_H_
#define _AI_H_

#include "data.h"

/* AI摄像头初始化 */
void ai_camera_init(void);

/* AI摄像头0 初始化 */
static void ai_camera_0_init(void);
	
/* AI摄像头1 初始化 */
static void ai_camera_1_init(void);
	
/* AI摄像头2 初始化 */
static void ai_camera_2_init(void);

/* 
	AI摄像头 识别结果转换 
	AI_CAMERA_0: 识别框左上角X坐标；识别框宽度
	AI_CAMERA_1: tool_detection_result_raw
	AI_CAMERA_2: num_detection_result_raw
*/
static void detection_result_trans(_ai_camera_idx_ ai_camera_idx, ...);

/* 补光灯控制 */ 
void supplement_lamp(uint8_t status);

/* 串口中断 */
void uart_rx_interrupt_handler_ai_camera_0 (void);
void uart_rx_interrupt_handler_ai_camera_1 (void);
void uart_rx_interrupt_handler_ai_camera_2 (void);

#endif
