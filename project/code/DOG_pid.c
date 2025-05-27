#include "common.h"

/* 模糊规则 */
static _FUZZY_SUBSET_ fuzzy_rules[8][8] = { {POSITIVE_BIG, 		POSITIVE_BIG, 		POSITIVE_BIG, 		POSITIVE_BIG, 		POSITIVE_MEDIUM, 	ZERO, 				ZERO,				PID_NONE},
											{POSITIVE_BIG,		POSITIVE_BIG, 		POSITIVE_BIG, 		POSITIVE_MEDIUM, 	POSITIVE_MEDIUM, 	ZERO, 				ZERO,				PID_NONE},
											{POSITIVE_BIG, 		POSITIVE_MEDIUM, 	POSITIVE_MEDIUM, 	POSITIVE_SMALL, 	ZERO, 				NEGATIVE_SMALL, 	NEGATIVE_MEDIUM,	PID_NONE},
											{POSITIVE_MEDIUM, 	POSITIVE_MEDIUM, 	POSITIVE_SMALL, 	ZERO, 				NEGATIVE_SMALL, 	NEGATIVE_MEDIUM, 	NEGATIVE_MEDIUM,	PID_NONE},
											{POSITIVE_SMALL,	POSITIVE_SMALL, 	ZERO, 				NEGATIVE_MEDIUM, 	NEGATIVE_MEDIUM, 	NEGATIVE_MEDIUM, 	NEGATIVE_BIG,		PID_NONE},
											{ZERO, 				ZERO, 				ZERO, 				NEGATIVE_MEDIUM, 	NEGATIVE_BIG, 		NEGATIVE_BIG, 		NEGATIVE_BIG,		PID_NONE},
											{ZERO, 				NEGATIVE_SMALL, 	NEGATIVE_BIG, 		NEGATIVE_BIG, 		NEGATIVE_BIG, 		NEGATIVE_BIG, 		NEGATIVE_BIG,		PID_NONE},
											{PID_NONE, 			PID_NONE, 			PID_NONE, 			PID_NONE, 			PID_NONE, 			PID_NONE, 			PID_NONE,			PID_NONE}};

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
_PID_PARAMETERS_ fuzzy_pid_paraments_get(_PID_PARAMETERS_* pid_paraments,float err,float err_c,float small,float medium,float big,uint8_t order)
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
	
	// err
	for(uint8_t i= 0;i < 8;i++)
	{
		if(err <= -big)
		{
			fuzzy_subset_err[0] = NEGATIVE_BIG;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
		else if(err < -medium && err > -big)
		{
			fuzzy_subset_err[0] = NEGATIVE_BIG;
			affiliation_degree_err[0] = abs(err-big)/abs(medium-big);
			fuzzy_subset_err[1] = NEGATIVE_MEDIUM;
			affiliation_degree_err[1] = abs(err-medium)/abs(medium-big);
		}
		else if(err == -medium)
		{
			fuzzy_subset_err[0] = NEGATIVE_MEDIUM;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
		else if(err < -small && err > -medium)
		{
			fuzzy_subset_err[0] = NEGATIVE_MEDIUM;
			affiliation_degree_err[0] = abs(err-medium)/abs(small-medium);
			fuzzy_subset_err[1] = NEGATIVE_SMALL;
			affiliation_degree_err[1] = abs(err-small)/abs(small-medium);
		}
		else if(err == -small)
		{
			fuzzy_subset_err[0] = NEGATIVE_SMALL;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
		else if(err < 0 && err > -small)
		{
			fuzzy_subset_err[0] = NEGATIVE_SMALL;
			affiliation_degree_err[0] = abs(err-small)/abs(small);
			fuzzy_subset_err[1] = ZERO;
			affiliation_degree_err[1] = abs(err)/abs(small);
		}
		else if(err == 0)
		{
			fuzzy_subset_err[0] = ZERO;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
		else if(err > 0 && err < small)
		{
			fuzzy_subset_err[0] = ZERO;
			affiliation_degree_err[0] = abs(err)/abs(small);
			fuzzy_subset_err[1] = POSITIVE_SMALL;
			affiliation_degree_err[1] = abs(err)/abs(small);
		}
		else if(err == small)
		{
			fuzzy_subset_err[0] = POSITIVE_MEDIUM;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
		else if(err > small && err < medium)
		{
			fuzzy_subset_err[0] = POSITIVE_MEDIUM;
			affiliation_degree_err[0] = abs(err-medium)/abs(small-medium);
			fuzzy_subset_err[1] = POSITIVE_SMALL;
			affiliation_degree_err[1] = abs(err-small)/abs(small-medium);
		}
		else if(err == medium)
		{
			fuzzy_subset_err[0] = POSITIVE_MEDIUM;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
		else if(err > medium && err < big)
		{
			fuzzy_subset_err[0] = POSITIVE_BIG;
			affiliation_degree_err[0] = abs(err-big)/abs(big-medium);
			fuzzy_subset_err[1] = POSITIVE_MEDIUM;
			affiliation_degree_err[1] = abs(err-medium)/abs(big-medium);
		}
		else if(err >= big)
		{
			fuzzy_subset_err[0] = POSITIVE_BIG;
			affiliation_degree_err[0] = 1;
			fuzzy_subset_err[1] = PID_NONE;
			affiliation_degree_err[1] = 0;
		}
	}
	
	switch(order)
	{
		case 1:
		{
			for(uint8_t i = 0; i < 2;i++)
			{
				fuzzy_subset[i][0] = fuzzy_rules[fuzzy_subset_err[i]][7];
				affiliation_degree[i][0] = affiliation_degree_err[i];
			}
			break;
		}
		case 2:
		{
			// err_c
			for(uint8_t i= 0;i < 8;i++)
			{
				if(err_c <= -big)
				{
					fuzzy_subset_err_c[0] = NEGATIVE_BIG;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				else if(err_c < -medium && err_c > -big)
				{
					fuzzy_subset_err_c[0] = NEGATIVE_BIG;
					affiliation_degree_err_c[0] = abs(err-big)/abs(medium-big);
					fuzzy_subset_err_c[1] = NEGATIVE_MEDIUM;
					affiliation_degree_err_c[1] = abs(err-medium)/abs(medium-big);
				}
				else if(err_c == -medium)
				{
					fuzzy_subset_err_c[0] = NEGATIVE_MEDIUM;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				else if(err_c < -small && err_c > -medium)
				{
					fuzzy_subset_err_c[0] = NEGATIVE_MEDIUM;
					affiliation_degree_err_c[0] = abs(err-medium)/abs(small-medium);
					fuzzy_subset_err_c[1] = NEGATIVE_SMALL;
					affiliation_degree_err_c[1] = abs(err-small)/abs(small-medium);
				}
				else if(err_c == -small)
				{
					fuzzy_subset_err_c[0] = NEGATIVE_SMALL;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				else if(err_c < 0 && err_c > -small)
				{
					fuzzy_subset_err_c[0] = NEGATIVE_SMALL;
					affiliation_degree_err_c[0] = abs(err-small)/abs(small);
					fuzzy_subset_err_c[1] = ZERO;
					affiliation_degree_err_c[1] = abs(err)/abs(small);
				}
				else if(err_c == 0)
				{
					fuzzy_subset_err_c[0] = ZERO;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				else if(err_c > 0 && err_c < small)
				{
					fuzzy_subset_err_c[0] = ZERO;
					affiliation_degree_err_c[0] = abs(err)/abs(small);
					fuzzy_subset_err_c[1] = POSITIVE_SMALL;
					affiliation_degree_err_c[1] = abs(err)/abs(small);
				}
				else if(err_c == small)
				{
					fuzzy_subset_err_c[0] = POSITIVE_MEDIUM;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				else if(err_c > small && err_c < medium)
				{
					fuzzy_subset_err_c[0] = POSITIVE_MEDIUM;
					affiliation_degree_err_c[0] = abs(err-medium)/abs(small-medium);
					fuzzy_subset_err_c[1] = POSITIVE_SMALL;
					affiliation_degree_err_c[1] = abs(err-small)/abs(small-medium);
				}
				else if(err == medium)
				{
					fuzzy_subset_err_c[0] = POSITIVE_MEDIUM;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				else if(err > medium && err < big)
				{
					fuzzy_subset_err_c[0] = POSITIVE_BIG;
					affiliation_degree_err_c[0] = abs(err-big)/abs(big-medium);
					fuzzy_subset_err_c[1] = POSITIVE_MEDIUM;
					affiliation_degree_err_c[1] = abs(err-medium)/abs(big-medium);
				}
				else if(err >= big)
				{
					fuzzy_subset_err_c[0] = POSITIVE_BIG;
					affiliation_degree_err_c[0] = 1;
					fuzzy_subset_err_c[1] = PID_NONE;
					affiliation_degree_err_c[1] = 0;
				}
				
				for(uint8_t i = 0; i < 2;i++)
				{
					for(uint8_t j = 0;i < 2;j++)
					{
						fuzzy_subset[i][j] = fuzzy_rules[fuzzy_subset_err[i]][fuzzy_subset_err_c[j]];
						affiliation_degree[i][j] = affiliation_degree_err[i]*affiliation_degree_err_c[j];
					}
				}
			}
			break;
		}
		default: break;
	}
	
	for(uint8_t i = 0; i < 2;i++)
	{
		for(uint8_t j = 0;i < 2;j++)
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
	
	pid_paraments_return.p += delta_p;
	pid_paraments_return.i += delta_i;
	pid_paraments_return.d += delta_d;
	pid_paraments_return.output_limit += delta_output_limit;
	pid_paraments_return.i_limit += delta_i_limit;
	
	return pid_paraments_return;
}
