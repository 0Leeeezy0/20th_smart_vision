/*
该文件用于OpenART和MCXVision的通信

API：
MCXVISION摄像头初始化
AI推理最大识别框索引获取
接收中断处理函数
*/           
#ifndef _AI_TRACK_CONTROL_
#define _AI_TRACK_CONTROL_

#include "common.h"

extern uint8 num_flag;
extern uint8 get_data_A;
extern uint32 fifo_data_count_A;                         // fifo 数据个数
extern fifo_struct uart_data_fifo_A;
extern uint8 uart_get_data_A[64];                            // 串口接收数据缓冲区
extern uint8 fifo_get_data_A[64];                            // fifo 输出读出缓冲区

/* MCXVISION识别结果：识别框左上、右下点坐标 */
typedef struct
{
    uint16 res_x1;
    uint16 res_y1;
    uint16 res_x2;
    uint16 res_y2;
}_MCXVISION_DETECTION_RESULT_;

/* AI摄像头初始化 */
void ai_camera_init(void);

/* MCXVISION摄像头初始化 */
void mcxvision_init(void);

/* OPENART摄像头初始化 */
void openart_init(void);

/* 识别结果清空 */
void mcxvision_detection_result_clear(void);

/* AI推理框图宽度转换 */
void mcxvision_data_transform(void);

/* 识别结果更新判断 */
void detection_result_upgrade_judge(void);

/* AI推理最大识别框中心坐标获取 */
void mcxvision_max_detection_box_center_get(void);	// YJC是大傻逼  

/* MCXVISION摄像头追踪控制 */
void mcxvision_track_control(float track_linear_speed,_CONTROL_MODE_ track_finsh_next_mode_flag);

/* 接收中断处理函数 */
void uart_rx_interrupt_handler (void);

void uart_rx_interrupt_handler_A (void);

#endif