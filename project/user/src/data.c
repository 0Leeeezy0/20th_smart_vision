#include "common.h"

/* 编码器计数数值（rad*1024） */
int16 encoder_1_count;
int16 encoder_2_count;
int16 encoder_3_count;

/* 编码器速度（rad/s） */
float encoder_1_speed;
float encoder_2_speed;
float encoder_3_speed;

/* 三轴角速度（°/s） */
float gyro_x;
float gyro_y;
float gyro_z;

/* 三轴角加速度（g(m/s^2)） */
float acc_x;
float acc_y;
float acc_z;

/* 电机速度（rad/s） */
float motor_1_speed;
float motor_2_speed;
float motor_3_speed;

/* 底盘控制参数 */
float yaw;
float linear_speed;
float angular_speed;

/* 
	单电机PID参数 
	P I D 输出限幅 积分限幅
*/
#if CHASSIS_PID_CHOOSE == 0
// 增量式
float PID_MOTOR_1[5] = {50 ,10 ,0 ,DUTY_LIMIT ,CHASSIS_PID_I};
float PID_MOTOR_2[5] = {50 ,10 ,0 ,DUTY_LIMIT ,CHASSIS_PID_I};
float PID_MOTOR_3[5] = {50 ,10 ,0 ,DUTY_LIMIT ,CHASSIS_PID_I};
#elif CHASSIS_PID_CHOOSE == 1
// 位置式
float PID_MOTOR_1[5] = {60 ,0 ,10 ,DUTY_LIMIT ,CHASSIS_PID_I};
float PID_MOTOR_2[5] = {60 ,0 ,10 ,DUTY_LIMIT ,CHASSIS_PID_I};
float PID_MOTOR_3[5] = {60 ,0 ,10 ,DUTY_LIMIT ,CHASSIS_PID_I};
#endif

/* 
	循迹PID参数 
	P I D
*/
#if PATH_PID_CHOOSE == 0
// 增量式
float PATH_PID[5] = {0.08 ,0.02 ,0 ,PATH_ERR_LIMIT ,PATH_PID_I};
#elif PATH_PID_CHOOSE == 1
// 位置式
float PATH_PID[5] = {0.05 ,0 ,0.1 ,PATH_ERR_LIMIT ,PATH_PID_I};
#endif


