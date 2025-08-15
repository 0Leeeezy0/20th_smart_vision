/*
该文件用于菜单数据

API：
****用户****
************

****底层****
************
*/

#ifndef _DOG_MENU_DATA_H_
#define _DOG_MENU_DATA_H_

#include "common.h"

/* 菜单数据名、类型 */
typedef struct
{
	char* name;
	int16 data_int16;
	uint16 data_uint16;
	uint8 data_uint8;
	float data_float;
}_MENU_DATA_NAME_TYPE_;

//-----------------------------------实时数据-----------------------------------//

/* 菜单编码器数据 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ encoder_1_count;
	_MENU_DATA_NAME_TYPE_ encoder_2_count;
	_MENU_DATA_NAME_TYPE_ encoder_3_count;	
	
	_MENU_DATA_NAME_TYPE_ encoder_1_speed;
	_MENU_DATA_NAME_TYPE_ encoder_2_speed;
	_MENU_DATA_NAME_TYPE_ encoder_3_speed;	
}_MENU_ENCODER_;

/* 菜单电机数据 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ motor_1_duty;
	_MENU_DATA_NAME_TYPE_ motor_2_duty;
	_MENU_DATA_NAME_TYPE_ motor_3_duty;
	_MENU_DATA_NAME_TYPE_ motor_1_speed;
	_MENU_DATA_NAME_TYPE_ motor_2_speed;
	_MENU_DATA_NAME_TYPE_ motor_3_speed;
	_MENU_DATA_NAME_TYPE_ motor_1_I;
	_MENU_DATA_NAME_TYPE_ motor_2_I;
	_MENU_DATA_NAME_TYPE_ motor_3_I;
}_MENU_MOTOR_;

/* 陀螺仪、加速度计数据 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ gyro_x;
	_MENU_DATA_NAME_TYPE_ gyro_y;
	_MENU_DATA_NAME_TYPE_ gyro_z;
	
	_MENU_DATA_NAME_TYPE_ acc_x;
	_MENU_DATA_NAME_TYPE_ acc_y;
	_MENU_DATA_NAME_TYPE_ acc_z;
}_MENU_GYRO_ACC_;

/* 欧拉角数据 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ roll;
	_MENU_DATA_NAME_TYPE_ pitch;
	_MENU_DATA_NAME_TYPE_ yaw;
}_MENU_EULER_ANGLE_;

/* 位移数据 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ distance;
	_MENU_DATA_NAME_TYPE_ world_x;
	_MENU_DATA_NAME_TYPE_ world_y;
	_MENU_DATA_NAME_TYPE_ world_yaw;
}_MENU_SHIFT_;

/* 菜单参数 */
extern _MENU_ENCODER_ MENU_ENCODER;
extern _MENU_MOTOR_ MENU_MOTOR;
extern _MENU_GYRO_ACC_ MENU_GYRO_ACC;
extern _MENU_EULER_ANGLE_ MENU_EULER_ANGLE;
extern _MENU_SHIFT_ MENU_SHIFT;

//-----------------------------------------------------------------------------//

//-----------------------------------参数-----------------------------------//

/* 对称法矫正 参数 */
//typedef struct
//{
//}_MENU_SYMMETRY_RECTIFICATE_;

/* 方案 参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ plan_idx;		// 方案索引
}_MENU_PLAN_;

/* 普通摄像头 参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ exp_time;		// 曝光度
}_MENU_COMMON_CAMERA_;

/* AI摄像头0 参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ ai_camera_0_enable_flag;		// 使能
	_MENU_DATA_NAME_TYPE_ detection_box_width_limit;	// 开始接近的检测框宽度阈值
	_MENU_DATA_NAME_TYPE_ detection_box_width_target;	// 开始定位的检测框目标宽度
	_MENU_DATA_NAME_TYPE_ detection_box_center_limit;	// 结束定位的检测框中心与图像中心误差阈值
	_MENU_DATA_NAME_TYPE_ box_x_speed_target;			// 箱子目标X速度
	_MENU_DATA_NAME_TYPE_ box_x_angular_speed_rate;		// 箱子目标旋转速度
	_MENU_DATA_NAME_TYPE_ box_fxxk_speed;				// 推箱子速度
	_MENU_DATA_NAME_TYPE_ box_distance;					// 箱子间距
}_MENU_AI_CAMERA_0_;

/* AI摄像头1/2 参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ ai_camera_1_enable_flag;		// 使能
	_MENU_DATA_NAME_TYPE_ ai_camera_2_enable_flag;		// 使能
	_MENU_DATA_NAME_TYPE_ supplement_lamp_enable_flag;	// 补光灯使能
	_MENU_DATA_NAME_TYPE_ detection_result;		// 标志识别结果
}_MENU_AI_CAMERA_1_2_;

/* 菜单循线参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ zebra_enable_flag;			// 使能
	_MENU_DATA_NAME_TYPE_ y_speed_target;
	_MENU_DATA_NAME_TYPE_ path_start;
	_MENU_DATA_NAME_TYPE_ path_end;
	_MENU_DATA_NAME_TYPE_ control_point_0;
	_MENU_DATA_NAME_TYPE_ control_point_1;
	_MENU_DATA_NAME_TYPE_ control_point_2;
	_MENU_DATA_NAME_TYPE_ control_point_3;
	_MENU_DATA_NAME_TYPE_ prediction_point;
	_MENU_DATA_NAME_TYPE_ x_speed_rate;
	_MENU_DATA_NAME_TYPE_ auto_control_point_min;
	_MENU_DATA_NAME_TYPE_ auto_control_point_max;
}_MENU_PATH_;

/* 菜单圆环循线参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ circle_enable_flag;
	_MENU_DATA_NAME_TYPE_ circle_y_speed_target;
	_MENU_DATA_NAME_TYPE_ circle_angular_speed_target;
	_MENU_DATA_NAME_TYPE_ circle_check_y;
	_MENU_DATA_NAME_TYPE_ circle_in_angle;
	_MENU_DATA_NAME_TYPE_ circle_out_angle;
	_MENU_DATA_NAME_TYPE_ side_extract_start;
	_MENU_DATA_NAME_TYPE_ side_extract_end;
	_MENU_DATA_NAME_TYPE_ circle_in_distance_limit;
	_MENU_DATA_NAME_TYPE_ circle_out_distance_limit;
}_MENU_CIRCLE_PATH_;

/* 菜单PID参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ p;
	_MENU_DATA_NAME_TYPE_ i;
	_MENU_DATA_NAME_TYPE_ d;
	_MENU_DATA_NAME_TYPE_ output_limit;
	_MENU_DATA_NAME_TYPE_ i_limit;
	_MENU_DATA_NAME_TYPE_ gyro_d;
}_MENU_PID_;

/* 菜单电机PID参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ control_mode;
	_MENU_DATA_NAME_TYPE_ motor_target;
	_MENU_PID_ MOTOR_SPEED_PID;
	_MENU_PID_ MOTOR_I_PID;
}_MENU_MOTOR_PID_;

/* 菜单循迹PID参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ pid_kind;
	_MENU_PID_ PATH_PID;
}_MENU_PATH_PID_;

/* 菜单数据 */
extern _MENU_COMMON_CAMERA_ MENU_COMMON_CAMERA;
extern _MENU_PLAN_ MENU_PLAN;
extern _MENU_AI_CAMERA_0_ MENU_AI_CAMERA_0;
extern _MENU_AI_CAMERA_1_2_ MENU_AI_CAMERA_1_2;
extern _MENU_PATH_ MENU_PATH;
extern _MENU_CIRCLE_PATH_ MENU_CIRCLE_PATH;
extern _MENU_MOTOR_PID_ MENU_MOTOR_1_PID;
extern _MENU_MOTOR_PID_ MENU_MOTOR_2_PID;
extern _MENU_MOTOR_PID_ MENU_MOTOR_3_PID;
extern _MENU_PATH_PID_ MENU_PATH_PID;

//--------------------------------------------------------------------------//

/* 大佐数据初始化 */
void menu_data_leeeezy_init(void);

/* 杨队菜单数据初始化 */
void menu_data_yjc_init(void);

#endif