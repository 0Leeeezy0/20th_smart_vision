#include "common.h"
extern float motor_current_target[3];
extern float motor_pwm_duty[3];
extern float wheel_speed_target[3];

// ����
void vofa_debug(void){
	/* VOFA */
//    wireless_vofa.justfloat_add(&wireless_vofa, 1,37.27*bat_voltage.voltage);
//    wireless_vofa.justfloat_add(&wireless_vofa, 5, (float)path_err,(float)path_pid.Kp,(float)path_pid.Kd,(float)path_pid.value,(float)angular_speed_target) ;
//    wireless_vofa.justfloat_add(&wireless_vofa, 3,(float)path_gyro_karman.value,(float)path_gyroz_pid.Kd,(float)path_gyroz_pid.Kd*path_gyro_karman.value);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3,displacement_solve.x_speed,displacement_solve.y_speed,displacement_solve.angular_speed);
	
    //    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)wheel_speed_target[0], (float)wheel_speed_target[1], (float)wheel_speed_target[2]);
//	wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)encoder_1.wheel_speed, (float)encoder_2.wheel_speed, (float)encoder_3.wheel_speed);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)motor_pwm_duty[0], (float)motor_pwm_duty[1], (float)motor_pwm_duty[2]);

    //	wireless_vofa.justfloat_add(&wireless_vofa, 4, y_speed_target, last_y_speed_target, (float)path_state, (float)speed_slow_change_timer.time);
	// wireless_vofa.justfloat_add(&wireless_vofa, 2, PYTHAGOREAN((displacement_solve.world_x_displacement-last_box_world_x),(displacement_solve.world_y_displacement-last_box_world_y)), (float)path_state);
//    wireless_vofa.justfloat_send(&wireless_vofa);
	
	wireless_vofa.justfloat_add(&wireless_vofa, 5, displacement_solve.world_x_displacement, displacement_solve.world_y_displacement, displacement_solve.world_yaw, displacement_solve.distance, (float)path_state);
//	if(box_num >= 1)
//		wireless_vofa.justfloat_add(&wireless_vofa, 4, displacement_solve.world_x_displacement, displacement_solve.world_y_displacement, last_box_world_x[box_num-1], last_box_world_y[box_num-1]);
//	else
//		wireless_vofa.justfloat_add(&wireless_vofa, 4, displacement_solve.world_x_displacement, displacement_solve.world_y_displacement, 0, 0);
	// wireless_vofa.justfloat_add(&wireless_vofa, 2, (float)longest_white_control_point, imu660ra.gyro_z);
    wireless_vofa.justfloat_send(&wireless_vofa);
}
//���ӵ���Ч�� ����ɾ��
//�ٶȻ�����
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)wheel_speed_target[0], (float)wheel_speed_target[1], (float)wheel_speed_target[2]);
//	wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)encoder_1.wheel_speed, (float)encoder_2.wheel_speed, (float)encoder_3.wheel_speed);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)motor_current_target[0], (float)motor_current_target[1],(float)motor_current_target[2]);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)current_1.current, (float)current_2.current, (float)current_3.current);

////	wireless_vofa.justfloat_add(&wireless_vofa, 4, (float)path_state, (float)last_path_state, (float)detection_result.tool, (float)detection_result.num);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)wheel_speed_target[0], (float)wheel_speed_target[1], (float)wheel_speed_target[2]);
//	wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)encoder_1.wheel_speed, (float)encoder_2.wheel_speed, (float)encoder_3.wheel_speed);
////    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)motor_pwm_duty[0], (float)motor_pwm_duty[1], (float)motor_pwm_duty[2]);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)motor_current_target[0], (float)motor_current_target[1],(float)motor_current_target[2]);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)current_1.current, (float)current_2.current, (float)current_3.current);
////    wireless_vofa.justfloat_add(&wireless_vofa, 5, (float)wheel_speed_target[1],(float)motor_current_target[1], (float)encoder_2.wheel_speed, (float)motor_pwm_duty[1],(float)current_2.current);


//wireless_vofa.justfloat_add(&wireless_vofa, 2, (float)path_err, (float)imu660ra.gyro_z);
//    wireless_vofa.justfloat_add(&wireless_vofa, 5, (float)path_pid.Kd,(float)path_pid.Kp,(float)path_pid.value,(float)angular_speed_target,(float)path_gyroz_pid.Kd) ;
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)wheel_speed_target[0], (float)wheel_speed_target[1], (float)wheel_speed_target[2]);
//	wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)encoder_1.wheel_speed, (float)encoder_2.wheel_speed, (float)encoder_3.wheel_speed);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)motor_pwm_duty[0], (float)motor_pwm_duty[1], (float)motor_pwm_duty[2]);

//���򻷵���
//    wireless_vofa.justfloat_add(&wireless_vofa, 1,37.27*bat_voltage.voltage);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)path_err, (float)imu660ra.gyro_z,(float)path_gyro_karman.value);
//    wireless_vofa.justfloat_add(&wireless_vofa, 5, (float)path_pid.Kd,(float)path_pid.Kp,(float)path_pid.value,(float)angular_speed_target,(float)path_gyroz_pid.Kd) ;
