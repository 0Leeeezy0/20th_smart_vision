/*
该文件用于车模赛道循迹控制

API：
*/

#ifndef _PATH_CONTROL_H_
#define _PATH_CONTROL_H_

#include "common.h"

/* 赛道循迹控制初始化 */
void path_control_init(void);

/* 路径线扫描 */
void path_search(void);

/* 循迹控制 */
void path_control(float path_control_speed);

/* 循迹PID参数结构体初始化 */
_PID_ path_control_pid_init(void);

/* 循迹PID */
float path_control_pid(float (*p)(_PID_* pid,float target,float feedback),_PID_ path_pid,int16 path_err);

#endif