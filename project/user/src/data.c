#include "common.h"

/****************************** 实时数据 ******************************/

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

/* 三轴角速度（°/s） */
float gyro_x;
float gyro_y;
float gyro_z;

/* 三轴角加速度（g(m/s^2)） */
float acc_x;
float acc_y;
float acc_z;

/* 欧拉角 */
float roll;	// 滚转角
float pitch;	// 俯仰角	
float yaw;	// 偏航角

/* 底盘控制参数 */
float chassis_yaw;
float chassis_linear_speed;
float chassis_angular_speed;
_CHASSIS_CONTROL_ chassis_control;

/* 循迹参数 */
int16 path_err;
int16 path[MT9V03X_H][2] = {0};	// 路径线x、y坐标

/* 标志位 */
uint8 gyro_calibration_flag = FALSE;	// 陀螺仪校准
uint8 acc_calibration_flag = FALSE;	// 加速度计校准


/**********************************************************************/

/****************************** 参数 ******************************/

/* PID */
_CHASSIS_PID_ chassis_pid;	// 底盘
_PID_ path_pid;	// 循迹

/* 循线 */
float linear_speed_target = 8;	// 循迹线速度
int16 path_start = 10;	// 路径线寻找开始高度
int16 path_end = 70;	// 路径线寻找结束高度
int16 control_point = 50;	// 控制点高度（速度：3：30 速度：6：45 速度：8：50）
int16 prediction_point = 50;	// 预测点高度：其横坐标将作为下一帧的搜线起点

/* PID */
float duty_limit = 7000;	// PID占空比限幅
float chassis_pid_i_limit = 500;	// 底盘PID位置式积分项限幅
float path_err_limit = 1.3;	// PID循迹误差限幅（速度：3：0.8 速度：6：1.0 速度：8：1.3）
float path_pid_i_limit = 0.1;	// 循迹PID位置式积分项限幅

/* 
	单电机PID参数 
	P I D
*/
#if CHASSIS_PID_CHOOSE == 0
// 增量式
float PID_MOTOR_1[3] = {50 ,10 ,0};
float PID_MOTOR_2[3] = {50 ,10 ,0};
float PID_MOTOR_3[3] = {50 ,10 ,0};
#elif CHASSIS_PID_CHOOSE == 1
// 位置式
float PID_MOTOR_1[3] = {250 ,0.1 ,400};
float PID_MOTOR_2[3] = {250 ,0.1 ,400};
float PID_MOTOR_3[3] = {250 ,0.1 ,400};
#endif

/* 
	循迹PID参数 
	P I D 陀螺仪微分项
*/
#if PATH_PID_CHOOSE == 0
// 增量式
//float PATH_PID[4] = {0.040 ,0.0026 ,0.005 ,0.005};	// linear_speed = 3
//float PATH_PID[4] = {0.04 ,0.0037 ,0.007 ,0.0055};	// linear_speed = 6
float PATH_PID[4] = {0.047 ,0.0047 ,0.1 ,0.0055};	// linear_speed = 8
#elif PATH_PID_CHOOSE == 1
// 位置式
float PATH_PID[4] = {0.05 ,0 ,0.1 ,0.001};
#endif

/******************************************************************/



