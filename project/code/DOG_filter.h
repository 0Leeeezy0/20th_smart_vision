#ifndef __DOG_KARMAN_H__
#define __DOG_KARMAN_H__
#include "common.h"

/* ¿¨¶ûÂü³õÊ¼»¯ */
void karman_init(_KALMAN_PARAMETERS_ *karman_parameters ,_KALMAN_VARIABLE_* karman_variable, float q, float r);

/* ¿¨¶ûÂüÂË²¨ */
float karman(_KALMAN_PARAMETERS_ *karman_parameters ,_KALMAN_VARIABLE_* karman_variable, float input);

/* µÍÍ¨ÂË²¨³õÊ¼»¯ */
void lowpass_init(_LOWPASS_PARAMETERS_ *lowpass_parameters, _LOWPASS_VARIABLE_ *lowpass_variable, float k);

/* µÍÍ¨ÂË²¨ */
float lowpass(_LOWPASS_PARAMETERS_ *lowpass_parameters, _LOWPASS_VARIABLE_ *lowpass_variable, float input);

#endif

