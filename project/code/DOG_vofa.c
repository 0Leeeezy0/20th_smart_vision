#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_vofa.h"

// JUSTFLOAT数据添加
void justfloat_add(struct DOG_VOFA* this, const uint32 data_num, ...){
	va_list args;
	uint8 data_add[4] = {0};
    
    va_start(args, data_num);  // 初始化可变参数列表
	if(this -> justfloat_data_num <= 20)
	{
		for (uint32_t i = 0; i < data_num; i++) 
		{
			double data_double = va_arg(args, double);  // 逐个读取 int 类型参数
			float data_float = (float)data_double;
			
			*(float*)data_add = data_float;
					
			this -> justfloat[this -> justfloat_data_num][0] = data_add[0];
			this -> justfloat[this -> justfloat_data_num][1] = data_add[1];
			this -> justfloat[this -> justfloat_data_num][2] = data_add[2];
			this -> justfloat[this -> justfloat_data_num][3] = data_add[3];
			
			this -> justfloat_data_num++;
			
			if(this -> justfloat_data_num > 20)
				break;	
		}
	}
	va_end(args);
}

// JUSTFLOAT数据发送
void justfloat_send(struct DOG_VOFA* this){
	for(int i = 0; i < this -> justfloat_data_num;i++)
	{
		uart_write_byte(this -> uart_idx,this -> justfloat[i][0]);
		uart_write_byte(this -> uart_idx,this -> justfloat[i][1]);
		uart_write_byte(this -> uart_idx,this -> justfloat[i][2]);
		uart_write_byte(this -> uart_idx,this -> justfloat[i][3]);
	}
	uint8 frame_end[4] = {0x00, 0x00, 0x80, 0x7f};
	uart_write_buffer(this -> uart_idx, frame_end, 4);
	this -> justfloat_data_num = 0;
}

// 构造函数
void vofa(struct DOG_VOFA* this, uart_index_enum uart_idx, uint32 baud, uart_tx_pin_enum tx_pin, uart_rx_pin_enum rx_pin){
	/* 串口号 */
	this -> uart_idx = uart_idx;
	
	/* 数据 */
	memset(this -> justfloat, 0., sizeof(this -> justfloat));
	this -> justfloat_data_num = 0;
	
	/* 成员函数 */
	this -> justfloat_add = justfloat_add;
	this -> justfloat_send = justfloat_send;
	
	/* 初始化 */
	uart_init(uart_idx, baud, tx_pin, rx_pin);
	
	return;
}

// 析构函数
void _vofa(struct DOG_VOFA* this){
	memset(this -> justfloat, 0., sizeof(this -> justfloat));
	this -> justfloat_data_num = 0;
}