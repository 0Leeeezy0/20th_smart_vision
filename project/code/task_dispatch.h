/*
该文件用于任务调度

API：
摄像头控制任务调度
*/          
#ifndef _TASK_DISPATC_H_
#define _TASK_DISPATC_H_

#include "common.h"

/* 摄像头控制任务调度 */
void camera_control_dispatch(void);

/* 推箱子 */
void block_move_out_control(void);

#endif