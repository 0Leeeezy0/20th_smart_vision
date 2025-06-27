#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_timer.h"

// 计时
void ticking(struct DOG_TIMER* this){
	if(this -> ticking_flag == True)
		this -> time += this -> ticking_IT_time;
	else
		this -> time = 0;
}

// 构造函数
void timer(struct DOG_TIMER* this, uint16 ticking_IT_time){
	/* 计时参数 */
	this -> time = 0;
	this -> ticking_flag = False;
	this -> ticking_IT_time = ticking_IT_time;
	
	/* 成员函数 */
	this -> ticking = ticking;
}

// 析构函数
void _timer(struct DOG_TIMER* this){
	this -> time = 0;
	this -> ticking_flag = False;
	this -> ticking_IT_time = 0;
}