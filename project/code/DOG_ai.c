/*
该文件用于OpenART和MCXVision的通信

API：
*/

#include "common.h"
                    
static uint32 fifo_data_count = 0;                         	// fifo 数据个数
static fifo_struct uart_data_fifo_ai_camera_0;				// AI摄像头0 串口接收fifo
static fifo_struct uart_data_fifo_ai_camera_1;				// AI摄像头1 串口接收fifo
static fifo_struct uart_data_fifo_ai_camera_2;				// AI摄像头2 串口接收fifo

static uint8 uart_get_data_ai_camera_0[64];                            // 串口接收数据缓冲区
static uint8 fifo_get_data_ai_camera_0[64];                            // fifo 输出读出缓冲区

static uint8 uart_get_data_ai_camera_1[64];                            // 串口接收数据缓冲区
static uint8 fifo_get_data_ai_camera_1[64];                            // fifo 输出读出缓冲区

static uint8 uart_get_data_ai_camera_2[64];                            // 串口接收数据缓冲区
static uint8 fifo_get_data_ai_camera_2[64];                            // fifo 输出读出缓冲区

typedef struct
{
    uint16 res_x;
    uint16 res_w;
}od_result_t;
volatile od_result_t od_result[10];

/* AI摄像头初始化 */
void ai_camera_init(void)
{
	ai_camera_0_init();
    ai_camera_1_init();
	ai_camera_2_init();
	ai_track_pid_init();
}

/* AI摄像头0 初始化 */
void ai_camera_0_init(void)
{
    fifo_init(&uart_data_fifo_ai_camera_0, FIFO_DATA_8BIT, uart_get_data_ai_camera_0, 64);              // 初始化 fifo 挂载缓冲区
    uart_init(AI_CAMERA_0_UART_INDEX, AI_CAMERA_0_UART_BAUDRATE, AI_CAMERA_0_UART_TX_PIN, AI_CAMERA_0_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(AI_CAMERA_0_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(AI_CAMERA_0_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* AI摄像头1（工具） 初始化 */	
void ai_camera_1_init(void)
{
    fifo_init(&uart_data_fifo_ai_camera_1, FIFO_DATA_8BIT, uart_get_data_ai_camera_1, 64);              // 初始化 fifo 挂载缓冲区
    
    uart_init(AI_CAMERA_1_UART_INDEX, AI_CAMERA_1_UART_BAUDRATE, AI_CAMERA_1_UART_TX_PIN, AI_CAMERA_1_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(AI_CAMERA_1_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(AI_CAMERA_1_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* AI摄像头2（数字） 初始化 */
void ai_camera_2_init(void)
{
    fifo_init(&uart_data_fifo_ai_camera_2, FIFO_DATA_8BIT, uart_get_data_ai_camera_2, 64);              // 初始化 fifo 挂载缓冲区
    
    uart_init(AI_CAMERA_2_UART_INDEX, AI_CAMERA_2_UART_BAUDRATE, AI_CAMERA_2_UART_TX_PIN, AI_CAMERA_2_UART_RX_PIN);             // 初始化串口
    uart_rx_interrupt(AI_CAMERA_2_UART_INDEX, ZF_ENABLE);                                   // 开启 UART_INDEX 的接收中断
    interrupt_set_priority(AI_CAMERA_2_UART_PRIORITY, 0);                                   // 设置对应 UART_INDEX 的中断优先级为 0
}

/* AI摄像头1 识别结果转换 */
static void ai_camera_1_data_transform(uint8 ai_camera_1_detection_result_raw)
{
	// 普通lable
	if(ai_camera_1_detection_result_raw >= 1 && ai_camera_1_detection_result_raw < 16)
	{
		ai_camera_detection_result.result_kind = 0;
		ai_camera_detection_result.lable = (_AI_CAMERA_DETECTION_LABLE_)(ai_camera_1_detection_result_raw-1);
	}
	// 手写数字
	else if(ai_camera_1_detection_result_raw == 16)
	{
		ai_camera_detection_result.result_kind = 1;
	}
	// 啥都没有
	else
	{
		ai_camera_detection_result.result_kind = 2;
	}
}

/* AI摄像头2 识别结果转换 */
static void ai_camera_2_data_transform(uint8 ai_camera_2_detection_result_raw)
{
	// 手写数字
	if(ai_camera_2_detection_result_raw >= 0 && ai_camera_2_detection_result_raw < 100)
	{
		ai_camera_detection_result.num = ai_camera_2_detection_result_raw;
	}
	// 啥都没有
	else
	{
		ai_camera_detection_result.result_kind = 2;
	}
}

/* AI追踪PID参数结构体初始化 */
void ai_track_pid_init(void)
{
	pid_init(&(ai_track_pid.x_ai_track_pid_paraments),&(ai_track_pid.x_ai_track_pid_variable),X_AI_TRACK_PID[0],X_AI_TRACK_PID[1],X_AI_TRACK_PID[2],X_AI_TRACK_PID[3],X_AI_TRACK_PID[4]);
	pid_init(&(ai_track_pid.y_ai_track_pid_paraments),&(ai_track_pid.y_ai_track_pid_variable),Y_AI_TRACK_PID[0],Y_AI_TRACK_PID[1],Y_AI_TRACK_PID[2],Y_AI_TRACK_PID[3],Y_AI_TRACK_PID[4]);
}

/* AI追踪控制 */
void ai_track_control(float track_linear_speed,_CONTROL_MODE_ track_finsh_next_mode_flag)
{
	// 定义X/Y方向追踪PID指针函数
	float (*X_FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float);
	float (*Y_FUNC)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float);
	float x_speed = 0;
	float y_speed = 0;
	
	X_FUNC = X_AI_TRACK_PID_KIND;
	Y_FUNC = Y_AI_TRACK_PID_KIND;
	
	static int16 num = 0;	// 符合偏移阈值的图像次数
	track_err = track_x_center-AI_CAMERA_0_IMAGE_WIDTH/2;
	chassis_motion_flag = CHASSIS_MOVE;
	// 色块宽度小于标准宽度时平移前进
	if(detection_box_width < detection_box_width_std-4-20)
	{
		chassis_yaw = track_err;
		chassis_linear_speed = track_linear_speed;
		chassis_angular_speed = 0;
		control_mode_flag = AI_TRACK_MODE;
	}
	// 色块宽度再标准宽度正负阈值内时前后定位（保证车身和方块的距离大致一致）
	else
	{
		x_speed = X_FUNC(&(ai_track_pid.x_ai_track_pid_paraments),&(ai_track_pid.x_ai_track_pid_variable),0,-track_err);
		y_speed = Y_FUNC(&(ai_track_pid.y_ai_track_pid_paraments),&(ai_track_pid.y_ai_track_pid_variable),detection_box_width_std,detection_box_width);
		
		if(y_speed != 0)
		{
			if(y_speed > 0)
				chassis_yaw = RAD2DEG(atan(x_speed/y_speed));
			else if(y_speed < 0)
				chassis_yaw = 180+RAD2DEG(atan(x_speed/y_speed));
		}	
		else
			chassis_yaw = 90*x_speed/abs(x_speed);
		
		chassis_linear_speed = sqrt(x_speed*x_speed+y_speed*y_speed);
		chassis_angular_speed = 0;
		control_mode_flag = AI_TRACK_MODE;
		
		// 追踪到阈值周围
		if(abs(detection_box_width-detection_box_width_std) <= 4 && abs(track_err) <= 8)
		{
			num++;
		}
		// 追踪到阈值内
		if(abs(detection_box_width-detection_box_width_std) <= 4 && abs(track_err) <= 5)
		{
			chassis_yaw = 0;
			chassis_linear_speed = 0;
			chassis_angular_speed = 0;
			control_mode_flag = track_finsh_next_mode_flag;
			num = 0;
		}
		// 追踪到阈值周围，由于摩擦力等使车无法移动，超过判定次数
		if(num > 10)
		{
			chassis_yaw = 0;
			chassis_linear_speed = 0;
			chassis_angular_speed = 0;
			control_mode_flag = track_finsh_next_mode_flag;
			num = 0;
		}
	}
}

//-------------------------------------------------------------------------------------------------------------------
// 函数简介     UART_INDEX 的接收中断处理函数 这个函数将在 UART_INDEX 对应的中断调用 详见 isr.c
// 参数说明     void
// 返回参数     void
// 使用示例     uart_rx_interrupt_handler();
//-------------------------------------------------------------------------------------------------------------------
void uart_rx_interrupt_handler_ai_camera_0 (void)
{ 
	static uint16 ai_camera_0_detection_x1;		// AI摄像头0 识别框左边线x坐标
	static uint16 ai_camera_0_detection_box_width;	// AI摄像头0 识别框宽度
	
//    get_data = uart_read_byte(UART_INDEX);                                      // 接收数据 while 等待式 不建议在中断使用
	uint8 get_data = 0;                                                             // 接收数据变量
    uint32 temp_length = 0;
    uint8 od_num = 0;
    uart_query_byte(AI_CAMERA_0_UART_INDEX, &get_data);  
    {
        fifo_write_buffer(&uart_data_fifo_ai_camera_0, &get_data, 1);   
    }
    
    if(0xFF == get_data)
    {
        // 读取第1个数据，用于判断帧头，使用完清除此数据
        temp_length = 1;
        fifo_read_buffer(&uart_data_fifo_ai_camera_0, fifo_get_data_ai_camera_0, &temp_length, FIFO_READ_AND_CLEAN);
        if(0xAA == fifo_get_data_ai_camera_0[0])
        {
            // 读取第1个数据，用于获取目标序号，使用完清除此数据
            temp_length = 1;
            fifo_read_buffer(&uart_data_fifo_ai_camera_0, fifo_get_data_ai_camera_0, &temp_length, FIFO_READ_AND_CLEAN);
            track_x = fifo_get_data_ai_camera_0[0]-AI_CAMERA_0_OFFSET;
            // 读取8个数据，用于获取目标数据，然后转移到结构体数组中
            temp_length = 1;
            fifo_read_buffer(&uart_data_fifo_ai_camera_0, fifo_get_data_ai_camera_0, &temp_length, FIFO_READ_AND_CLEAN);
            detection_box_width = fifo_get_data_ai_camera_0[0];
            track_x_center = track_x + detection_box_width/2;
            
        }
        fifo_clear(&uart_data_fifo_ai_camera_0);
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
	static uint8 ai_camera_1_detection_result_raw;						// AI摄像头1 识别结果
	
//    get_data = uart_read_byte(UART_INDEX);                                      // 接收数据 while 等待式 不建议在中断使用
	uint8 get_data = 0;
	uint32 fifo_data_count = 0;                         // fifo 数据个数

    uart_query_byte(AI_CAMERA_1_UART_INDEX, &get_data);                           // 接收数据 查询式 有数据会返回 TRUE 没有数据会返回 FALSE
    fifo_write_buffer(&uart_data_fifo_ai_camera_1, &get_data, 1);                           // 将数据写入 fifo 中
    
    fifo_data_count = fifo_used(&uart_data_fifo_ai_camera_1);                           // 查看 fifo 是否有数据
    if(fifo_data_count != 0)                                                // 读取到数据了
    {
        fifo_read_buffer(&uart_data_fifo_ai_camera_1, fifo_get_data_ai_camera_1, &fifo_data_count, FIFO_READ_AND_CLEAN);    // 将 fifo 中数据读出并清空 fifo 挂载的缓冲
        uart_write_buffer(AI_CAMERA_1_UART_INDEX, fifo_get_data_ai_camera_1, fifo_data_count);      // 将读取到的数据发送出去
        ai_camera_1_detection_result_raw = fifo_get_data_ai_camera_1[0];
		ai_camera_1_data_raw = ai_camera_1_detection_result_raw;
		ai_camera_1_data_transform(ai_camera_1_detection_result_raw);
//		printf("%s",ai_camera_1_detection_result_raw);
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
	static uint8 ai_camera_2_detection_result_raw;						// AI摄像头1 识别结果
	
//    get_data = uart_read_byte(UART_INDEX);                                      // 接收数据 while 等待式 不建议在中断使用
	uint8 get_data = 0;
	uint32 fifo_data_count = 0;                         // fifo 数据个数

    uart_query_byte(AI_CAMERA_2_UART_INDEX, &get_data);                           // 接收数据 查询式 有数据会返回 TRUE 没有数据会返回 FALSE
    fifo_write_buffer(&uart_data_fifo_ai_camera_2, &get_data, 1);                           // 将数据写入 fifo 中
    
    fifo_data_count = fifo_used(&uart_data_fifo_ai_camera_2);                           // 查看 fifo 是否有数据
    if(fifo_data_count != 0)                                                // 读取到数据了
    {
        fifo_read_buffer(&uart_data_fifo_ai_camera_2, fifo_get_data_ai_camera_2, &fifo_data_count, FIFO_READ_AND_CLEAN);    // 将 fifo 中数据读出并清空 fifo 挂载的缓冲
        uart_write_buffer(AI_CAMERA_2_UART_INDEX, fifo_get_data_ai_camera_2, fifo_data_count);      // 将读取到的数据发送出去
        ai_camera_2_detection_result_raw = fifo_get_data_ai_camera_2[0];
		ai_camera_2_data_raw = ai_camera_2_detection_result_raw;
		ai_camera_2_data_transform(ai_camera_2_detection_result_raw);
//		printf("%s",ai_camera_1_detection_result_raw);
    }
}
