#include "common.h"
extern float motor_current_target[3];
extern float motor_pwm_duty[3];
extern float wheel_speed_target[3];

// ต๗สิ
void vofa_debug(void){
	/* VOFA */
//	wireless_vofa.justfloat_add(&wireless_vofa, 4, (float)path_state, (float)last_path_state, (float)detection_result.tool, (float)detection_result.num);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)wheel_speed_target[0], (float)wheel_speed_target[1], (float)wheel_speed_target[2]);
//	wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)encoder_1.wheel_speed, (float)encoder_2.wheel_speed, (float)encoder_3.wheel_speed);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)motor_pwm_duty[0], (float)motor_pwm_duty[1], (float)motor_pwm_duty[2]);
//    wireless_vofa.justfloat_add(&wireless_vofa, 3, (float)current_1.current, (float)current_2.current, (float)current_3.current);
    wireless_vofa.justfloat_add(&wireless_vofa, 5, (float)wheel_speed_target[1],(float)motor_current_target[1], (float)encoder_2.wheel_speed, (float)motor_pwm_duty[1],(float)current_2.current);

    wireless_vofa.justfloat_send(&wireless_vofa);

}