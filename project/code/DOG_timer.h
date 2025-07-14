#ifndef _DOG_TIMER_H_
#define _DOG_TIMER_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

struct DOG_TIMER;

/* 计时 */
typedef struct DOG_TIMER{
	/* 计时 */
	uint32 time;
	/* 计时中断时间 */
	uint16 ticking_IT_time;
	/* 计时标志位 */
	_bool_ ticking_flag;
	
	/* 成员函数 */
	void (*ticking)(struct DOG_TIMER* this);	// 计时
}DOG_TIMER;

// 计时
void ticking(struct DOG_TIMER* this);

// 构造函数
void timer(struct DOG_TIMER* this, uint16 ticking_IT_time);
// 析构函数
void _timer(struct DOG_TIMER* this);

#endif