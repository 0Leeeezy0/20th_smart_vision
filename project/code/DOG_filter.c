#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_filter.h"

// 卡尔曼滤波
float karman_filter(struct DOG_KARMAN_FILTER* this, float input){
	// 预测协方差方程：k时刻系统估算协方差 = k-1时刻的系统协方差 + 过程噪声协方差
    this -> now_p = this -> last_p + this -> Kq;
    // 卡尔曼增益方程：卡尔曼增益 = k时刻系统估算协方差 / （k时刻系统估算协方差 + 观测噪声协方差）
    this -> Kg = this -> now_p / (this -> now_p + this -> Kr);
    // 更新最优值方程：k时刻状态变量的最优值 = 状态变量的预测值 + 卡尔曼增益 * （测量值 - 状态变量的预测值）
    this -> value = this -> value + this -> Kg * (input - this -> value);//因为这一次的预测值就是上一次的输出值
    // 更新协方差方程: 本次的系统协方差赋给 klm->LastP 为下一次运算准备。
    this -> last_p = (1-this -> Kg) * this -> now_p;
	
	return (this -> value);
}

// 构造函数
void karman(struct DOG_KARMAN_FILTER* this, float Kq, float Kr){
	/* 成员变量 */
	this -> Kq = Kq;
	this -> Kr = Kr;
	
	this -> last_p = 0;
	this -> now_p = 0;
	this -> value = 0;
	this -> Kg = 0;
	
	/* 成员函数 */
	this -> karman_filter = karman_filter;
}
// 析构函数
void _karman(struct DOG_KARMAN_FILTER* this){
	this -> Kq = 0;
	this -> Kr = 0;
	
	this -> last_p = 0;
	this -> now_p = 0;
	this -> value = 0;
	this -> Kg = 0;
}

// 低通滤波
float lowpass_filter(struct DOG_LOWPASS_FILTER* this, float input){
	this -> new_value = input;		
	this -> new_value = this -> K*this -> new_value+(1-this -> K)*this -> old_value;
	this -> old_value = this -> new_value;
	return (this -> new_value);
}

// 构造函数
void lowpass(struct DOG_LOWPASS_FILTER* this, float K){
	/* 成员变量 */
	this -> K = K;
	
	this -> old_value = 0;
	this -> new_value = 0;

	/* 成员函数 */
	this -> lowpass_filter = lowpass_filter;
}

// 析构函数
void _lowpass(struct DOG_LOWPASS_FILTER* this){
	this -> K = 0;
	this -> old_value = 0;
	this -> new_value = 0;
}