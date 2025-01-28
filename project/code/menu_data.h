/*
该文件用于菜单数据

API：
****用户****
************

****底层****
************
*/

#ifndef _MENU_DATA_H_
#define _MENU_DATA_H_

#include "common.h"

/* 菜单数据名、类型 */
typedef struct
{
	char* name;
	int16 data_int16;
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
	_MENU_DATA_NAME_TYPE_ motor_1_speed;
	_MENU_DATA_NAME_TYPE_ motor_2_speed;
	_MENU_DATA_NAME_TYPE_ motor_3_speed;
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
	_MENU_DATA_NAME_TYPE_ shift_yaw;
	_MENU_DATA_NAME_TYPE_ shift_distance;
}_MENU_SHIFT_;

/* 菜单参数 */
extern _MENU_ENCODER_ MENU_ENCODER;
extern _MENU_MOTOR_ MENU_MOTOR;
extern _MENU_GYRO_ACC_ MENU_GYRO_ACC;
extern _MENU_EULER_ANGLE_ MENU_EULER_ANGLE;
extern _MENU_SHIFT_ MENU_SHIFT;

//-----------------------------------------------------------------------------//

//-----------------------------------参数-----------------------------------//

/* MCXVISION参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ mcxvision_enable_flag;
	_MENU_DATA_NAME_TYPE_ track_linear_speed_target;
	_MENU_DATA_NAME_TYPE_ track_linear_speed_revise;
	_MENU_DATA_NAME_TYPE_ detection_box_width_limit;
	_MENU_DATA_NAME_TYPE_ detection_box_width_std;
	_MENU_DATA_NAME_TYPE_ detection_box_center_limit;
}_MENU_MCXVISION_;

/* 菜单底盘参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ motion_kind;
	_MENU_DATA_NAME_TYPE_ chassis_yaw;
	_MENU_DATA_NAME_TYPE_ linear_speed;
	_MENU_DATA_NAME_TYPE_ angular_speed;
	_MENU_DATA_NAME_TYPE_ rotate_angle;
}_MENU_CHASSIS_;

/* 菜单循线参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ linear_speed_target;
	_MENU_DATA_NAME_TYPE_ path_start;
	_MENU_DATA_NAME_TYPE_ path_end;
	_MENU_DATA_NAME_TYPE_ control_point;
	_MENU_DATA_NAME_TYPE_ prediction_point;
}_MENU_PATH_;

/* 菜单PID参数 */
typedef struct
{
	_MENU_DATA_NAME_TYPE_ p;
	_MENU_DATA_NAME_TYPE_ i;
	_MENU_DATA_NAME_TYPE_ d;
	_MENU_DATA_NAME_TYPE_ output_limit;
	_MENU_DATA_NAME_TYPE_ i_limit;
	_MENU_DATA_NAME_TYPE_ gyro_i_limit;
//	_MENU_DATA_NAME_TYPE_ value;
//	_MENU_DATA_NAME_TYPE_ delta;
//	_MENU_DATA_NAME_TYPE_ now_err;
//	_MENU_DATA_NAME_TYPE_ last_err;
//	_MENU_DATA_NAME_TYPE_ last_last_err;
//	_MENU_DATA_NAME_TYPE_ sigma_err;
}_MENU_PID_;

/* 菜单数据 */
extern _MENU_MCXVISION_ MENU_MCXVISION;
extern _MENU_CHASSIS_ MENU_CHASSIS;
extern _MENU_PATH_ MENU_PATH;
extern _MENU_PID_ MENU_MOTOR_1_PID;
extern _MENU_PID_ MENU_MOTOR_2_PID;
extern _MENU_PID_ MENU_MOTOR_3_PID;
extern _MENU_PID_ MENU_PATH_PID;

//--------------------------------------------------------------------------//

/* 大佐数据初始化 */
void menu_data_leeeezy_init(void);

/* 杨队菜单数据初始化 */
void menu_data_yjc_init(void);

#endif