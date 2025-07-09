#include "common.h"
#include "data.h"
                    
static uint32 fifo_data_count = 0;              // fifo 数据个数
static fifo_struct ai_camera_0_uart_fifo;		// AI摄像头0 串口接收fifo
static fifo_struct ai_camera_1_uart_fifo;		// AI摄像头1 串口接收fifo
static fifo_struct ai_camera_2_uart_fifo;		// AI摄像头2 串口接收fifo

static uint8 ai_camera_0_uart_buffer[64];       // 串口接收数据缓冲区
static uint8 ai_camera_0_fifo_buffer[64];       // fifo 输出读出缓冲区

static uint8 ai_camera_1_uart_buffer[64];       // 串口接收数据缓冲区
static uint8 ai_camera_1_fifo_buffer[64];       // fifo 输出读出缓冲区

static uint8 ai_camera_2_uart_buffer[64];       // 串口接收数据缓冲区
static uint8 ai_camera_2_fifo_buffer[64];       // fifo 输出读出缓冲区

static uint8 uart_data[] = {0x2C, 0x9F, 0x08, 0x5B, 0x5B};

/* AI摄像头初始化 */
void ai_camera_init(void){
	ai_camera_0_init();
	ai_camera_1_init();
	ai_camera_2_init();
}

/* AI摄像头0 初始化 */
void ai_camera_0_init(void){
    fifo_init(&ai_camera_0_uart_fifo, FIFO_DATA_8BIT, ai_camera_0_uart_buffer, 64);              // 初始化 fifo 挂载缓冲区
    uart_init(AI_CAMERA_0_UART_INDEX, AI_CAMERA_0_UART_BAUDRATE, AI_CAMERA_0_UART_TX_PIN, AI_CAMERA_0_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(AI_CAMERA_0_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(AI_CAMERA_0_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* AI摄像头1（工具） 初始化 */	
void ai_camera_1_init(void){
    fifo_init(&ai_camera_1_uart_fifo, FIFO_DATA_8BIT, ai_camera_1_uart_buffer, 64);              // 初始化 fifo 挂载缓冲区
    
    uart_init(AI_CAMERA_1_UART_INDEX, AI_CAMERA_1_UART_BAUDRATE, AI_CAMERA_1_UART_TX_PIN, AI_CAMERA_1_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(AI_CAMERA_1_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(AI_CAMERA_1_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* AI摄像头2（数字） 初始化 */
void ai_camera_2_init(void){
    fifo_init(&ai_camera_2_uart_fifo, FIFO_DATA_8BIT, ai_camera_2_uart_buffer, 64);              // 初始化 fifo 挂载缓冲区
    
    uart_init(AI_CAMERA_2_UART_INDEX, AI_CAMERA_2_UART_BAUDRATE, AI_CAMERA_2_UART_TX_PIN, AI_CAMERA_2_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(AI_CAMERA_2_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(AI_CAMERA_2_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* 
	AI摄像头 识别结果转换 
	AI_CAMERA_0: 识别框左上角X坐标；识别框宽度；识别框高度
	AI_CAMERA_1: tool_detection_result_raw
	AI_CAMERA_2: num_detection_result_raw
*/
static void detection_result_trans(_ai_camera_idx_ ai_camera_idx, ...){
	va_list args;
   
	switch(ai_camera_idx){
		case AI_CAMERA_0:{
			va_start(args, 3);  // 初始化可变参数列表
			uint8 data_1 = (uint8)va_arg(args, int); // 读取 识别框左上角X坐标
			uint8 data_2 = (uint8)va_arg(args, int); // 读取 识别框宽度
			uint8 data_3 = (uint8)va_arg(args, int); // 读取 识别框高度
			if(data_1 != 0XFF && data_2 != 0XFF && data_3 != 0XFF){
				int16 detection_box_left_x = data_1-AI_CAMERA_0_OFFSET; // 读取 识别框左上角X坐标
				detection_box_width = data_2;  		// 读取 识别框宽度
				detection_box_height = data_3;  	// 读取 识别框宽度
				detection_box_center_x = detection_box_left_x + detection_box_width/2;	// 计算 识别框中心X坐标
			}
			else
				ai_camera_0_init_flag = True;
			
			break;
		}
		case AI_CAMERA_1:{
			va_start(args, 1);  // 初始化可变参数列表
			uint8 tool_detection_result_raw = (uint8)va_arg(args, int);	// 读取 工具识别结果原始值
			if(tool_detection_result_raw != 0XFF){
				detection_result.tool_detection_finsh_flag = True;
				detection_result.tool_raw = tool_detection_result_raw;
				detection_result.tool = (_ai_lable_)tool_detection_result_raw;
			}
			else
				detection_result.ai_camera_init_flag[0] = True;
			
			break;
		}
		case AI_CAMERA_2:{
			va_start(args, 1);  // 初始化可变参数列表
			uint8 num_detection_result_raw = (uint8)va_arg(args, int);	// 读取 工具识别结果原始值
			if(num_detection_result_raw != 0XFF){
				detection_result.num_detection_finsh_flag = True;
				detection_result.num_raw = num_detection_result_raw;
				detection_result.num = num_detection_result_raw;
			}
			else
				detection_result.ai_camera_init_flag[1] = True;
			
			break;
		}
	}
	va_end(args);
}

//-------------------------------------------------------------------------------------------------------------------
// 函数简介     UART_INDEX 的接收中断处理函数 这个函数将在 UART_INDEX 对应的中断调用 详见 isr.c
// 参数说明     void
// 返回参数     void
// 使用示例     uart_rx_interrupt_handler();
//-------------------------------------------------------------------------------------------------------------------
void uart_rx_interrupt_handler_ai_camera_0 (void)
{ 
	uint8 get_data = 0;
	uint32 fifo_data_count = 0;                         // fifo 数据个数
		
	uart_query_byte(AI_CAMERA_0_UART_INDEX, &get_data);  		// 接收数据 查询式 有数据会返回 TRUE 没有数据会返回 FALSE
    fifo_write_buffer(&ai_camera_0_uart_fifo, &get_data, 1);  	// 将数据写入 fifo 中
	fifo_data_count = fifo_used(&ai_camera_0_uart_fifo); 		// FIFO查询当前数据个数
    fifo_read_buffer(&ai_camera_0_uart_fifo, ai_camera_0_fifo_buffer, &fifo_data_count, FIFO_READ_ONLY);
//	uart_write_buffer(AI_CAMERA_1_UART_INDEX, fifo_get_data_ai_camera_1, fifo_data_count_1);      // 将读取到的数据发送出去
//	uart_write_buffer(AI_CAMERA_1_UART_INDEX, array3, 1);
	if(ai_camera_0_fifo_buffer[0] != 0x2C) 
	{
			fifo_clear(&ai_camera_0_uart_fifo);
	}
	if(fifo_data_count >= 4)	//两个帧头两个帧尾
	{	
		if(	ai_camera_0_fifo_buffer[0] == 0x2C && 
			ai_camera_0_fifo_buffer[1] == 0x12 && 
			ai_camera_0_fifo_buffer[fifo_data_count - 2] == 0x5B && 
			ai_camera_0_fifo_buffer[fifo_data_count - 1] == 0x5B )
			// 解析转换
			detection_result_trans(AI_CAMERA_0, ai_camera_0_fifo_buffer[2], ai_camera_0_fifo_buffer[3], ai_camera_0_fifo_buffer[4]);
		if(	ai_camera_0_fifo_buffer[fifo_data_count - 2] == 0x5B && 
			ai_camera_0_fifo_buffer[fifo_data_count - 1] == 0x5B ||
			fifo_data_count > 8)
		{
				fifo_clear(&ai_camera_0_uart_fifo);
		}	
	}
}
//-------------------------------------------------------------------------------------------------------------------
// 函数简介     UART_INDEX 的接收中断处理函数 这个函数将在 UART_INDEX 对应的中断调用 详见 isr.c
// 参数说明     void
// 返回参数     void
// 使用示例     uart_rx_interrupt_handler_A();
//-------------------------------------------------------------------------------------------------------------------
void uart_rx_interrupt_handler_ai_camera_1 (void)
{ 	
	uint8 get_data = 0;
	uint32 fifo_data_count = 0;                         // fifo 数据个数
		
	uart_query_byte(AI_CAMERA_1_UART_INDEX, &get_data);  		// 接收数据 查询式 有数据会返回 TRUE 没有数据会返回 FALSE
    fifo_write_buffer(&ai_camera_1_uart_fifo, &get_data, 1);  	// 将数据写入 fifo 中
	fifo_data_count = fifo_used(&ai_camera_1_uart_fifo); 		// FIFO查询当前数据个数
    fifo_read_buffer(&ai_camera_1_uart_fifo, ai_camera_1_fifo_buffer, &fifo_data_count, FIFO_READ_ONLY);
//	uart_write_buffer(AI_CAMERA_1_UART_INDEX, fifo_get_data_ai_camera_1, fifo_data_count_1);      // 将读取到的数据发送出去
//	uart_write_buffer(AI_CAMERA_1_UART_INDEX, array3, 1);
	if(ai_camera_1_fifo_buffer[0] != 0x2C) 
	{
			fifo_clear(&ai_camera_1_uart_fifo);
	}
	if(fifo_data_count >= 4)	//两个帧头两个帧尾
	{	
		if(	ai_camera_1_fifo_buffer[0] == 0x2C && 
			ai_camera_1_fifo_buffer[1] == 0x12 && 
			ai_camera_1_fifo_buffer[fifo_data_count - 2] == 0x5B && 
			ai_camera_1_fifo_buffer[fifo_data_count - 1] == 0x5B )
			// 解析转换
			detection_result_trans(AI_CAMERA_1, ai_camera_1_fifo_buffer[2]);
		if(	ai_camera_1_fifo_buffer[fifo_data_count - 2] == 0x5B && 
			ai_camera_1_fifo_buffer[fifo_data_count - 1] == 0x5B ||
			fifo_data_count > 8)
		{
				fifo_clear(&ai_camera_1_uart_fifo);
		}	
	}
}

//-------------------------------------------------------------------------------------------------------------------
// 函数简介     UART_INDEX 的接收中断处理函数 这个函数将在 UART_INDEX 对应的中断调用 详见 isr.c
// 参数说明     void
// 返回参数     void
// 使用示例     uart_rx_interrupt_handler_A();
//-------------------------------------------------------------------------------------------------------------------
void uart_rx_interrupt_handler_ai_camera_2 (void)
{ 
	uint8 get_data = 0;
	uint32 fifo_data_count = 0;                         // fifo 数据个数

	uart_query_byte(AI_CAMERA_2_UART_INDEX, &get_data);  // 接收数据 查询式 有数据会返回 TRUE 没有数据会返回 FALSE
	fifo_write_buffer(&ai_camera_2_uart_fifo, &get_data, 1);  // 将数据写入 fifo 中
	fifo_data_count = fifo_used(&ai_camera_2_uart_fifo);  // FIFO查询当前数据个数
	fifo_read_buffer(&ai_camera_2_uart_fifo, ai_camera_2_fifo_buffer, &fifo_data_count, FIFO_READ_ONLY);
//	uart_write_buffer(AI_CAMERA_2_UART_INDEX, fifo_get_data_ai_camera_2, fifo_data_count_2);      // 将读取到的数据发送出去
	if(ai_camera_2_fifo_buffer[0] != 0x2C)
	{
		fifo_clear(&ai_camera_2_uart_fifo);
	}
	if(fifo_data_count >= 4)	//两个帧头两个帧尾
	{
		if(	ai_camera_2_fifo_buffer[0] == 0x2C && 
			ai_camera_2_fifo_buffer[1] == 0x12 && 
			ai_camera_2_fifo_buffer[fifo_data_count - 2] == 0x5B && 
			ai_camera_2_fifo_buffer[fifo_data_count - 1] == 0x5B )
			// 解析转换
			detection_result_trans(AI_CAMERA_2, ai_camera_2_fifo_buffer[2]);		
		if(	ai_camera_2_fifo_buffer[fifo_data_count - 2] == 0x5B && 
			ai_camera_2_fifo_buffer[fifo_data_count - 1] == 0x5B ||
			fifo_data_count > 8)
		{
				fifo_clear(&ai_camera_2_uart_fifo);
		}
	}
}