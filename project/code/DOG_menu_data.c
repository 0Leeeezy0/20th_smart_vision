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
_MENU_AI_CAMERA_1_ MENU_AI_CAMERA_1;
_MENU_CHASSIS_ MENU_CHASSIS;
_MENU_PATH_ MENU_PATH;
_MENU_CIRCLE_PATH_ MENU_CIRCLE_PATH;
_MENU_PID_ MENU_MOTOR_1_PID;
_MENU_PID_ MENU_MOTOR_2_PID;
_MENU_PID_ MENU_MOTOR_3_PID;
_MENU_PATH_PID_ MENU_PATH_PID;
_MENU_ROTATE_PID_ MENU_ROTATE_PID;

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
	
	MENU_EULER_ANGLE.roll.name = "ROLL";
	MENU_EULER_ANGLE.pitch.name = "PITCH";
	MENU_EULER_ANGLE.yaw.name = "YAW";
	
	MENU_SHIFT.shift_yaw.name = "YAW";
	MENU_SHIFT.shift_distance.name = "DISTANCE";

	MENU_AI_CAMERA_0.ai_camera_0_enable_flag.name = "CAMERA_0_EN";
	MENU_AI_CAMERA_0.track_linear_speed_target.name = "TARTGET";
	MENU_AI_CAMERA_0.track_linear_speed_revise.name = "REVISE";
	MENU_AI_CAMERA_0.detection_box_width_limit.name = "W_LIMIT";
	MENU_AI_CAMERA_0.detection_box_width_std.name = "STD";
	MENU_AI_CAMERA_0.detection_box_center_limit.name = "CENTER_ERR_LIMIT";
	
	MENU_AI_CAMERA_1.ai_camera_1_enable_flag.name = "STATE";
	MENU_AI_CAMERA_1.detection_lable_result.name = "DETECTION_LABLE";
	MENU_AI_CAMERA_1.detection_num_result.name = "DETECTION_NUM";
	MENU_AI_CAMERA_1.block_position.name = "BLOCK_POSITION";
	
	MENU_CHASSIS.motion_kind.name = "KIND";
	MENU_CHASSIS.chassis_yaw.name = "CHASSIS_YAW";
	MENU_CHASSIS.linear_speed.name = "LINEAR_SPEED";
	MENU_CHASSIS.angular_speed.name = "ANGULAR_SPEED";
	MENU_CHASSIS.rotate_angle.name = "ANGLE";
	
	MENU_PATH.linear_speed_target.name = "LINEAR_SPEED_TAR";
	MENU_PATH.path_start.name = "PATH_START";
	MENU_PATH.path_end.name = "PATH_END";
	MENU_PATH.control_point_0.name = "PATH_CONTROL_0";
	MENU_PATH.control_point_1.name = "PATH_CONTROL_1";
	MENU_PATH.prediction_point.name = "PATH_PREDICT";
	
	MENU_CIRCLE_PATH.circle_path_enable_flag.name = "CIRCLE_EN";
	MENU_CIRCLE_PATH.circle_check_y.name = "CIRCLE_CHECK_Y";
	MENU_CIRCLE_PATH.circle_in_linear_speed_target.name = "CIRCLE_IN_SPEED";
	MENU_CIRCLE_PATH.circle_in_angle.name = "CIRCLE_IN_ANGLE";
	MENU_CIRCLE_PATH.circle_out_linear_speed_target.name = "CIRCLE_OUT_SPEED";
	MENU_CIRCLE_PATH.circle_out_angle.name = "CIRCLE_OUT_ANGLE";
	MENU_CIRCLE_PATH.side_extract_start.name = "SIDE_START";
	MENU_CIRCLE_PATH.side_extract_end.name = "SIDE_END";
	
	MENU_MOTOR_1_PID.p.name = "1_P";
	MENU_MOTOR_1_PID.i.name = "1_I";
	MENU_MOTOR_1_PID.d.name = "1_D";
	MENU_MOTOR_1_PID.output_limit.name = "OUTPUT_LIMIT";
	MENU_MOTOR_1_PID.i_limit.name = "I_LIMIT";
	
	MENU_MOTOR_2_PID.p.name = "2_P";
	MENU_MOTOR_2_PID.i.name = "2_I";
	MENU_MOTOR_2_PID.d.name = "2_D";
	MENU_MOTOR_2_PID.output_limit.name = "OUTPUT_LIMIT";
	MENU_MOTOR_2_PID.i_limit.name = "I_LIMIT";
	
	MENU_MOTOR_3_PID.p.name = "3_P";
	MENU_MOTOR_3_PID.i.name = "3_I";
	MENU_MOTOR_3_PID.d.name = "3_D";
	MENU_MOTOR_3_PID.output_limit.name = "OUTPUT_LIMIT";
	MENU_MOTOR_3_PID.i_limit.name = "I_LIMIT";
	
	MENU_PATH_PID.pid_kind.name = "KIND";
	MENU_PATH_PID.pid_kind.data_uint8 = 0;
	MENU_PATH_PID.PATH_PID.p.name = "PATH_P";
	MENU_PATH_PID.PATH_PID.i.name = "PATH_I";
	MENU_PATH_PID.PATH_PID.d.name = "PATH_D";
	MENU_PATH_PID.PATH_PID.output_limit.name = "OUTPUT_LIMIT";
	MENU_PATH_PID.PATH_PID.i_limit.name = "I_LIMIT";
	MENU_PATH_PID.PATH_PID.gyro_d.name = "GYRO_D";
	
	MENU_ROTATE_PID.pid_kind.name = "KIND";
	MENU_ROTATE_PID.pid_kind.data_uint8 = 0;
	MENU_ROTATE_PID.ROTATE_PID.p.name = "P";
	MENU_ROTATE_PID.ROTATE_PID.i.name = "I";
	MENU_ROTATE_PID.ROTATE_PID.d.name = "D";
	MENU_ROTATE_PID.ROTATE_PID.output_limit.name = "OUTPUT_LIMIT";
	MENU_ROTATE_PID.ROTATE_PID.i_limit.name = "I_LIMIT";
}

/* 杨队菜单数据初始化 */
void menu_data_yjc_init(void)
{

}





	