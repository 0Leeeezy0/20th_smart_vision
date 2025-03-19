/*
该文件用于任务调度

API：
摄像头控制任务调度
*/          
#ifndef _DOG_FSM_H_
#define _DOG_FSM_H_

#include "common.h"

/* 控制模式调度 */
void control_mode_dispatch(void);

/* 推箱子 */
void block_move_out_control(void);

#endif