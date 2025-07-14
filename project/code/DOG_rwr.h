#ifndef _DOG_RWR_H_
#define _DOG_RWR_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

struct DOG_RWR;

typedef struct DOG_RWR{
	/* 成员变量 */
	_bool_ radar_scanning_enable_flag;		// 雷达平扫使能标志位
	_bool_ radar_tracking_enable_flag;		// 敌跟踪使能标志位
	_bool_ missile_launch_enable_flag;		// 敌导弹使能标志位
	_bool_ enable_time_change_flag;			// 使能时间修改标志位
	uint32* time;	// 订阅的计时器时间
	uint32 enable_time;	// 使能时间
	pwm_channel_enum pin;	// 蜂鸣器引脚
	
	/* 成员函数 */
	void (*radar_scanning)(struct DOG_RWR* this);	// 雷达平扫
	void (*radar_tracking)(struct DOG_RWR* this);	// 敌跟踪
	void (*missile_launch)(struct DOG_RWR* this);	// 敌导弹	
}DOG_RWR;

// 雷达平扫
void radar_scanning(struct DOG_RWR* this);	
// 敌跟踪
void radar_tracking(struct DOG_RWR* this);	
// 敌导弹
void missile_launch(struct DOG_RWR* this);				

// 构造函数
void rwr(struct DOG_RWR* this, pwm_channel_enum pin, uint32* time);
// 析构函数
void _rwr(struct DOG_RWR* this);

#endif