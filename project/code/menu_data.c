/*
该文件用于菜单实现

API：
****用户****
************

****底层****
************
*/
#include "common.h"

_MENU_ENCODER_ MENU_ENCODER;
_MENU_MOTOR_ MENU_MOTOR;
_MENU_GYRO_ACC_ MENU_GYRO_ACC;
_MENU_CHASSIS_ MENU_CHASSIS;
_MENU_PATH_ MENU_PATH;
_MENU_PID_ MENU_MOTOR_1_PID;
_MENU_PID_ MENU_MOTOR_2_PID;
_MENU_PID_ MENU_MOTOR_3_PID;
_MENU_PID_ MENU_PATH_PID;

/* 大佐数据初始化 */
void menu_data_leeeezy_init(void)
{
	MENU_ENCODER.encoder_1_count.name = "1_COUNT";
	MENU_ENCODER.encoder_2_count.name = "2_COUNT";
	MENU_ENCODER.encoder_3_count.name = "3_COUNT";
	
	MENU_ENCODER.encoder_1_speed.name = "1_SPEED";
	MENU_ENCODER.encoder_2_speed.name = "2_SPEED";
	MENU_ENCODER.encoder_3_speed.name = "3_SPEED";
	
	MENU_MOTOR.motor_1_speed.name = "1_SPEED";
	MENU_MOTOR.motor_2_speed.name = "2_SPEED";
	MENU_MOTOR.motor_3_speed.name = "3_SPEED";
	
	MENU_GYRO_ACC.gyro_x.name = "GYRO_X";
	MENU_GYRO_ACC.gyro_y.name = "GYRO_Y";
	MENU_GYRO_ACC.gyro_z.name = "GYRO_Z";
	
	MENU_GYRO_ACC.acc_x.name = "ACC_X";
	MENU_GYRO_ACC.acc_y.name = "ACC_Y";
	MENU_GYRO_ACC.acc_z.name = "ACC_Z";
	
	MENU_CHASSIS.yaw.name = "YAW";
	MENU_CHASSIS.linear_speed.name = "L_SPEED";
	MENU_CHASSIS.angular_speed.name = "A_SPEED";
	
	MENU_PATH.linear_speed_target.name = "L_S_TAR";
	MENU_PATH.path_start.name = "START";
	MENU_PATH.path_end.name = "END";
	MENU_PATH.control_point.name = "CONTROL";
	MENU_PATH.prediction_point.name = "PREDICT";
	
	MENU_MOTOR_1_PID.p.name = "1_P";
	MENU_MOTOR_1_PID.i.name = "1_I";
	MENU_MOTOR_1_PID.d.name = "1_D";
	MENU_MOTOR_1_PID.output_limit.name = "O_LIMIT";
	MENU_MOTOR_1_PID.i_limit.name = "I_LIMIT";
	
	MENU_MOTOR_2_PID.p.name = "2_P";
	MENU_MOTOR_2_PID.p.data_float = chassis_pid.motor_2_pid.p;
	MENU_MOTOR_2_PID.i.name = "2_I";
	MENU_MOTOR_2_PID.i.data_float = chassis_pid.motor_2_pid.i;
	MENU_MOTOR_2_PID.d.name = "2_D";
	MENU_MOTOR_2_PID.d.data_float = chassis_pid.motor_2_pid.d;
	MENU_MOTOR_2_PID.output_limit.name = "O_LIMIT";
	MENU_MOTOR_2_PID.output_limit.data_float = chassis_pid.motor_2_pid.output_limit;
	MENU_MOTOR_2_PID.i_limit.name = "I_LIMIT";
	MENU_MOTOR_2_PID.i_limit.data_float = chassis_pid.motor_2_pid.i_limit;
	
	MENU_MOTOR_3_PID.p.name = "3_P";
	MENU_MOTOR_3_PID.p.data_float = chassis_pid.motor_3_pid.p;
	MENU_MOTOR_3_PID.i.name = "3_I";
	MENU_MOTOR_3_PID.i.data_float = chassis_pid.motor_3_pid.i;
	MENU_MOTOR_3_PID.d.name = "3_D";
	MENU_MOTOR_3_PID.d.data_float = chassis_pid.motor_3_pid.d;
	MENU_MOTOR_3_PID.output_limit.name = "O_LIMIT";
	MENU_MOTOR_3_PID.output_limit.data_float = chassis_pid.motor_3_pid.output_limit;
	MENU_MOTOR_3_PID.i_limit.name = "I_LIMIT";
	MENU_MOTOR_3_PID.i_limit.data_float = chassis_pid.motor_3_pid.i_limit;
	
	MENU_PATH_PID.p.name = "PATH_P";
	MENU_PATH_PID.p.data_float = path_pid.p;
	MENU_PATH_PID.i.name = "PATH_I";
	MENU_PATH_PID.i.data_float = path_pid.i;
	MENU_PATH_PID.d.name = "PATH_D";
	MENU_PATH_PID.d.data_float = path_pid.d;
	MENU_PATH_PID.output_limit.name = "O_LIMIT";
	MENU_PATH_PID.output_limit.data_float = path_pid.output_limit;
	MENU_PATH_PID.i_limit.name = "I_LIMIT";
	MENU_PATH_PID.i_limit.data_float = path_pid.i_limit;
}

/* 杨队菜单数据初始化 */
void menu_data_yjc_init(void)
{

}





	