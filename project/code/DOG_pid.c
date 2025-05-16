#include "common.h"

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
	pid_paraments -> value += pid_variable -> delta;
	pid_variable -> last_err = pid_variable -> now_err;
	pid_variable -> last_last_err = pid_variable -> last_err;
   
//	pid_variable -> now_err = target-feedback;
//	 
//    pid_variable -> delta = (pid_variable -> now_err - pid_variable -> last_err);	
//	
//    pid_paraments -> value_delta = ((pid_paraments -> p) * pid_variable -> delta)
//                            + ((pid_paraments -> i) * pid_variable -> now_err) 
//                            + ((pid_paraments -> d) * (pid_variable -> now_err-2*pid_variable -> last_err+pid_variable -> last_last_err));				
//    
//    pid_variable -> sjc_now_delta = pid_paraments -> value_delta;
//	
//    pid_variable ->sjc_err = pid_variable -> sjc_now_delta - pid_variable -> sjc_last_delta;
//    
//    pid_paraments -> value += pid_paraments ->value_delta + pid_paraments -> d * pid_variable ->sjc_err;
//    
//    pid_variable -> last_err = pid_variable -> now_err;
//    
//    pid_variable -> sjc_last_delta = pid_paraments ->value_delta;
//    
//    pid_variable -> last_last_err = pid_variable -> last_err;

//    if (pid_paraments -> value>=0){        
//        pid_paraments -> value_output= pid_paraments -> value* 4 + 600;	// 加这个会导致开启震一下
//    }
//    else if (pid_paraments -> value<0){        
//        pid_paraments -> value_output= pid_paraments -> value* 4 - 600;	// 加这个会导致开启震一下
//    }
//  pid_paraments -> value_output= pid_paraments -> value* 1.3 + (pid_paraments -> value / pid_paraments -> value + 1 ) *800;	// 加这个会导致开启震一下
	pid_paraments -> value_output = pid_paraments -> value;
	
	// 输出限幅
	if(pid_paraments -> value_output > pid_paraments -> output_limit)
	{
		pid_paraments -> value_output = pid_paraments -> output_limit;
	}
	if(pid_paraments -> value_output < -pid_paraments -> output_limit)
	{
		pid_paraments -> value_output = -pid_paraments -> output_limit;
	}
	return pid_paraments -> value_output;
}

/* 增量式PID（速度环版） */
float incremental_speed_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{
//	pid_variable -> now_err = target-feedback;
//	pid_variable -> delta = 0;	
//    // 增量式 p
//	pid_variable -> delta += (pid_paraments -> p)*(pid_variable -> now_err-pid_variable -> last_err);
//	// 增量式 i
//	pid_variable -> delta += (pid_paraments -> i)*pid_variable -> now_err;
//	// 增量式 d
//	pid_variable -> delta += (pid_paraments -> d)*(pid_variable -> now_err-2*pid_variable -> last_err+pid_variable -> last_last_err);
//				
//	// 更新参数
//	pid_paraments -> value += pid_variable -> delta;
//	pid_variable -> last_err = pid_variable -> now_err;
//	pid_variable -> last_last_err = pid_variable -> last_err;
   
	pid_variable -> now_err = target-feedback;
	 
    pid_variable -> delta = (pid_variable -> now_err - pid_variable -> last_err);	
	
    pid_paraments -> value_delta = ((pid_paraments -> p) * pid_variable -> delta)
                            + ((pid_paraments -> i) * pid_variable -> now_err) 
                            + ((pid_paraments -> d) * (pid_variable -> now_err-2*pid_variable -> last_err+pid_variable -> last_last_err));				
    
    pid_variable -> sjc_now_delta = pid_paraments -> value_delta;
	
    pid_variable ->sjc_err = pid_variable -> sjc_now_delta - pid_variable -> sjc_last_delta;
    
    pid_paraments -> value += pid_paraments ->value_delta + pid_paraments -> d * pid_variable ->sjc_err;
    pid_variable -> last_err = pid_variable -> now_err;
    
    pid_variable -> sjc_last_delta = pid_paraments ->value_delta;
    
    pid_variable -> last_last_err = pid_variable -> last_err;
    
    
//    if (pid_paraments -> value>=0){        
//        pid_paraments -> value_output= pid_paraments -> value* 4 + 600;	// 加这个会导致开启震一下
//    }
//    else if (pid_paraments -> value<0){        
//        pid_paraments -> value_output= pid_paraments -> value* 4 - 600;	// 加这个会导致开启震一下
//    }
//  pid_paraments -> value_output= pid_paraments -> value* 1.3 + (pid_paraments -> value / pid_paraments -> value + 1 ) *800;	// 加这个会导致开启震一下
//	pid_paraments -> value_output = KalmanFilter(&Output_Kalman,pid_paraments -> value);
	pid_paraments -> value_output = pid_paraments -> value;
	// 输出限幅
	if(pid_paraments -> value_output > pid_paraments -> output_limit)
	{
		pid_paraments -> value_output = pid_paraments -> output_limit;
	}
	if(pid_paraments -> value_output < -pid_paraments -> output_limit)
	{
		pid_paraments -> value_output = -pid_paraments -> output_limit;
	}
	return pid_paraments -> value_output;
}

/*位置式PID*/
float positional_pid(_PID_PARAMETERS_* pid_paraments,_PID_VARIABLE_* pid_variable,float target,float feedback)
{
	pid_variable -> now_err = target-feedback;
	// 增量式 p
	pid_paraments -> value += (pid_paraments -> p)*(pid_variable -> now_err);
	// 增量式 i
	pid_paraments -> value += (pid_paraments -> i)*pid_variable -> sigma_err;
	// 增量式 d
	pid_paraments -> value += (pid_paraments -> d)*(pid_variable -> now_err-pid_variable -> last_err);
				
	// 更新参数
	pid_variable -> sigma_err += pid_variable -> now_err;
	pid_variable -> last_err = pid_variable -> now_err;
	
    pid_paraments -> value_output = pid_paraments -> value; 
	// 输出限幅
	if(pid_paraments -> value_output > pid_paraments -> output_limit)
	{
		pid_paraments -> value_output = pid_paraments -> output_limit;
	}
	if(pid_paraments -> value_output < -pid_paraments -> output_limit)
	{
		pid_paraments -> value_output = -pid_paraments -> output_limit;
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
	
	return pid_paraments -> value_output;
}