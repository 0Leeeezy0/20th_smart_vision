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

/* 增量式PID */
float incremental_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback);

/*位置式PID*/
float positional_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback);

#endif