/*
该文件用于连接VOFA进行调试

API：
*/

#include "common.h"

static uint8* data;
static int16 data_byte_num = 0;

/* CHAR型转FLOAT型 */
float char_2_float(unsigned char *str) 
{
	_CHAR_FLOAT_ value;
	value.uchar_data[0] = str[0];
	value.uchar_data[1] = str[1];
	value.uchar_data[2] = str[2];
	value.uchar_data[3] = str[3];
	
	return value.float_data;
}

/* FLOAT型转CHAR型 */
char* float_to_char(float str)
{
	static char byte[4];
    _FLOAT_LONG_TYPE_ fl;
    fl.float_data = str;
    byte[0]=(unsigned char)fl.long_data;
    byte[1]=(unsigned char)(fl.long_data>>8);
    byte[2]=(unsigned char)(fl.long_data>>16);
    byte[3]=(unsigned char)(fl.long_data>>24);
	
	return byte;
}