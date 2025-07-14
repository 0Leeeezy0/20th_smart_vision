#include "DOG_rwr.h"
#include "math.h"

// 雷达平扫
void radar_scanning(struct DOG_RWR* this){
	if(this -> radar_scanning_enable_flag == True){
		// 若使能时间更改标志位为 False，即当前计时器时间给使能时间,并置标志位为True表示修改过了
		if(this -> enable_time_change_flag == False){
			this -> enable_time = *this -> time;
			this -> enable_time_change_flag = True;
		}
		uint32 time = fmod(*this -> time-this -> enable_time, 1000);
		// 在0-100ms内,以440Hz响
		if(time >= 0 && time < 100){
			pwm_init(this -> pin, 440, PWM_DUTY_MAX / 2);
		}
		// 在100-1000ms内,以200000Hz响
		if(time >= 100 && time < 1000){
			pwm_init(this -> pin, 200000, 0);
		}
	}
	if(this -> radar_scanning_enable_flag == False && this -> radar_tracking_enable_flag == False && this -> missile_launch_enable_flag == False){
		this -> enable_time_change_flag = False;
		pwm_init(this -> pin, 200000, 0);
	}
}

// 敌跟踪
void radar_tracking(struct DOG_RWR* this){
	if(this -> radar_tracking_enable_flag == True){
		// 若使能时间更改标志位为 False，即当前计时器时间给使能时间,并置标志位为True表示修改过了
		if(this -> enable_time_change_flag == False){
			this -> enable_time = *this -> time;
			this -> enable_time_change_flag = True;
		}
		uint32 time = fmod(*this -> time-this -> enable_time, 500);
		// 在0-250ms内,以523Hz响
		if(time >= 0 && time < 250){
			pwm_init(this -> pin, 523, PWM_DUTY_MAX / 2);
		}
		// 在250-500ms内,以349Hz响
		if(time >= 250 && time < 500){
			pwm_init(this -> pin, 349, PWM_DUTY_MAX / 2);
		}
	}
	if(this -> radar_scanning_enable_flag == False && this -> radar_tracking_enable_flag == False && this -> missile_launch_enable_flag == False){
		this -> enable_time_change_flag = False;
		pwm_init(this -> pin, 200000, 0);
	}
}

// 敌导弹
void missile_launch(struct DOG_RWR* this){
	if(this -> missile_launch_enable_flag == True){
		// 若使能时间更改标志位为 False，即当前计时器时间给使能时间,并置标志位为True表示修改过了
		if(this -> enable_time_change_flag == False){
			this -> enable_time = *this -> time;
			this -> enable_time_change_flag = True;
		}
		uint32 time = fmod(*this -> time-this -> enable_time, 220);
		// 在0-100ms内,以523Hz响
		if(time >= 0 && time < 100){
			pwm_init(this -> pin, 523, PWM_DUTY_MAX / 2);
		}
		// 在100-220ms内,以392Hz响
		if(time >= 100 && time < 220){
			pwm_init(this -> pin, 392, PWM_DUTY_MAX / 2);
		}
	}
	if(this -> radar_scanning_enable_flag == False && this -> radar_tracking_enable_flag == False && this -> missile_launch_enable_flag == False){
		this -> enable_time_change_flag = False;
		pwm_init(this -> pin, 200000, 0);
	}
}		

// 构造函数
void rwr(struct DOG_RWR* this, pwm_channel_enum pin, uint32* time){
	/* 标志位 */
	this -> radar_scanning_enable_flag = False;
	this -> radar_tracking_enable_flag = False;
	this -> missile_launch_enable_flag = False;
	this -> enable_time_change_flag = False;
	
	/* 成员变量 */
	this -> enable_time = 0;
	this -> pin = pin;
	
	/* 订阅计时器 */
	this -> time = time;
	
	/* 成员函数 */
	this -> radar_scanning = radar_scanning;
	this -> radar_tracking = radar_tracking;
	this -> missile_launch = missile_launch;
}

// 析构函数
void _rwr(struct DOG_RWR* this){
	/* 标志位 */
	this -> radar_scanning_enable_flag = False;
	this -> radar_tracking_enable_flag = False;
	this -> missile_launch_enable_flag = False;
}