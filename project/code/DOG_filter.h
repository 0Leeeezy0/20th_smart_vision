#ifndef _DOG_FILTER_H_
#define _DOG_FILTER_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

// 卡尔曼滤波
struct DOG_KARMAN_FILTER{
	/* 卡尔曼滤波参数 */
	float Kq;
	float Kr;
	
	/* 卡尔曼滤波变量 */
	float last_p;
	float now_p;
	float value;
	float Kg;
	
	/* 成员函数 */
	float (*karman_filter)(struct DOG_KARMAN_FILTER* this, float input);	// 卡尔曼滤波
};

// 卡尔曼滤波
float karman_filter(struct DOG_KARMAN_FILTER* this, float input);

// 构造函数
void karman(struct DOG_KARMAN_FILTER* this, float Kq, float Kr);
// 析构函数
void _karman(struct DOG_KARMAN_FILTER* this);

// 低通滤波
struct DOG_LOWPASS_FILTER{
	/* 低通滤波参数 */
	float K;
	
	/* 低通滤波变量 */
	float last_p;
	float new_value;
	float old_value;
	
	/* 成员函数 */
	float (*lowpass_filter)(struct DOG_LOWPASS_FILTER* this, float input);	// 卡尔曼滤波
};

// 低通滤波
float lowpass_filter(struct DOG_LOWPASS_FILTER* this, float input);

// 构造函数
void lowpass(struct DOG_LOWPASS_FILTER* this, float K);
// 析构函数
void _lowpass(struct DOG_LOWPASS_FILTER* this);

#endif

