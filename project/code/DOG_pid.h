#ifndef _DOG_PID_H_
#define _DOG_PID_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

struct DOG_PID{
	/* PID 参数 */
	float Kp;
	float Ki;
	float Kd;
	float output_limit;
	float i_limit;
	
	/* PID 变量 */  
	float now_err;    
	float last_err;    
	float last_last_err;
	float sigma_err;
	float value;
    float value_delta;
	
	/* 模糊 PID 参数 */
	_fuzzy_subset_ fuzzy_rules[8][8];	// 模糊规则表
	 float range[2][3];					// 模糊规则
	
	/* 成员函数 */
	float (*INCREMENTAL_PID)(struct DOG_PID* this ,float target, float feedback);		// 增量式 PID
	float (*POSITIONAL_PID)(struct DOG_PID* this ,float target, float feedback);		// 位置式 PID
	void (*FUZZY_PID_INIT)(struct DOG_PID* this, _fuzzy_subset_ fuzzy_rules[][8],  float range[][3]);		// 模糊 PID 初始化
	void (*FUZZY_PID)(struct DOG_PID* this, float* err, float* p, float* i, float* d, float* output_limit, float* i_limit, uint8 order);	// 模糊 PID
};

// 增量式 PID
float incremental_pid(struct DOG_PID* this ,float target, float feedback);
// 位置式 PID
float positional_pid(struct DOG_PID* this ,float target, float feedback);
/*
	模糊 PID 初始化
	参数说明：
	fuzzy_rule 模糊规则表：fuzzy_rule[8][8]
	range 范围值：range[2][4] = {{小， 中， 大}, {小， 中， 大}}
*/
void fuzzy_pid_init(struct DOG_PID* this, _fuzzy_subset_ fuzzy_rules[][8], float range[][3]);
/* 
	模糊 PID
	参数说明：
	err 一维/二维误差：err/err[2]
	Kp 比例：p[4]
	Ki 积分：i[4]
	Kd 微分：d[4]
	output_limit 输出限幅：output_limit[4]
	i_limit 积分项限幅：i_limit[4]
	order 模糊化阶数
*/
void fuzzy_pid(struct DOG_PID* this, float* err, float* p, float* i, float* d, float* output_limit, float* i_limit, uint8 order);

// 构造函数
void dog_pid(struct DOG_PID* this);
// 析构函数
void _dog_pid(struct DOG_PID* this);

#endif