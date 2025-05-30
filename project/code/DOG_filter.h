#ifndef _DOG_FILTER_H_
#define _DOG_FILTER_H_

#include "common.h"

/* 卡尔曼参数 */
typedef struct
{
	float q;
	float r;
}_KALMAN_PARAMETERS_;

/* 卡尔曼变量 */
typedef struct
{
    float p_last;	//上次估算协方差
    float p_now;	//当前估算协方差
    float value;		//卡尔曼滤波器输出
    float Kg;		//卡尔曼增益
}_KALMAN_VARIABLE_;

/* 低通滤波参数 */
typedef struct
{
    float k;			//低通滤波系数
}_LOWPASS_PARAMETERS_;

/* 低通滤波变量 */
typedef struct
{
	float new_value;	//新的值
	float old_value;	//旧的值
}_LOWPASS_VARIABLE_;

/* 卡尔曼初始化 */
void karman_init(_KALMAN_PARAMETERS_ *karman_parameters ,_KALMAN_VARIABLE_* karman_variable, float q, float r);

/* 卡尔曼滤波 */
float karman(_KALMAN_PARAMETERS_ *karman_parameters ,_KALMAN_VARIABLE_* karman_variable, float input);

/* 低通滤波初始化 */
void lowpass_init(_LOWPASS_PARAMETERS_ *lowpass_parameters, _LOWPASS_VARIABLE_ *lowpass_variable, float k);

/* 低通滤波 */
float lowpass(_LOWPASS_PARAMETERS_ *lowpass_parameters, _LOWPASS_VARIABLE_ *lowpass_variable, float input);

#endif

