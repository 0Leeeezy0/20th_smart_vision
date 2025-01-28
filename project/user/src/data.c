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

/* 欧拉角（°） */
float roll;		// 滚转角
float pitch;	// 俯仰角	
float yaw;		// 偏航角	正方向：逆时针

/* 位移解算（° m） */
float shift_yaw;
float shift_distance;

/* 底盘控制参数 */
float chassis_yaw = 0;				// 底盘航向角	正方向：顺时针
float chassis_linear_speed = 0;		// 底盘线速度
float chassis_angular_speed = 0;	// 底盘角速度
float chassis_rotate_angle = 0;		// 底盘转动角度	正方向：顺时针
_CHASSIS_CONTROL_ chassis_control;

/* 循迹参数 */
int16 path_err;
int16 path[MT9V03X_H][2] = {0};	// 路径线x、y坐标

/* AI追踪 */
int16 mcxvision_upgrade_time_count = 0;	// MCXVISION摄像头更新计时
int16 track_x_center;	// 追踪中心X坐标
int16 max_detection_box_width;	// 最大识别框宽度
int16 track_err = 0;	// 追踪误差

/* 标志位 */
uint8 gyro_calibration_flag = FALSE;	// 陀螺仪校准
uint8 acc_calibration_flag = FALSE;		// 加速度计校准
uint8 euler_angle_flag = FALSE;			// 欧拉角解算标志位
uint8 translate_shift_flag = FALSE;				// 平动位移解算标志位
uint8 mcxvision_upgrade_time_count_flag = FALSE;	// MCXVISION更新计时标志位
_CHASSIS_MOTION_ chassis_motion_flag = CHASSIS_MOVE;	// 底盘运动方式标志位
_CONTROL_MODE_ control_mode_flag = PATH_CONTROL_MODE;	// 摄像头类型标志位
_CONTROL_MODE_ track_finsh_next_mode_flag = BLOCK_RETRACK_MODE;	// 追踪结束模式切换标志位
uint8 mcxvision_enable_flag = TRUE;	// MCXVISION摄像头使能标志位

/**********************************************************************/

/****************************** 参数 ******************************/

/* PID */
_CHASSIS_PID_ chassis_pid;						// 底盘
_PATH_PID_ path_pid;							// 循迹
_MCXVISION_TRACK_PID_ mcxvision_track_pid;		// MCXVISION追踪

/* 循线 */
float path_linear_speed_target = 6;	// 循迹线速度
int16 path_start = 10;			// 路径线寻找开始高度
int16 path_end = 70;			// 路径线寻找结束高度
int16 control_point = 55;		// 控制点高度（速度：3：30 速度：6：50 速度：8：55）
int16 prediction_point = 50;	// 预测点高度：其横坐标将作为下一帧的搜线起点

/* AI追踪 */
float track_linear_speed_target = 2.5;	// 追踪线速度
float track_linear_speed_revise = 0.5;	// 追踪修正线速度
int16 detection_box_width_limit = 40;	// MCXVISION摄像头识别框宽度阈值
int16 detection_box_width_std = 100;	// MCXVISION摄像头识别框宽度标准阈值
int16 detection_box_center_limit = 80;	// MCXVISION摄像头识别框中心误差阈值
uint16 block_distance = 90;		// 方块距离TOF距离

/* 
	单电机PID参数 
	P I D 输出限幅 积分项限幅
*/
#if MOTOR_PID_CHOOSE == 0
// 增量式
float PID_MOTOR_1[5] = {50 ,10 ,0 ,7000 ,500};
float PID_MOTOR_2[5] = {50 ,10 ,0 ,7000 ,500};
float PID_MOTOR_3[5] = {50 ,10 ,0 ,7000 ,500};
#elif MOTOR_PID_CHOOSE == 1
// 位置式
float PID_MOTOR_1[5] = {250 ,0.1 ,400 ,7000 ,500};
float PID_MOTOR_2[5] = {250 ,0.1 ,400 ,7000 ,500};
float PID_MOTOR_3[5] = {250 ,0.1 ,400 ,7000 ,500};
#endif

/* 
	转动PID参数 
	P I D 输出限幅 积分项限幅
*/
#if ROTATE_PID_CHOOSE == 0
// 增量式 ( 小角度 中角度 大角度 )
float ROTATE_PID[4][5] = {{0.0004 ,0.0002 ,0.005 ,1 ,0.1},{0.0005 ,0.0006 ,0.005 ,1.6 ,0.1},{0.0009 ,0.00012 ,0.005 ,1.8 ,0.1},{0.001 ,0.0016 ,0.005 ,2.2 ,0.1}};
#elif ROTATE_PID_CHOOSE == 1
// 位置式 ( 小角度 中角度 大角度 )
float ROTATE_PID[5] = {0.05 ,0 ,0.1 ,1.3 ,1};
#endif

/* 
	循迹PID参数 
	P I D 陀螺仪微分项 输出限幅 积分项限幅
*/
#if PATH_PID_CHOOSE == 0
// 增量式 ( 小误差 中误差 大误差 )
//float PATH_PID[6] = {0.040 ,0.0026 ,0.005 ,0.005 ,0.8 ,1};	// linear_speed = 3
//float PATH_PID[6] = {0.041 ,0.0038 ,0.00949 ,0.0055 ,1 ,1};	// linear_speed = 6
float PATH_PID[3][6] = {{0.047 ,0.047 ,0.1 ,0.0055 ,1.3 ,1},{0.047 ,0.047 ,0.1 ,0.0055 ,1.3 ,1},{0.047 ,0.0047 ,0.1 ,0.0055 ,1.3 ,1}};	// linear_speed = 8
#elif PATH_PID_CHOOSE == 1
// 位置式
float PATH_PID[6] = {0.05 ,0 ,0.1 ,0.001 ,1.3 ,1};
#endif

/******************************************************************/



