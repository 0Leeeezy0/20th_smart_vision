#include "data.h"
#include "common.h"

/* 编码器计数数值（rad*1024） */
int16 encoder_1_count;
int16 encoder_2_count;
int16 encoder_3_count;

/* 编码器速度（rad/s） */
float encoder_1_speed;
float encoder_2_speed;
float encoder_3_speed;

/* 电机速度（rad/s） */
float motor_1_speed;
float motor_2_speed;
float motor_3_speed;

/* 底盘控制参数 */
float yaw;
float speed;

/* 
单电机PID参数 
P I D 上限
*/
float PID_MOTOR_1[3] = {100 ,30 ,10};
float PID_MOTOR_2[3] = {100 ,30 ,10};
float PID_MOTOR_3[3] = {100 ,30 ,10};

