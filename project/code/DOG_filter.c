#include "common.h"

/* 卡尔曼初始化 */
void karman_init(_KALMAN_PARAMETERS_ *karman_parameters ,_KALMAN_VARIABLE_* karman_variable, float q, float r)
{
	karman_parameters -> q = q;
	karman_parameters -> r = r;
	
	karman_variable -> p_last = 0;
	karman_variable -> p_now = 0;
	karman_variable -> value = 0;
	karman_variable -> Kg = 0;
}

/* 卡尔曼滤波 */
float karman(_KALMAN_PARAMETERS_ *karman_parameters ,_KALMAN_VARIABLE_* karman_variable, float input)
{
    //预测协方差方程：k时刻系统估算协方差 = k-1时刻的系统协方差 + 过程噪声协方差
    karman_variable -> p_now = karman_variable -> p_last + karman_parameters -> q;
    //卡尔曼增益方程：卡尔曼增益 = k时刻系统估算协方差 / （k时刻系统估算协方差 + 观测噪声协方差）
    karman_variable -> Kg = karman_variable -> p_now / (karman_variable -> p_now + karman_parameters -> r);
    //更新最优值方程：k时刻状态变量的最优值 = 状态变量的预测值 + 卡尔曼增益 * （测量值 - 状态变量的预测值）
    karman_variable -> value = karman_variable -> value + karman_variable -> Kg * (input - karman_variable -> value);//因为这一次的预测值就是上一次的输出值
    //更新协方差方程: 本次的系统协方差赋给 klm->LastP 为下一次运算准备。
    karman_variable -> p_last = (1-karman_variable -> Kg) * karman_variable -> p_now;
	
	return (karman_variable->value);
}

/* 低通滤波初始化 */
void lowpass_init(_LOWPASS_PARAMETERS_ *lowpass_parameters, _LOWPASS_VARIABLE_ *lowpass_variable, float k)
{
	lowpass_parameters -> k = k;
	lowpass_variable -> new_value = 0;
	lowpass_variable -> old_value = 0;
}

/* 低通滤波 */
float lowpass(_LOWPASS_PARAMETERS_ *lowpass_parameters, _LOWPASS_VARIABLE_ *lowpass_variable, float input)
{
	lowpass_variable -> new_value = input;		
	lowpass_variable -> new_value = lowpass_parameters -> k*lowpass_variable->new_value+(1-lowpass_parameters -> k)*lowpass_variable -> old_value;
	lowpass_variable -> old_value = lowpass_variable -> new_value;
	return (lowpass_variable -> new_value);
}
	


