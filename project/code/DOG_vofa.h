#ifndef _DOG_VOFA_H_
#define _DOG_VOFA_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#define MAX_DATA_BUFFER_SIZE ( 20 )		// 最大数据存储量

struct DOG_VOFA;

typedef struct DOG_VOFA{
	uart_index_enum uart_idx;	// 串口号
	float justfloat[MAX_DATA_BUFFER_SIZE][4];	// JUSTFLOAT数据
	uint8 justfloat_data_num;				// JUSTFLOAT数据量
	
	/* 成员函数 */
	void (*justfloat_add)(struct DOG_VOFA* this, const uint32 data_num, ...);	// JUSTFLOAT数据添加
	void (*justfloat_send)(struct DOG_VOFA* this);		// JUSTFLOAT数据发送
}DOG_VOFA;

// JUSTFLOAT数据添加
void justfloat_add(struct DOG_VOFA* this, const uint32 data_num, ...);
// JUSTFLOAT数据发送
void justfloat_send(struct DOG_VOFA* this);

// 构造函数
void vofa(struct DOG_VOFA* this, uart_index_enum uart_idx, uint32 baud, uart_tx_pin_enum tx_pin, uart_rx_pin_enum rx_pin);
// 析构函数
void _vofa(struct DOG_VOFA* this);

#endif