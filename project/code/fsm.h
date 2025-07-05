#ifndef _FSM_H_
#define _FSM_H_

#include "DOG_data.h"

/* ×´Ì¬»ú */
void fsm(void);

/* ÈüµÀ×´Ì¬ÅÐ¶Ï */
static _path_state_ path_state_judge(uint8 input[MT9V03X_H][MT9V03X_W]);

#endif