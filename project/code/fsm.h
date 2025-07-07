#ifndef _FSM_H_
#define _FSM_H_

#include "DOG_data.h"

/* 状态机 */
void fsm(void);

/* 赛道状态判断 */
static _path_state_ path_state_judge(uint8 input[MT9V03X_H][MT9V03X_W]);

/* 对称法矫正初始化 */
void symmetry_rectificate_init(void);

/* 对称法矫正 */
void symmetry_rectificate(uint8 input[MT9V03X_H][MT9V03X_W]);

#endif