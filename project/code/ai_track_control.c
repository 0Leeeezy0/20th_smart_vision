/*
该文件用于OpenART和MCXVision的通信

API：
*/

#include "common.h"
                    
static uint32 fifo_data_count = 0;                         	// fifo 数据个数
static fifo_struct uart_data_fifo_mcxvision;				// MCXVISION 串口接收fifo
static fifo_struct uart_data_fifo_openart;					// OPENART 串口接收fifo

static _MCXVISION_DETECTION_RESULT_ mcxvision_detection_result[10];	// MCXVISION识别结果
static _MCXVISION_DETECTION_RESULT_ mcxvision_detection_result_buffer[10];	// MCXVISION识别结果缓存

static uint8 uart_get_data_mcxvision[64];                            // 串口接收数据缓冲区
static uint8 fifo_get_data_mcxvision[64];                            // fifo 输出读出缓冲区

static uint8 uart_get_data_openart[64];                            // 串口接收数据缓冲区
static uint8 fifo_get_data_openart[64];                            // fifo 输出读出缓冲区

static uint16 mcxvision_detection_x1[8];
static uint16 mcxvision_detection_x2[8];
static uint16 mcxvision_detection_box_width[8];
static uint8  mcxvision_upgrade_flag = 0;	// MCXVISION摄像头更新标志位

/* AI摄像头初始化 */
void ai_camera_init(void)
{
	mcxvision_init();
    //openart_init();
	// AI摄像头更新计时中断初始化
	pit_ms_init (AI_CAMERA_UPGRADE_TIME_COUNT_IT_CH, AI_CAMERA_UPGRADE_TIME_COUNT_IT_TIME);
	
	// 中断使能
	pit_enable(AI_CAMERA_UPGRADE_TIME_COUNT_IT_CH);
}

/* MCXVISION摄像头初始化 */
void mcxvision_init(void)
{
    fifo_init(&uart_data_fifo_mcxvision, FIFO_DATA_8BIT, uart_get_data_mcxvision, 64);              // 初始化 fifo 挂载缓冲区
    uart_init(MCXVISION_UART_INDEX, MCXVISION_UART_BAUDRATE, MCXVISION_UART_TX_PIN, MCXVISION_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(MCXVISION_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(MCXVISION_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
	mcxvision_detection_result_clear();
}

/* OPENART摄像头初始化 */
void openart_init(void)
{
    fifo_init(&uart_data_fifo_openart, FIFO_DATA_8BIT, uart_get_data_openart, 64);              // 初始化 fifo 挂载缓冲区
    
    uart_init(OPENART_UART_INDEX, OPENART_UART_BAUDRATE, OPENART_UART_TX_PIN, OPENART_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(OPENART_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(OPENART_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* 识别结果清空 */
void mcxvision_detection_result_clear(void)
{
	for(uint8 i = 0; i < 8; i++)
    {
		mcxvision_detection_result[i].res_x1 = 0;
		mcxvision_detection_result[i].res_x2 = 0;
		mcxvision_detection_result[i].res_y1 = 0;
		mcxvision_detection_result[i].res_y2 = 0;
		
		mcxvision_detection_result_buffer[i].res_x1 = 0;
		mcxvision_detection_result_buffer[i].res_x2 = 0;
		mcxvision_detection_result_buffer[i].res_y1 = 0;
		mcxvision_detection_result_buffer[i].res_y2 = 0;
	}
}

/* 识别结果更新判断 */
void detection_result_upgrade_judge(void)
{
	for(uint8 i = 0; i < 8; i++)
    {
		if(mcxvision_detection_result_buffer[i].res_x1 != mcxvision_detection_result[i].res_x1 || 
			mcxvision_detection_result_buffer[i].res_x2 != mcxvision_detection_result[i].res_x2 || 
			mcxvision_detection_result_buffer[i].res_y1 != mcxvision_detection_result[i].res_y1 || 
			mcxvision_detection_result_buffer[i].res_y2 != mcxvision_detection_result[i].res_y2)
		{
			// 更新
			mcxvision_detection_result[i].res_x1 = mcxvision_detection_result_buffer[i].res_x1;
			mcxvision_detection_result[i].res_x2 = mcxvision_detection_result_buffer[i].res_x2;
			mcxvision_detection_result[i].res_y1 = mcxvision_detection_result_buffer[i].res_y1;
			mcxvision_detection_result[i].res_y2 = mcxvision_detection_result_buffer[i].res_y2;
			
			// 开始计时
			mcxvision_upgrade_time_count = 0;
			mcxvision_upgrade_time_count_flag = TRUE;
		}
	}
	if(mcxvision_upgrade_time_count > MCXVISION_UPGRADE_TIME)
	{
		mcxvision_detection_result_clear();
		mcxvision_upgrade_time_count = 10000;	// 数值随意，只要大于 MCXVISION_UPGRADE_TIME 就可以
	}
}

/* OPENART识别结果转换 */
static void openart_data_transform(uint8 openart_detection_result_raw)
{
	if(openart_detection_result_raw >= 0 && openart_detection_result_raw <= 14)
	{
		openart_detection_result.result_kind = 0;
		openart_detection_result.lable = (_OPENART_DETECTION_LABLE_)openart_detection_result_raw;
	}
	else if(openart_detection_result_raw > 14 && openart_detection_result_raw <= 114)
	{
		openart_detection_result.result_kind = 1;
		openart_detection_result.num = openart_detection_result_raw-15;
	}
}

/* MCXVISION推理框图宽度转换 */
void mcxvision_data_transform(void)
{
    for(uint8 i = 0; i < 8; i++)
    {
        mcxvision_detection_x1[i] = mcxvision_detection_result[i].res_x1;
        mcxvision_detection_x2[i] = mcxvision_detection_result[i].res_x2;
        mcxvision_detection_box_width[i] = (uint16)(mcxvision_detection_x2[i]-mcxvision_detection_x1[i]);
    }
//    system_delay_ms(10);
}

/* MCXVISION推理最大识别框中心坐标获取 */
void mcxvision_max_detection_box_center_get(void)	// YJC是大傻逼  
{
    max_detection_box_width = 0;
	uint8 max_detection_box_num;
	mcxvision_data_transform();
    for(int i = 0;i<7;i++)
    {
        if(mcxvision_detection_box_width[i] > max_detection_box_width)
        {
            max_detection_box_width = mcxvision_detection_box_width[i];
            if(mcxvision_detection_box_width[i]>0)
            {
                max_detection_box_num = i;
            }
        }
    }
	track_x_center = mcxvision_detection_x1[max_detection_box_num] + mcxvision_detection_box_width[max_detection_box_num]/2;
}

/* MCXVISION摄像头追踪控制 */
void mcxvision_track_control(float track_linear_speed,_CONTROL_MODE_ track_finsh_next_mode_flag)
{
	static int16 num = 0;	// 符合偏移阈值的图像次数
	track_err = track_x_center-MCXVISION_IMAGE_WIDTH/2;
	chassis_motion_flag = CHASSIS_MOVE;
	if(max_detection_box_width < detection_box_width_std-4)
	{
		chassis_yaw = track_err;
		chassis_linear_speed = track_linear_speed;
		chassis_angular_speed = 0;
		control_mode_flag = MCXVISION_TRACK_MODE;
	}
//	else if(max_detection_box_width > detection_box_width_std+4)
//	{
//		chassis_yaw = 180-track_err;
//		chassis_linear_speed = track_linear_speed;
//	}
	else
	{
		if(abs(track_err) > 5)
		{
			chassis_yaw = 90*abs(track_err)/track_err;
			chassis_linear_speed = track_linear_speed_revise;
			chassis_angular_speed = 0;
			if(abs(track_err) <= 8)
			{
				num++;
			}
		}
		else
		{
			chassis_yaw = 0;
			chassis_linear_speed = 0;
			chassis_angular_speed = 0;
			control_mode_flag = track_finsh_next_mode_flag;
			num = 0;
		}
	}
	if(num > 10)
	{
		chassis_yaw = 0;
		chassis_linear_speed = 0;
		chassis_angular_speed = 0;
		control_mode_flag = track_finsh_next_mode_flag;
		num = 0;
	}
}

//-------------------------------------------------------------------------------------------------------------------
// 函数简介     UART_INDEX 的接收中断处理函数 这个函数将在 UART_INDEX 对应的中断调用 详见 isr.c
// 参数说明     void
// 返回参数     void
// 使用示例     uart_rx_interrupt_handler();
//-------------------------------------------------------------------------------------------------------------------
void uart_rx_interrupt_handler_mcxvison (void)
{ 
    uint8 get_data = 0;                                                             // 接收数据变量
    uint32 temp_length = 0;
    uint8 od_num = 0;
    uart_query_byte(MCXVISION_UART_INDEX, &get_data);  
    {
        fifo_write_buffer(&uart_data_fifo_mcxvision, &get_data, 1);   
    }
    
    if(0xFF == get_data)
    {
        // 读取第1个数据，用于判断帧头，使用完清除此数据
        temp_length = 1;
        fifo_read_buffer(&uart_data_fifo_mcxvision, fifo_get_data_mcxvision, &temp_length, FIFO_READ_AND_CLEAN);
        if(0xAA == fifo_get_data_mcxvision[0])
        {
            // 读取第1个数据，用于获取目标序号，使用完清除此数据
            temp_length = 1;
            fifo_read_buffer(&uart_data_fifo_mcxvision, fifo_get_data_mcxvision, &temp_length, FIFO_READ_AND_CLEAN);
            od_num = fifo_get_data_mcxvision[0];
            // 读取8个数据，用于获取目标数据，然后转移到结构体数组中
            temp_length = 8;
            fifo_read_buffer(&uart_data_fifo_mcxvision, fifo_get_data_mcxvision, &temp_length, FIFO_READ_AND_CLEAN);
            memcpy((uint8*)(&mcxvision_detection_result_buffer[od_num]), fifo_get_data_mcxvision, 8);
        }
        fifo_clear(&uart_data_fifo_mcxvision);
    }
}

//-------------------------------------------------------------------------------------------------------------------
// 函数简介     UART_INDEX 的接收中断处理函数 这个函数将在 UART_INDEX 对应的中断调用 详见 isr.c
// 参数说明     void
// 返回参数     void
// 使用示例     uart_rx_interrupt_handler_A();
//-------------------------------------------------------------------------------------------------------------------
void uart_rx_interrupt_handler_openart (void)
{ 
	uint8 openart_detection_result_raw;						// OPENART识别结果
	
//    get_data = uart_read_byte(UART_INDEX);                                      // 接收数据 while 等待式 不建议在中断使用
	uint8 get_data = 0;
	uint32 fifo_data_count = 0;                         // fifo 数据个数

    uart_query_byte(OPENART_UART_INDEX, &get_data);                           // 接收数据 查询式 有数据会返回 TRUE 没有数据会返回 FALSE
    fifo_write_buffer(&uart_data_fifo_openart, &get_data, 1);                           // 将数据写入 fifo 中
    
    fifo_data_count = fifo_used(&uart_data_fifo_openart);                           // 查看 fifo 是否有数据
    if(fifo_data_count != 0)                                                // 读取到数据了
    {
        fifo_read_buffer(&uart_data_fifo_openart, fifo_get_data_openart, &fifo_data_count, FIFO_READ_AND_CLEAN);    // 将 fifo 中数据读出并清空 fifo 挂载的缓冲
        uart_write_buffer(OPENART_UART_INDEX, fifo_get_data_openart, fifo_data_count);      // 将读取到的数据发送出去
        openart_detection_result_raw = fifo_get_data_openart[0] - 49;
		openart_data_transform(openart_detection_result_raw);
    }
    system_delay_ms(10);
}

