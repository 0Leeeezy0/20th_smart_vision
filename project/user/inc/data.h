#ifndef _DATA_H_
#define _DATA_H_

#include "common.h"

/* ¿‡∂®“Â */
extern struct DOG_MOTOR motor_1;
extern struct DOG_MOTOR motor_2;
extern struct DOG_MOTOR motor_3;
extern struct DOG_ENCODER encoder_1;
extern struct DOG_ENCODER encoder_2;
extern struct DOG_ENCODER encoder_3;
extern struct DOG_VOFA wireless_vofa;
extern struct DOG_IMU imu660ra;
extern struct DOG_SOLVE euler_angle_solve;
extern struct DOG_SOLVE chassis_solve;
extern struct DOG_SOLVE displacement_solve;
extern struct DOG_CV dog_cv;
extern struct DOG_PATH dog_path;

#endif