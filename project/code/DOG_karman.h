#ifndef __DOG_KARMAN_H__
#define __DOG_KARMAN_H__
#include "common.h"

void Kalman_Init(Kalman_Typedef *klm, const float klm_Q, const float klm_R);
float KalmanFilter(Kalman_Typedef *klm, float input);


float Lowfloat_Fitier(Lowfloat_Typedef *lowf,float newww,float olddd);
void Lowfloat_Init(Lowfloat_Typedef *lowf,float lowf_k);

#endif

