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
_MENU_EULER_ANGLE_ MENU_EULER_ANGLE;
_MENU_SHIFT_ MENU_SHIFT;
_MENU_AI_CAMERA_0_ MENU_AI_CAMERA_0;
_MENU_AI_CAMERA_1_2_ MENU_AI_CAMERA_1_2;
_MENU_PATH_ MENU_PATH;
_MENU_CIRCLE_PATH_ MENU_CIRCLE_PATH;
_MENU_MOTOR_PID_ MENU_MOTOR_1_PID;
_MENU_MOTOR_PID_ MENU_MOTOR_2_PID;
_MENU_MOTOR_PID_ MENU_MOTOR_3_PID;
_MENU_PATH_PID_ MENU_PATH_PID;

/* 大佐数据初始化 */
void menu_data_leeeezy_init(void)
{
	MENU_ENCODER.encoder_1_count.name = "1_COUNT";
	MENU_ENCODER.encoder_2_count.name = "2_COUNT";
	MENU_ENCODER.encoder_3_count.name = "3_COUNT";
	MENU_ENCODER.encoder_1_speed.name = "1_SPEED";
	MENU_ENCODER.encoder_2_speed.name = "2_SPEED";
	MENU_ENCODER.encoder_3_speed.name = "3_SPEED";
	
	MENU_MOTOR.motor_1_duty.name = "1_DUTY";
	MENU_MOTOR.motor_2_duty.name = "2_DUTY";
	MENU_MOTOR.motor_3_duty.name = "3_DUTY";
	MENU_MOTOR.motor_1_speed.name = "1_SPEED";
	MENU_MOTOR.motor_2_speed.name = "2_SPEED";
	MENU_MOTOR.motor_3_speed.name = "3_SPEED";
	MENU_MOTOR.motor_1_I.name = "1_I";
	MENU_MOTOR.motor_2_I.name = "2_I";
	MENU_MOTOR.motor_3_I.name = "3_I";
	
	MENU_GYRO_ACC.gyro_x.name = "GYRO_X";
	MENU_GYRO_ACC.gyro_y.name = "GYRO_Y";
	MENU_GYRO_ACC.gyro_z.name = "GYRO_Z";
	
	MENU_GYRO_ACC.acc_x.name = "ACC_X";
	MENU_GYRO_ACC.acc_y.name = "ACC_Y";
	MENU_GYRO_ACC.acc_z.name = "ACC_Z";
	
	MENU_EULER_ANGLE.roll.name = "ROLL";
	MENU_EULER_ANGLE.pitch.name = "PITCH";
	MENU_EULER_ANGLE.yaw.name = "YAW";
	
	MENU_SHIFT.distance.name = "DISTANCE";
	MENU_SHIFT.world_x.name = "WORLD_X";
	MENU_SHIFT.world_y.name = "WORLD_Y";
	MENU_SHIFT.world_yaw.name = "WORLD_YAW";

	MENU_AI_CAMERA_0.ai_camera_0_enable_flag.name = "CAMERA_0_EN";
	MENU_AI_CAMERA_0.detection_box_width_limit.name = "W_LIMIT";
	MENU_AI_CAMERA_0.detection_box_width_target.name = "W_TARGET";
	MENU_AI_CAMERA_0.detection_box_center_limit.name = "CENTER_ERR_LIMIT";
	
	MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.name = "SUP_EN"; 
	MENU_AI_CAMERA_1_2.detection_result.name = "DETECTION_RESULT";
	
	MENU_PATH.y_speed_target.name = "Y_SPEED_TAR";
	MENU_PATH.path_start.name = "PATH_START";
	MENU_PATH.path_end.name = "PATH_END";
	MENU_PATH.control_point_0.name = "PATH_CONTROL_0";
	MENU_PATH.control_point_1.name = "PATH_CONTROL_1";
	MENU_PATH.prediction_point.name = "PATH_PREDICT";
	MENU_PATH.x_speed_rate.name = "X_SPEED_RATE";
	
	MENU_CIRCLE_PATH.circle_enable_flag.name = "CIRCLE_EN";
	MENU_CIRCLE_PATH.circle_y_speed_target.name = "CIRCLE_Y_SPEED_TAR";
	MENU_CIRCLE_PATH.circle_angular_speed_target.name = "CIRCLE_A_SPEED_TAR";
	MENU_CIRCLE_PATH.circle_angle.name = "CIRCLE_ANGLE";
	MENU_CIRCLE_PATH.circle_check_y.name = "CIRCLE_CHECK_Y";
	MENU_CIRCLE_PATH.side_extract_start.name = "SIDE_START";
	MENU_CIRCLE_PATH.side_extract_end.name = "SIDE_END";
	
	MENU_MOTOR_1_PID.control_mode.name = "MODE";
	MENU_MOTOR_1_PID.control_mode.data_uint8 = 0;
	MENU_MOTOR_1_PID.motor_target.name = "TARGET";
	MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.name = "S_1_P";
	MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.name = "S_1_I";
	MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.name = "S_1_D";
	MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.name = "S_OUT_LIMIT";
	MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.name = "S_I_LIMIT";
	MENU_MOTOR_1_PID.MOTOR_I_PID.p.name = "I_1_P";
	MENU_MOTOR_1_PID.MOTOR_I_PID.i.name = "I_1_I";
	MENU_MOTOR_1_PID.MOTOR_I_PID.d.name = "I_1_D";
	MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.name = "I_OUT_LIMIT";
	MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.name = "I_I_LIMIT";
	
	MENU_MOTOR_2_PID.control_mode.name = "MODE";
	MENU_MOTOR_2_PID.control_mode.data_uint8 = 0;
	MENU_MOTOR_2_PID.motor_target.name = "TARGET";
	MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.name = "S_2_P";
	MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.name = "S_2_I";
	MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.name = "S_2_D";
	MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.name = "S_OUT_LIMIT";
	MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.name = "S_I_LIMIT";
	MENU_MOTOR_2_PID.MOTOR_I_PID.p.name = "I_2_P";
	MENU_MOTOR_2_PID.MOTOR_I_PID.i.name = "I_2_I";
	MENU_MOTOR_2_PID.MOTOR_I_PID.d.name = "I_2_D";
	MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.name = "I_OUT_LIMIT";
	MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.name = "I_I_LIMIT";
	
	MENU_MOTOR_3_PID.control_mode.name = "MODE";
	MENU_MOTOR_3_PID.control_mode.data_uint8 = 0;
	MENU_MOTOR_3_PID.motor_target.name = "TARGET";
	MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.name = "S_3_P";
	MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.name = "S_3_I";
	MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.name = "S_3_D";
	MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.name = "S_OUT_LIMIT";
	MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.name = "S_I_LIMIT";
	MENU_MOTOR_3_PID.MOTOR_I_PID.p.name = "I_3_P";
	MENU_MOTOR_3_PID.MOTOR_I_PID.i.name = "I_3_I";
	MENU_MOTOR_3_PID.MOTOR_I_PID.d.name = "I_3_D";
	MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.name = "I_OUT_LIMIT";
	MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.name = "I_I_LIMIT";
	
	MENU_PATH_PID.pid_kind.name = "KIND";
	MENU_PATH_PID.pid_kind.data_uint8 = 0;
	MENU_PATH_PID.PATH_PID.p.name = "PATH_P";
	MENU_PATH_PID.PATH_PID.i.name = "PATH_I";
	MENU_PATH_PID.PATH_PID.d.name = "PATH_D";
	MENU_PATH_PID.PATH_PID.output_limit.name = "OUTPUT_LIMIT";
	MENU_PATH_PID.PATH_PID.i_limit.name = "I_LIMIT";
	MENU_PATH_PID.PATH_PID.gyro_d.name = "GYRO_D";
}

/* 杨队菜单数据初始化 */
void menu_data_yjc_init(void)
{

}





	