#include "zf_common_headfile.h"
#include "zf_common_debug.h"
#include "math.h"

#include "DOG_pid.h"

// 增量式 PID
float incremental_pid(struct DOG_PID* this ,float target, float feedback){
	this -> now_err = target-feedback;
    // 增量式 Kp
	this -> value += (this -> Kp)*(this -> now_err-this -> last_err);
	// 增量式 Ki
	this -> value += (this -> Ki)*(this -> now_err);
	// 增量式 Kd
	this -> value += (this -> Kd)*(this -> now_err-2*this -> last_err+this -> last_last_err);
				
	// 更新参数
	this -> last_err = this -> now_err;
	this -> last_last_err = this -> last_err;
	
	// 输出限幅
	if(this -> value > this -> output_limit)
	{
		this -> value = this -> output_limit;
	}
	if(this -> value < -this -> output_limit)
	{
		this -> value = -this -> output_limit;
	}
	return this -> value;
}

// 位置式 PID
float positional_pid(struct DOG_PID* this ,float target, float feedback){
	float value_buffer = 0;
	this -> now_err = target-feedback;
	// 位置式 Kp
	value_buffer += (this -> Kp)*(this -> now_err);
	// 位置式 Ki
	value_buffer += (this -> Ki)*this -> sigma_err;
	// 位置式 Kd
	value_buffer += (this -> Kd)*(this -> now_err-this -> last_err);
				
	// 更新参数
	this -> sigma_err += this -> now_err;
	this -> last_err = this -> now_err;
	
	// 输出限幅
	if(value_buffer > this -> output_limit)
	{
		value_buffer = this -> output_limit;
	}
	if(value_buffer < -this -> output_limit)
	{
		value_buffer = -this -> output_limit;
	}
	// 积分限幅
	if(this -> sigma_err > this -> i_limit)
	{
		this -> sigma_err = this -> i_limit;
	}
	if(this -> sigma_err < -this -> i_limit)
	{
		this -> sigma_err = -this -> i_limit;
	}
	
	this -> value = value_buffer; 
	value_buffer = 0;
	
	return this -> value;
}

/*
	模糊 PID 初始化
	参数说明：
	fuzzy_rule 模糊规则表：fuzzy_rule[8][8]
	range 范围值：range[2][3] = {{小， 中， 大}, {小， 中， 大}}
*/
void fuzzy_pid_init(struct DOG_PID* this, _fuzzy_subset_ fuzzy_rules[][8], float range[][3]){
	for(uint8 i = 0; i < 8;i++){
		for(uint8 j = 0; j < 8;j++){
			this -> fuzzy_rules[i][j] = fuzzy_rules[i][j];
		}
	}
	
	for(uint8 i = 0; i < 2;i++){
		for(uint8 j = 0; j < 3;j++){
			this -> range[i][j] = range[i][j];
		}
	}
}

/* 
	模糊 PID
	参数说明：
	err 一维/二维误差：err/err[2]
	Kp 比例：p[4]
	Ki 积分：i[4]
	Kd 微分：d[4]
	i_limit 积分项限幅：i_limit[4]
	output_limit 输出限幅：output_limit[4]
	order 模糊化阶数
*/
void fuzzy_pid(struct DOG_PID* this, float* err, float* Kp, float* Ki, float* Kd, float* i_limit, float* output_limit, uint8 order){
	/* 初始化PID */
	float Kp_fuzzy = 0, Ki_fuzzy = 0, Kd_fuzzy = 0, i_limit_fuzzy = 0, output_limit_fuzzy = 0;
	/* 隶属子集 */
	_fuzzy_subset_ fuzzy_subset_err[2] = {PID_NONE};
	_fuzzy_subset_ fuzzy_subset_err_c[2] = {PID_NONE};
	/* 隶属度 */
	float affiliation_degree_err[2] = {0};
	float affiliation_degree_err_c[2] = {0};
	/* 查表对应的隶属子集和隶属度 */
	_fuzzy_subset_ fuzzy_subset[2][2] = {PID_NONE};
	float affiliation_degree[2][2] = {0};
	
	// err隶属子集与隶属度计算
	if(err[0] <= -this -> range[0][2])
	{
		fuzzy_subset_err[0] = NB;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err[0] < -this -> range[0][1] && err[0] > -this -> range[0][2])
	{
		fuzzy_subset_err[0] = NB;
		affiliation_degree_err[0] = (float)fabs(err[0]+this -> range[0][1])/(float)fabs(this -> range[0][1]-this -> range[0][2]);
		fuzzy_subset_err[1] = NM;
		affiliation_degree_err[1] = (float)fabs(err[0]+this -> range[0][2])/(float)fabs(this -> range[0][1]-this -> range[0][2]);
	}
	else if(err[0] == -this -> range[0][1])
	{
		fuzzy_subset_err[0] = NM;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err[0] < -this -> range[0][0] && err[0] > -this -> range[0][1])
	{
		fuzzy_subset_err[0] = NM;
		affiliation_degree_err[0] = (float)fabs(err[0]+this -> range[0][0])/(float)fabs(this -> range[0][0]-this -> range[0][1]);
		fuzzy_subset_err[1] = NS;
		affiliation_degree_err[1] = (float)fabs(err[0]+this -> range[0][1])/(float)fabs(this -> range[0][0]-this -> range[0][1]);
	}
	else if(err[0] == -this -> range[0][0])
	{
		fuzzy_subset_err[0] = NS;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err[0] < 0 && err[0] > -this -> range[0][0])
	{
		fuzzy_subset_err[0] = NS;
		affiliation_degree_err[0] = (float)fabs(err[0])/(float)fabs(this -> range[0][0]);
		fuzzy_subset_err[1] = ZERO;
		affiliation_degree_err[1] = (float)fabs(err[0]+this -> range[0][0])/(float)fabs(this -> range[0][0]);
	}
	else if(err[0] == 0)
	{
		fuzzy_subset_err[0] = ZERO;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err[0] > 0 && err[0] < this -> range[0][0])
	{
		fuzzy_subset_err[0] = ZERO;
		affiliation_degree_err[0] = (float)fabs(err[0]-this -> range[0][0])/(float)fabs(this -> range[0][0]);
		fuzzy_subset_err[1] = PS;
		affiliation_degree_err[1] = (float)fabs(err[0])/(float)fabs(this -> range[0][0]);
	}
	else if(err[0] == this -> range[0][0])
	{
		fuzzy_subset_err[0] = PS;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err[0] > this -> range[0][0] && err[0] < this -> range[0][1])
	{
		fuzzy_subset_err[0] = PM;
		affiliation_degree_err[0] = (float)fabs(err[0]-this -> range[0][0])/(float)fabs(this -> range[0][0]-this -> range[0][1]);
		fuzzy_subset_err[1] = PS;
		affiliation_degree_err[1] = (float)fabs(err[0]-this -> range[0][1])/(float)fabs(this -> range[0][0]-this -> range[0][1]);
	}
	else if(err[0] == this -> range[0][1])
	{
		fuzzy_subset_err[0] = PM;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err[0] > this -> range[0][1] && err[0] < this -> range[0][2])
	{
		fuzzy_subset_err[0] = PB;
		affiliation_degree_err[0] = (float)fabs(err[0]-this -> range[0][1])/(float)fabs(this -> range[0][2]-this -> range[0][1]);
		fuzzy_subset_err[1] = PM;
		affiliation_degree_err[1] = (float)fabs(err[0]-this -> range[0][2])/(float)fabs(this -> range[0][2]-this -> range[0][1]);
	}
	else if(err[0] >= this -> range[0][2])
	{
		fuzzy_subset_err[0] = PB;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	
	switch(order)
	{
		// 一阶
		case 1:
		{
			// 模糊规则表查找：模糊化
			for(uint8_t i = 0; i < 2;i++)
			{
				fuzzy_subset[i][0] = this -> fuzzy_rules[fuzzy_subset_err[i]][ZERO];
				affiliation_degree[i][0] = affiliation_degree_err[i];
			}
			break;
		}
		// 二阶
		case 2:
		{
			// err_c隶属子集与隶属度计算
			if(err[1] <= -this -> range[1][2])
			{
				fuzzy_subset_err_c[0] = NB;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err[1] < -this -> range[1][1] && err[1] > -this -> range[1][2])
			{
				fuzzy_subset_err_c[0] = NB;
				affiliation_degree_err_c[0] = (float)fabs(err[1]+this -> range[1][1])/(float)fabs(this -> range[1][1]-this -> range[1][2]);
				fuzzy_subset_err_c[1] = NM;
				affiliation_degree_err_c[1] = (float)fabs(err[1]+this -> range[1][2])/(float)fabs(this -> range[1][1]-this -> range[1][2]);
			}
			else if(err[1] == -this -> range[1][1])
			{
				fuzzy_subset_err_c[0] = NM;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err[1] < -this -> range[1][0] && err[1] > -this -> range[1][1])
			{
				fuzzy_subset_err_c[0] = NM;
				affiliation_degree_err_c[0] = (float)fabs(err[1]+this -> range[1][0])/(float)fabs(this -> range[1][0]-this -> range[1][1]);
				fuzzy_subset_err_c[1] = NS;
				affiliation_degree_err_c[1] = (float)fabs(err[1]+this -> range[1][1])/(float)fabs(this -> range[1][0]-this -> range[1][1]);
			}
			else if(err[1] == -this -> range[1][0])
			{
				fuzzy_subset_err_c[0] = NS;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err[1] < 0 && err[1] > -this -> range[1][0])
			{
				fuzzy_subset_err_c[0] = NS;
				affiliation_degree_err_c[0] = (float)fabs(err[1])/(float)fabs(this -> range[1][0]);
				fuzzy_subset_err_c[1] = ZERO;
				affiliation_degree_err_c[1] = (float)fabs(err[1]+this -> range[1][0])/(float)fabs(this -> range[1][0]);
			}
			else if(err[1] == 0)
			{
				fuzzy_subset_err_c[0] = ZERO;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err[1] > 0 && err[1] < this -> range[1][0])
			{
				fuzzy_subset_err_c[0] = ZERO;
				affiliation_degree_err_c[0] = (float)fabs(err[1]-this -> range[1][0])/(float)fabs(this -> range[1][0]);
				fuzzy_subset_err_c[1] = PS;
				affiliation_degree_err_c[1] = (float)fabs(err[1])/(float)fabs(this -> range[1][0]);
			}
			else if(err[1] == this -> range[1][0])
			{
				fuzzy_subset_err_c[0] = PS;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err[1] > this -> range[1][0] && err[1] < this -> range[1][1])
			{
				fuzzy_subset_err_c[0] = PM;
				affiliation_degree_err_c[0] = (float)fabs(err[1]-this -> range[1][0])/(float)fabs(this -> range[1][0]-this -> range[1][1]);
				fuzzy_subset_err_c[1] = PS;
				affiliation_degree_err_c[1] = (float)fabs(err[1]-this -> range[1][1])/(float)fabs(this -> range[1][0]-this -> range[1][1]);
			}
			else if(err[1] == this -> range[1][1])
			{
				fuzzy_subset_err_c[0] = PM;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err[1] > this -> range[1][1] && err[1] < this -> range[1][2])
			{
				fuzzy_subset_err_c[0] = PB;
				affiliation_degree_err_c[0] = (float)fabs(err[1]-this -> range[1][1])/(float)fabs(this -> range[1][2]-this -> range[1][1]);
				fuzzy_subset_err_c[1] = PM;
				affiliation_degree_err_c[1] = (float)fabs(err[1]-this -> range[1][2])/(float)fabs(this -> range[1][2]-this -> range[1][1]);
			}
			else if(err[1] >= this -> range[1][2])
			{
				fuzzy_subset_err_c[0] = PB;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			// 模糊规则表查找：模糊化
			for(uint8_t i = 0; i < 2;i++)
			{
				for(uint8_t j = 0;j < 2;j++)
				{
					fuzzy_subset[i][j] = this -> fuzzy_rules[fuzzy_subset_err[i]][fuzzy_subset_err_c[j]];
					affiliation_degree[i][j] = affiliation_degree_err[i]*affiliation_degree_err_c[j];
				}
			}
			break;
		}
		default: break;
	}
	// 解模糊
	for(uint8_t i = 0; i < 2;i++)
	{
		for(uint8_t j = 0;j < 2;j++)
		{
			if(fuzzy_subset[i][j] == NB || fuzzy_subset[i][j] == PB)
			{
				Kp_fuzzy += affiliation_degree[i][j]*Kp[3];
				Ki_fuzzy += affiliation_degree[i][j]*Ki[3];
				Kd_fuzzy += affiliation_degree[i][j]*Kd[3];
				i_limit_fuzzy += affiliation_degree[i][j]*i_limit[3];
				output_limit_fuzzy += affiliation_degree[i][j]*output_limit[3];
			}
			else if(fuzzy_subset[i][j] == NM || fuzzy_subset[i][j] == PM)
			{
				Kp_fuzzy += affiliation_degree[i][j]*Kp[2];
				Ki_fuzzy += affiliation_degree[i][j]*Ki[2];
				Kd_fuzzy += affiliation_degree[i][j]*Kd[2];
				i_limit_fuzzy += affiliation_degree[i][j]*i_limit[2];
				output_limit_fuzzy += affiliation_degree[i][j]*output_limit[2];
			}
			else if(fuzzy_subset[i][j] == NS || fuzzy_subset[i][j] == PS)
			{
				Kp_fuzzy += affiliation_degree[i][j]*Kp[1];
				Ki_fuzzy += affiliation_degree[i][j]*Ki[1];
				Kd_fuzzy += affiliation_degree[i][j]*Kd[1];
				i_limit_fuzzy += affiliation_degree[i][j]*i_limit[1];
				output_limit_fuzzy += affiliation_degree[i][j]*output_limit[1];
			}
			else if(fuzzy_subset[i][j] == ZERO)
			{
				Kp_fuzzy += affiliation_degree[i][j]*Kp[0];
				Ki_fuzzy += affiliation_degree[i][j]*Ki[0];
				Kd_fuzzy += affiliation_degree[i][j]*Kd[0];
				i_limit_fuzzy += affiliation_degree[i][j]*i_limit[0];
				output_limit_fuzzy += affiliation_degree[i][j]*output_limit[0];
			}
		}
	}
	this -> Kp = Kp_fuzzy;
	this -> Ki = Ki_fuzzy;
	this -> Kd = Kd_fuzzy;
	this -> i_limit = i_limit_fuzzy;
	this -> output_limit = output_limit_fuzzy;
}

// 构造函数
void pid(struct DOG_PID* this){
	/* 成员变量 */ 
	this -> Kp = 0;
	this -> Ki = 0;
	this -> Kd = 0;
	this -> output_limit = 0;
	this -> i_limit = 0;
	this -> now_err = 0;
	this -> last_err = 0;
	this -> last_last_err = 0;
	this -> sigma_err = 0;
	this -> value = 0;
	this -> value_delta = 0;
	
	/* 成员函数 */
	this -> incremental_pid = incremental_pid;
	this -> positional_pid = positional_pid;
	this -> fuzzy_pid_init = fuzzy_pid_init;
	this -> fuzzy_pid = fuzzy_pid;
	
	return;
}

// 析构函数
void _pid(struct DOG_PID* this){
	/* 成员变量 */ 
	this -> Kp = 0;
	this -> Ki = 0;
	this -> Kd = 0;
	this -> output_limit = 0;
	this -> i_limit = 0;
	this -> now_err = 0;
	this -> last_err = 0;
	this -> last_last_err = 0;
	this -> sigma_err = 0;
	this -> value = 0;
	this -> value_delta = 0;
}