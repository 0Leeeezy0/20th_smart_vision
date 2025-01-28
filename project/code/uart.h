/*
该文件用于连接VOFA进行调试

API：
*/

#ifndef _VOFA_UART_H_
#define _VOFA_UART_H_

#include "common.h"

typedef union
{
    float float_data;
    unsigned long long_data;
}_FLOAT_LONG_TYPE_;

typedef union 
{
	float float_data;
	unsigned char uchar_data[4];
}_CHAR_FLOAT_;

/* CHAR型转FLOAT型 */
float char_2_float(unsigned char *str);
	
/* FLOAT型转CHAR型 */
char* float_to_char(float str);

#endif