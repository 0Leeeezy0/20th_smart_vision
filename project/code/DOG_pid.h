/*
该文件用于PID实现

API：
****用户****
增量式PID
位置式PID
************

*/

#ifndef _DOG_PID_H_
#define _DOG_PID_H_

#include "common.h"

/* PID闭环参数 */
typedef struct
{
	float p;
	float i;
	float d;
	float output_limit;
	float i_limit;
}_PID_PARAMETERS_;

/* PID闭环变量 */
typedef struct
{
	float delta;    
	float now_err;    
	float last_err;    
	float last_last_err;
	float sigma_err;
	float value;
    float value_output;
    float value_delta;

    float sjc_err;
    float sjc_now_delta;
    float sjc_value;
    float sjc_last_delta;
}_PID_VARIABLE_;

/* 模糊PID子集 */
typedef enum
{
	NEGATIVE_BIG = 0,		// 负大
	NEGATIVE_MEDIUM = 1,	// 负中
	NEGATIVE_SMALL = 2,		// 负小
	ZERO = 3,				// 零
	POSITIVE_SMALL = 4,		// 正小
	POSITIVE_MEDIUM = 5,	// 正中
	POSITIVE_BIG = 6,		// 正大
	PID_NONE = 7			// 默认
}_FUZZY_SUBSET_;

/* PID初始化 */
void pid_init(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float kp,float ki,float kd,float output_limit,float i_limit);

/* 增量式PID */
float incremental_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback);

/* 增量式PID（速度环版） */
float incremental_speed_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback);

/*位置式PID*/
float positional_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback);

/* 模糊PID */
_PID_PARAMETERS_ fuzzy_pid_paraments_get(_PID_PARAMETERS_* pid_paraments,float err,float err_c,float small,float medium,float big,uint8_t order);

#endif