#ifndef _DATA_H_
#define _DATA_H_

#include "zf_common_headfile.h"

/* 电机索引 */
typedef enum
{
	MOTOR_1 = 1,
	MOTOR_2 = 2,
	MOTOR_3 = 3
}_MOTOR_NUM_;

/* PID参数 */
typedef struct
{
	int16 p;
	int16 i;
	int16 d;
}_PID_;

/* 编码器数值 */
extern int16 encoder_1_count;
extern int16 encoder_2_count;
extern int16 encoder_3_count;

#endif