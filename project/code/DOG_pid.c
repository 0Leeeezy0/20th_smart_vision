#include "common.h"

/* 模糊规则 */
static _FUZZY_SUBSET_ fuzzy_rules[8][8] = { {POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	PID_NONE},
											{POSITIVE_SMALL,	POSITIVE_MEDIUM,	POSITIVE_BIG,		POSITIVE_SMALL,		POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_SMALL,		PID_NONE},
											{POSITIVE_SMALL,	POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_SMALL,		POSITIVE_MEDIUM,	POSITIVE_BIG,		POSITIVE_SMALL,		PID_NONE},
											{POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_SMALL,		ZERO,				POSITIVE_SMALL,		POSITIVE_MEDIUM,	POSITIVE_BIG,		PID_NONE},
											{POSITIVE_SMALL,	POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_SMALL,		POSITIVE_MEDIUM,	POSITIVE_BIG,		POSITIVE_SMALL,		PID_NONE},
											{POSITIVE_SMALL,	POSITIVE_MEDIUM,	POSITIVE_BIG,		POSITIVE_SMALL,		POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_SMALL,		PID_NONE},
											{POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	POSITIVE_BIG,		POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	POSITIVE_MEDIUM,	PID_NONE},
											{PID_NONE,			PID_NONE,			PID_NONE,			PID_NONE,			PID_NONE,			PID_NONE,			PID_NONE, 			PID_NONE}};

//static _FUZZY_SUBSET_ fuzzy_rules[8][8] = {{5,5,5,6,5,5,5,7},
//											 {4,5,6,4,6,5,4,7},
//											 {4,6,5,4,5,6,4,7},
//											 {6,5,4,3,4,5,6,7},
//											 {4,6,5,4,5,6,4,7},
//											 {4,5,6,4,6,5,4,7},
//											 {5,5,5,6,5,5,5,7},
//											 {7,7,7,7,7,7,7,7}};

/* PID初始化 */
void pid_init(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float kp,float ki,float kd,float output_limit,float i_limit)
{
	pid_paraments -> p = kp;
	pid_paraments -> i = ki;
	pid_paraments -> d = kd;
	pid_paraments -> output_limit = output_limit;
	pid_paraments -> i_limit = i_limit;
	pid_variable -> delta = 0;    
	pid_variable -> now_err = 0;      
	pid_variable -> last_err = 0;      
	pid_variable -> last_last_err = 0;  
	pid_variable -> sigma_err = 0;  
	pid_variable -> value = 0;  
    pid_variable -> value_output = 0;  
    pid_variable -> value_delta = 0;  
}

/* 增量式PID */
float incremental_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{
	pid_variable -> now_err = target-feedback;
	pid_variable -> delta = 0;	
    // 增量式 p
	pid_variable -> delta += (pid_paraments -> p)*(pid_variable -> now_err-pid_variable -> last_err);
	// 增量式 i
	pid_variable -> delta += (pid_paraments -> i)*pid_variable -> now_err;
	// 增量式 d
	pid_variable -> delta += (pid_paraments -> d)*(pid_variable -> now_err-2*pid_variable -> last_err+pid_variable -> last_last_err);
				
	// 更新参数
	pid_variable -> value += pid_variable -> delta;
	pid_variable -> last_err = pid_variable -> now_err;
	pid_variable -> last_last_err = pid_variable -> last_err;
   
	pid_variable -> value_output = pid_variable -> value;
	
	// 输出限幅
	if(pid_variable -> value_output > pid_paraments -> output_limit)
	{
		pid_variable -> value_output = pid_paraments -> output_limit;
	}
	if(pid_variable -> value_output < -pid_paraments -> output_limit)
	{
		pid_variable -> value_output = -pid_paraments -> output_limit;
	}
	return pid_variable -> value_output;
}

/* 增量式PID（速度环版） */
float incremental_speed_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{   
	pid_variable -> now_err = target-feedback;
	 
    pid_variable -> delta = (pid_variable -> now_err - pid_variable -> last_err);	
	
    pid_variable -> value_delta = ((pid_paraments -> p) * pid_variable -> delta)
                            + ((pid_paraments -> i) * pid_variable -> now_err) 
                            + ((pid_paraments -> d) * (pid_variable -> now_err-2*pid_variable -> last_err+pid_variable -> last_last_err));				
    
    pid_variable -> sjc_now_delta = pid_variable -> value_delta;
	
    pid_variable ->sjc_err = pid_variable -> sjc_now_delta - pid_variable -> sjc_last_delta;
    
    pid_variable -> value += pid_variable ->value_delta + pid_paraments -> d * pid_variable ->sjc_err;
    pid_variable -> last_err = pid_variable -> now_err;
    
    pid_variable -> sjc_last_delta = pid_variable ->value_delta;
    
    pid_variable -> last_last_err = pid_variable -> last_err;
    
    
//    if (pid_paraments -> value>=0){        
//        pid_paraments -> value_output= pid_paraments -> value* 4 + 600;	// 加这个会导致开启震一下
//    }
//    else if (pid_paraments -> value<0){        
//        pid_paraments -> value_output= pid_paraments -> value* 4 - 600;	// 加这个会导致开启震一下
//    }
//  pid_paraments -> value_output= pid_paraments -> value* 1.3 + (pid_paraments -> value / pid_paraments -> value + 1 ) *800;	// 加这个会导致开启震一下
//	pid_paraments -> value_output = KalmanFilter(&Output_Kalman,pid_paraments -> value);
	pid_variable -> value_output = pid_variable -> value;
	// 输出限幅
	if(pid_variable -> value_output > pid_paraments -> output_limit)
	{
		pid_variable -> value_output = pid_paraments -> output_limit;
	}
	if(pid_variable -> value_output < -pid_paraments -> output_limit)
	{
		pid_variable -> value_output = -pid_paraments -> output_limit;
	}
	return pid_variable -> value_output;
}

/*位置式PID*/
float positional_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{
	pid_variable -> now_err = target-feedback;
	// 位置式 p
	pid_variable -> value += (pid_paraments -> p)*(pid_variable -> now_err);
	// 位置式 i
	pid_variable -> value += (pid_paraments -> i)*pid_variable -> sigma_err;
	// 位置式 d
	pid_variable -> value += (pid_paraments -> d)*(pid_variable -> now_err-pid_variable -> last_err);
				
	// 更新参数
	pid_variable -> sigma_err += pid_variable -> now_err;
	pid_variable -> last_err = pid_variable -> now_err;
	
    pid_variable -> value_output = pid_variable -> value; 
	pid_variable -> value = 0;
	// 输出限幅
	if(pid_variable -> value_output > pid_paraments -> output_limit)
	{
		pid_variable -> value_output = pid_paraments -> output_limit;
	}
	if(pid_variable -> value_output < -pid_paraments -> output_limit)
	{
		pid_variable -> value_output = -pid_paraments -> output_limit;
	}
	// 积分限幅
	if(pid_variable -> sigma_err > pid_paraments -> i_limit)
	{
		pid_variable -> sigma_err = pid_paraments -> i_limit;
	}
	if(pid_variable -> sigma_err < -pid_paraments -> i_limit)
	{
		pid_variable -> sigma_err = -pid_paraments -> i_limit;
	}
	
	return pid_variable -> value_output;
}

/* 模糊PID */
_PID_PARAMETERS_ fuzzy_pid_paraments_get(_PID_PARAMETERS_* pid_paraments,float err,float err_c,float* small,float* medium,float* big,uint8_t order)
{
	_FUZZY_SUBSET_ fuzzy_subset_err[2] = {PID_NONE};
	_FUZZY_SUBSET_ fuzzy_subset_err_c[2] = {PID_NONE};
	float affiliation_degree_err[2] = {0};
	float affiliation_degree_err_c[2] = {0};
	_FUZZY_SUBSET_ fuzzy_subset[2][2] = {PID_NONE};
	float affiliation_degree[2][2] = {0};
	
	_PID_PARAMETERS_ pid_paraments_return;
	float delta_p = 0;
	float delta_i = 0;
	float delta_d = 0;
	float delta_output_limit = 0;
	float delta_i_limit = 0;
	
	// err隶属子集与隶属度计算
	if(err <= -big[0])
	{
		fuzzy_subset_err[0] = NEGATIVE_BIG;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err < -medium[0] && err > -big[0])
	{
		fuzzy_subset_err[0] = NEGATIVE_BIG;
		affiliation_degree_err[0] = (float)fabs(err+medium[0])/(float)fabs(medium[0]-big[0]);
		fuzzy_subset_err[1] = NEGATIVE_MEDIUM;
		affiliation_degree_err[1] = (float)fabs(err+big[0])/(float)fabs(medium[0]-big[0]);
	}
	else if(err == -medium[0])
	{
		fuzzy_subset_err[0] = NEGATIVE_MEDIUM;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err < -small[0] && err > -medium[0])
	{
		fuzzy_subset_err[0] = NEGATIVE_MEDIUM;
		affiliation_degree_err[0] = (float)fabs(err+small[0])/(float)fabs(small[0]-medium[0]);
		fuzzy_subset_err[1] = NEGATIVE_SMALL;
		affiliation_degree_err[1] = (float)fabs(err+medium[0])/(float)fabs(small[0]-medium[0]);
	}
	else if(err == -small[0])
	{
		fuzzy_subset_err[0] = NEGATIVE_SMALL;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err < 0 && err > -small[0])
	{
		fuzzy_subset_err[0] = NEGATIVE_SMALL;
		affiliation_degree_err[0] = (float)fabs(err)/(float)fabs(small[0]);
		fuzzy_subset_err[1] = ZERO;
		affiliation_degree_err[1] = (float)fabs(err+small[0])/(float)fabs(small[0]);
	}
	else if(err == 0)
	{
		fuzzy_subset_err[0] = ZERO;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err > 0 && err < small[0])
	{
		fuzzy_subset_err[0] = ZERO;
		affiliation_degree_err[0] = (float)fabs(err-small[0])/(float)fabs(small[0]);
		fuzzy_subset_err[1] = POSITIVE_SMALL;
		affiliation_degree_err[1] = (float)fabs(err)/(float)fabs(small[0]);
	}
	else if(err == small[0])
	{
		fuzzy_subset_err[0] = POSITIVE_SMALL;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err > small[0] && err < medium[0])
	{
		fuzzy_subset_err[0] = POSITIVE_MEDIUM;
		affiliation_degree_err[0] = (float)fabs(err-small[0])/(float)fabs(small[0]-medium[0]);
		fuzzy_subset_err[1] = POSITIVE_SMALL;
		affiliation_degree_err[1] = (float)fabs(err-medium[0])/(float)fabs(small[0]-medium[0]);
	}
	else if(err == medium[0])
	{
		fuzzy_subset_err[0] = POSITIVE_MEDIUM;
		affiliation_degree_err[0] = 1;
		fuzzy_subset_err[1] = PID_NONE;
		affiliation_degree_err[1] = 0;
	}
	else if(err > medium[0] && err < big[0])
	{
		fuzzy_subset_err[0] = POSITIVE_BIG;
		affiliation_degree_err[0] = (float)fabs(err-medium[0])/(float)fabs(big[0]-medium[0]);
		fuzzy_subset_err[1] = POSITIVE_MEDIUM;
		affiliation_degree_err[1] = (float)fabs(err-big[0])/(float)fabs(big[0]-medium[0]);
	}
	else if(err >= big[0])
	{
		fuzzy_subset_err[0] = POSITIVE_BIG;
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
				fuzzy_subset[i][0] = fuzzy_rules[fuzzy_subset_err[i]][ZERO];
				affiliation_degree[i][0] = affiliation_degree_err[i];
			}
			break;
		}
		// 二阶
		case 2:
		{
			// err_c隶属子集与隶属度计算
			if(err_c <= -big[1])
			{
				fuzzy_subset_err_c[0] = NEGATIVE_BIG;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err_c < -medium[1] && err_c > -big[1])
			{
				fuzzy_subset_err_c[0] = NEGATIVE_BIG;
				affiliation_degree_err_c[0] = (float)fabs(err_c+medium[1])/(float)fabs(medium[1]-big[1]);
				fuzzy_subset_err_c[1] = NEGATIVE_MEDIUM;
				affiliation_degree_err_c[1] = (float)fabs(err_c+big[1])/(float)fabs(medium[1]-big[1]);
			}
			else if(err_c == -medium[1])
			{
				fuzzy_subset_err_c[0] = NEGATIVE_MEDIUM;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err_c < -small[1] && err_c > -medium[1])
			{
				fuzzy_subset_err_c[0] = NEGATIVE_MEDIUM;
				affiliation_degree_err_c[0] = (float)fabs(err_c+small[1])/(float)fabs(small[1]-medium[1]);
				fuzzy_subset_err_c[1] = NEGATIVE_SMALL;
				affiliation_degree_err_c[1] = (float)fabs(err_c+medium[1])/(float)fabs(small[1]-medium[1]);
			}
			else if(err_c == -small[1])
			{
				fuzzy_subset_err_c[0] = NEGATIVE_SMALL;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err_c < 0 && err_c > -small[1])
			{
				fuzzy_subset_err_c[0] = NEGATIVE_SMALL;
				affiliation_degree_err_c[0] = (float)fabs(err_c)/(float)fabs(small[1]);
				fuzzy_subset_err_c[1] = ZERO;
				affiliation_degree_err_c[1] = (float)fabs(err_c+small[1])/(float)fabs(small[1]);
			}
			else if(err_c == 0)
			{
				fuzzy_subset_err_c[0] = ZERO;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err_c > 0 && err_c < small[1])
			{
				fuzzy_subset_err_c[0] = ZERO;
				affiliation_degree_err_c[0] = (float)fabs(err_c-small[1])/(float)fabs(small[1]);
				fuzzy_subset_err_c[1] = POSITIVE_SMALL;
				affiliation_degree_err_c[1] = (float)fabs(err_c)/(float)fabs(small[1]);
			}
			else if(err_c == small[1])
			{
				fuzzy_subset_err_c[0] = POSITIVE_SMALL;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err_c > small[1] && err_c < medium[1])
			{
				fuzzy_subset_err_c[0] = POSITIVE_MEDIUM;
				affiliation_degree_err_c[0] = (float)fabs(err_c-small[1])/(float)fabs(small[1]-medium[1]);
				fuzzy_subset_err_c[1] = POSITIVE_SMALL;
				affiliation_degree_err_c[1] = (float)fabs(err_c-medium[1])/(float)fabs(small[1]-medium[1]);
			}
			else if(err_c == medium[1])
			{
				fuzzy_subset_err_c[0] = POSITIVE_MEDIUM;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			else if(err_c > medium[1] && err_c < big[1])
			{
				fuzzy_subset_err_c[0] = POSITIVE_BIG;
				affiliation_degree_err_c[0] = (float)fabs(err_c-medium[1])/(float)fabs(big[1]-medium[1]);
				fuzzy_subset_err_c[1] = POSITIVE_MEDIUM;
				affiliation_degree_err_c[1] = (float)fabs(err_c-big[1])/(float)fabs(big[1]-medium[1]);
			}
			else if(err_c >= big[1])
			{
				fuzzy_subset_err_c[0] = POSITIVE_BIG;
				affiliation_degree_err_c[0] = 1;
				fuzzy_subset_err_c[1] = PID_NONE;
				affiliation_degree_err_c[1] = 0;
			}
			// 模糊规则表查找：模糊化
			for(uint8_t i = 0; i < 2;i++)
			{
				for(uint8_t j = 0;j < 2;j++)
				{
					fuzzy_subset[i][j] = fuzzy_rules[fuzzy_subset_err[i]][fuzzy_subset_err_c[j]];
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
			if(fuzzy_subset[i][j] == NEGATIVE_BIG || fuzzy_subset[i][j] == POSITIVE_BIG)
			{
				delta_p += affiliation_degree[i][j]*pid_paraments[3].p;
				delta_i += affiliation_degree[i][j]*pid_paraments[3].i;
				delta_d += affiliation_degree[i][j]*pid_paraments[3].d;
				delta_output_limit += affiliation_degree[i][j]*pid_paraments[3].output_limit;
				delta_i_limit += affiliation_degree[i][j]*pid_paraments[3].i_limit;
			}
			else if(fuzzy_subset[i][j] == NEGATIVE_MEDIUM || fuzzy_subset[i][j] == POSITIVE_MEDIUM)
			{
				delta_p += affiliation_degree[i][j]*pid_paraments[2].p;
				delta_i += affiliation_degree[i][j]*pid_paraments[2].i;
				delta_d += affiliation_degree[i][j]*pid_paraments[2].d;
				delta_output_limit += affiliation_degree[i][j]*pid_paraments[2].output_limit;
				delta_i_limit += affiliation_degree[i][j]*pid_paraments[2].i_limit;
			}
			else if(fuzzy_subset[i][j] == NEGATIVE_SMALL || fuzzy_subset[i][j] == POSITIVE_SMALL)
			{
				delta_p += affiliation_degree[i][j]*pid_paraments[1].p;
				delta_i += affiliation_degree[i][j]*pid_paraments[1].i;
				delta_d += affiliation_degree[i][j]*pid_paraments[1].d;
				delta_output_limit += affiliation_degree[i][j]*pid_paraments[1].output_limit;
				delta_i_limit += affiliation_degree[i][j]*pid_paraments[1].i_limit;
			}
			else if(fuzzy_subset[i][j] == ZERO)
			{
				delta_p += affiliation_degree[i][j]*pid_paraments[0].p;
				delta_i += affiliation_degree[i][j]*pid_paraments[0].i;
				delta_d += affiliation_degree[i][j]*pid_paraments[0].d;
				delta_output_limit += affiliation_degree[i][j]*pid_paraments[0].output_limit;
				delta_i_limit += affiliation_degree[i][j]*pid_paraments[0].i_limit;
			}
		}
	}
	
//	just_float(5,err_c,(float)fuzzy_subset_err_c[0],(float)fuzzy_subset_err_c[1],affiliation_degree_err_c[0],affiliation_degree_err_c[1]);
//	update_data_end();
	
	// 计算模糊输出
	pid_paraments_return.p = delta_p;
	pid_paraments_return.i = delta_i;
	pid_paraments_return.d = delta_d;
	pid_paraments_return.output_limit = delta_output_limit;
	pid_paraments_return.i_limit = delta_i_limit;
	
	return pid_paraments_return;
}
