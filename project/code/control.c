#include "common.h"
#include "data.h"

/* 角度环->运动学逆解算->速度环 控制 */
void Angle2Inv2Speed_control(void){
	rotate_pid_calc(); 
	switch(move_solve_kind){ 
		case SPEED_YAW_SOLVE:{ chassis_solve.move_inv_solve(&chassis_solve, SPEED_YAW_SOLVE, linear_speed_target, translation_yaw_target, angular_speed_target); break; } 
		case XY_SPEED_SOLVE:{ chassis_solve.move_inv_solve(&chassis_solve, XY_SPEED_SOLVE, x_speed_target, y_speed_target, angular_speed_target); break; }
	}   
	wheel_speed_target[0] = chassis_solve.wheel_1_speed; 
	wheel_speed_target[1] = chassis_solve.wheel_2_speed;
	wheel_speed_target[2] = chassis_solve.wheel_3_speed;
	motor_pid_calc(); 
	PWM_control(); 
}

/* 箱子X->运动学逆解算->速度环 控制 */
void X2Inv2Speed_control(void){
	box_x_pid_calu(); 
	chassis_solve.move_inv_solve(&chassis_solve, XY_SPEED_SOLVE, x_speed_target, y_speed_target, angular_speed_target);  
	wheel_speed_target[0] = chassis_solve.wheel_1_speed; 
	wheel_speed_target[1] = chassis_solve.wheel_2_speed; 
	wheel_speed_target[2] = chassis_solve.wheel_3_speed;
	motor_pid_calc(); 
	PWM_control(); 
}

/* 箱子Y->运动学逆解算->速度环 控制 */
void Y2Inv2Speed_control(void){
	box_y_pid_calu(); 
	chassis_solve.move_inv_solve(&chassis_solve, XY_SPEED_SOLVE, x_speed_target, y_speed_target, angular_speed_target);  
	wheel_speed_target[0] = chassis_solve.wheel_1_speed; 
	wheel_speed_target[1] = chassis_solve.wheel_2_speed; 
	wheel_speed_target[2] = chassis_solve.wheel_3_speed;
	motor_pid_calc(); 
	PWM_control(); 
}

/* 箱子XY->运动学逆解算->速度环 控制 */
void XY2Inv2Speed_control(void){
	box_xy_pid_calu(); 
	chassis_solve.move_inv_solve(&chassis_solve, XY_SPEED_SOLVE, x_speed_target, y_speed_target, angular_speed_target);  
	wheel_speed_target[0] = chassis_solve.wheel_1_speed; 
	wheel_speed_target[1] = chassis_solve.wheel_2_speed; 
	wheel_speed_target[2] = chassis_solve.wheel_3_speed;
	motor_pid_calc(); 
	PWM_control(); 
}

/* 运动学逆解算->速度环 控制 */
void Inv2Speed_control(void){
	switch(move_solve_kind){ 	
		case SPEED_YAW_SOLVE:{ chassis_solve.move_inv_solve(&chassis_solve, SPEED_YAW_SOLVE, linear_speed_target, translation_yaw_target, angular_speed_target); break; } 
		case XY_SPEED_SOLVE:{ chassis_solve.move_inv_solve(&chassis_solve, XY_SPEED_SOLVE, x_speed_target, y_speed_target, angular_speed_target); break; }
	}   
	wheel_speed_target[0] = chassis_solve.wheel_1_speed; wheel_speed_target[1] = chassis_solve.wheel_2_speed; wheel_speed_target[2] = chassis_solve.wheel_3_speed;
	motor_pid_calc();
	PWM_control();
}

/* 纯速度环 控制 */
void Speed_control(void){
	motor_pid_calc();
	PWM_control();
}

/* 纯PWM 控制 */
void PWM_control(void){
	/* 电机1 */
	if(motor_pwm_duty[0] >= 0)
		motor_1.motor_run(&motor_1, positive, fabsf(motor_pwm_duty[0]));
	else 
		motor_1.motor_run(&motor_1, negative, fabsf(motor_pwm_duty[0]));
	/* 电机2 */
	if(motor_pwm_duty[1] >= 0)
		motor_2.motor_run(&motor_2, positive, fabsf(motor_pwm_duty[1]));
	else 
		motor_2.motor_run(&motor_2, negative, fabsf(motor_pwm_duty[1]));
	/* 电机3 */
	if(motor_pwm_duty[2] >= 0)
		motor_3.motor_run(&motor_3, positive, fabsf(motor_pwm_duty[2]));
	else 
		motor_3.motor_run(&motor_3, negative, fabsf(motor_pwm_duty[2]));
}

/* 方向环PID计算 */
void path_pid_calc(void){
	float err[2] = { path_err, imu660ra.gyro_z };
	float err_gyro[2] = {  imu660ra.gyro_z , path_err,};

	// 循迹PID
	float path_Kp[4] = { PATH_PID[0][0], PATH_PID[1][0], PATH_PID[2][0], PATH_PID[3][0] };
	float path_Ki[4] = { PATH_PID[0][1], PATH_PID[1][1], PATH_PID[2][1], PATH_PID[3][1] };
	float path_Kd[4] = { PATH_PID[0][2], PATH_PID[1][2], PATH_PID[2][2], PATH_PID[3][2] };
	float path_i_limit[4] = { PATH_PID[0][3], PATH_PID[1][3], PATH_PID[2][3], PATH_PID[3][3] };
	float path_output_limit[4] = { PATH_PID[0][4], PATH_PID[1][4], PATH_PID[2][4], PATH_PID[3][4] };
	// 角速度PID
	float path_gyroz_Kp[4] = { 0, 0, 0, 0 };
	float path_gyroz_Ki[4] = { 0, 0, 0, 0 };
	float path_gyroz_Kd[4] = { PATH_PID[0][5], PATH_PID[1][5], PATH_PID[2][5], PATH_PID[3][5] };
	float path_gyroz_i_limit[4] = { 0, 0, 0, 0 };
	float path_gyroz_output_limit[4] = { 0, 0, 0, 0 };
	
	path_pid.fuzzy_pid(&path_pid, err, path_Kp, path_Ki, path_Kd, path_i_limit, path_output_limit, 2);
	path_gyroz_pid.fuzzy_pid(&path_gyroz_pid, err_gyro, path_gyroz_Kp, path_gyroz_Ki, path_gyroz_Kd, path_gyroz_i_limit, path_gyroz_output_limit, 1);

	move_solve_kind = XY_SPEED_SOLVE;
	control_kind = Inv2Speed;
	angular_speed_target = path_pid.positional_pid(&path_pid, 0, -path_err)-path_gyroz_pid.Kd*imu660ra.gyro_z;	// 此处需注意gyro_z极性
}

/* 电机PID计算 */
static void motor_pid_calc(void){
	// 速度环
	#ifdef SPEED
	/* 电机1 */
	motor_1_pid.Kp = MOTOR_1_PID[0];
	motor_1_pid.Ki = MOTOR_1_PID[1];
	motor_1_pid.Kd = MOTOR_1_PID[2];
	motor_1_pid.i_limit = MOTOR_1_PID[3];
	motor_1_pid.output_limit = MOTOR_1_PID[4];
	motor_pwm_duty[0] = motor_1_pid.incremental_pid(&motor_1_pid, wheel_speed_target[0], encoder_1.wheel_speed);
	/* 电机2 */
	motor_2_pid.Kp = MOTOR_2_PID[0];
	motor_2_pid.Ki = MOTOR_2_PID[1];
	motor_2_pid.Kd = MOTOR_2_PID[2];
	motor_2_pid.i_limit = MOTOR_2_PID[3];
	motor_2_pid.output_limit = MOTOR_2_PID[4];
	motor_pwm_duty[1] = motor_2_pid.incremental_pid(&motor_2_pid, wheel_speed_target[1], encoder_2.wheel_speed);
	/* 电机3 */
	motor_3_pid.Kp = MOTOR_3_PID[0];
	motor_3_pid.Ki = MOTOR_3_PID[1];
	motor_3_pid.Kd = MOTOR_3_PID[2];
	motor_3_pid.i_limit = MOTOR_3_PID[3];
	motor_3_pid.output_limit = MOTOR_3_PID[4];
	motor_pwm_duty[2] = motor_3_pid.incremental_pid(&motor_3_pid, wheel_speed_target[2], encoder_3.wheel_speed);
	#endif
	// 速度环+电流环
	#ifdef SPEED_AND_CURRENT
	/* 电机1 */
	motor_1_pid.Kp = MOTOR_1_PID[0];
	motor_1_pid.Ki = MOTOR_1_PID[1];
	motor_1_pid.Kd = MOTOR_1_PID[2];
	motor_1_pid.i_limit = MOTOR_1_PID[3];
	motor_1_pid.output_limit = MOTOR_1_PID[4];
	motor_current_target[0] = motor_1_pid.incremental_pid(&motor_1_pid, wheel_speed_target[0], encoder_1.wheel_speed);
	current_1_pid.Kp = I_1_PID[0];
	current_1_pid.Ki = I_1_PID[1];
	current_1_pid.Kd = I_1_PID[2];
	current_1_pid.i_limit = I_1_PID[3];
	current_1_pid.output_limit = I_1_PID[4];
	motor_pwm_duty[0] = current_1_pid.incremental_pid(&current_1_pid, motor_current_target[0], current_1.current);
	/* 电机2 */
	motor_2_pid.Kp = MOTOR_2_PID[0];
	motor_2_pid.Ki = MOTOR_2_PID[1];
	motor_2_pid.Kd = MOTOR_2_PID[2];
	motor_2_pid.i_limit = MOTOR_2_PID[3];
	motor_2_pid.output_limit = MOTOR_2_PID[4];
	motor_current_target[1] = motor_2_pid.incremental_pid(&motor_2_pid, wheel_speed_target[1], encoder_2.wheel_speed);
	current_2_pid.Kp = I_2_PID[0];
	current_2_pid.Ki = I_2_PID[1];
	current_2_pid.Kd = I_2_PID[2];
	current_2_pid.i_limit = I_2_PID[3];
	current_2_pid.output_limit = I_2_PID[4];
	motor_pwm_duty[1] = current_1_pid.incremental_pid(&current_2_pid, motor_current_target[1], current_2.current);
	/* 电机3 */
	motor_3_pid.Kp = MOTOR_3_PID[0];
	motor_3_pid.Ki = MOTOR_3_PID[1];
	motor_3_pid.Kd = MOTOR_3_PID[2];
	motor_3_pid.i_limit = MOTOR_3_PID[3];
	motor_3_pid.output_limit = MOTOR_3_PID[4];
	motor_current_target[2] = motor_3_pid.incremental_pid(&motor_3_pid, wheel_speed_target[2], encoder_3.wheel_speed);
	current_3_pid.Kp = I_3_PID[0];
	current_3_pid.Ki = I_3_PID[1];
	current_3_pid.Kd = I_3_PID[2];
	current_3_pid.i_limit = I_3_PID[3];
	current_3_pid.output_limit = I_3_PID[4];
	motor_pwm_duty[2] = current_1_pid.incremental_pid(&current_3_pid, motor_current_target[2], current_3.current);
	#endif


}

/* 角度环PID计算 */
static void rotate_pid_calc(void){
	static uint8 chassis_rotate_finsh_num_count = 0;
	
	float err = rotation_yaw_target-rotate_euler_angle_solve.yaw;
	float Kp[4] = { ROTATE_PID[0][0], ROTATE_PID[1][0], ROTATE_PID[2][0], ROTATE_PID[3][0] };
	float Ki[4] = { ROTATE_PID[0][1], ROTATE_PID[1][1], ROTATE_PID[2][1], ROTATE_PID[3][1] };
	float Kd[4] = { ROTATE_PID[0][2], ROTATE_PID[1][2], ROTATE_PID[2][2], ROTATE_PID[3][2] };
	float i_limit[4] = { ROTATE_PID[0][3], ROTATE_PID[1][3], ROTATE_PID[2][3], ROTATE_PID[3][3] };
	float output_limit[4] = { ROTATE_PID[0][4], ROTATE_PID[1][4], ROTATE_PID[2][4], ROTATE_PID[3][4] };
	
	rotate_pid.fuzzy_pid(&rotate_pid, &rotate_euler_angle_solve.yaw, Kp, Ki, Kd, i_limit, output_limit, 1);
	
	angular_speed_target = rotate_pid.positional_pid(&rotate_pid, rotation_yaw_target, rotate_euler_angle_solve.yaw);

	if(abs(err) < 4.5)
		chassis_rotate_finsh_num_count++;
	if(chassis_rotate_finsh_num_count >= 5){
		rotate_finsh_flag = True;
		chassis_rotate_finsh_num_count = 0;
	}		
}

/* BOX X PID计算 */
static void box_x_pid_calu(void){
	static uint16 num = 0;	// 符合偏移阈值的图像次数
	
	float detection_box_center_err = detection_box_center_x-AI_CAMERA_0_IMAGE_WIDTH/2; 
	move_solve_kind = XY_SPEED_SOLVE;
	
	/* BOX X */
	float X_Kp[4] = { BOX_X_PID[0][0], BOX_X_PID[1][0], BOX_X_PID[2][0], BOX_X_PID[3][0] };
	float X_Ki[4] = { BOX_X_PID[0][1], BOX_X_PID[1][1], BOX_X_PID[2][1], BOX_X_PID[3][1] };
	float X_Kd[4] = { BOX_X_PID[0][2], BOX_X_PID[1][2], BOX_X_PID[2][2], BOX_X_PID[3][2] };
	float X_i_limit[4] = { BOX_X_PID[0][3], BOX_X_PID[1][3], BOX_X_PID[2][3], BOX_X_PID[3][3] };
	float X_output_limit[4] = { BOX_X_PID[0][4], BOX_X_PID[1][4], BOX_X_PID[2][4], BOX_X_PID[3][4] };

	box_x_pid.fuzzy_pid(&box_x_pid, &detection_box_center_err, X_Kp, X_Ki, X_Kd, X_i_limit, X_output_limit, 1);
	x_speed_target = box_x_pid.positional_pid(&box_x_pid, 0, -detection_box_center_err);
	
	// 追踪到阈值周围
	if(abs(detection_box_center_err) <= 6)
	{
		num++;
	}
	// 追踪到阈值内
	if(abs(detection_box_center_err) <= 4)
	{
		x_speed_target = 0;
		num = 0;
		box_X_finsh_flag = True;
	}
	// 追踪到阈值周围，由于摩擦力等使车无法移动，超过判定次数
	if(num > 5)
	{
		x_speed_target = 0;
		num = 0;
		box_X_finsh_flag = True;
	}
}

/* BOX Y PID计算 */
static void box_y_pid_calu(void){
	static uint16 num = 0;	// 符合偏移阈值的图像次数
	
	float detection_box_width_err = detection_box_width-detection_box_width_target;	
	move_solve_kind = XY_SPEED_SOLVE;
	
	/* BOX Y */
	float Y_Kp[4] = { BOX_Y_PID[0][0], BOX_Y_PID[1][0], BOX_Y_PID[2][0], BOX_Y_PID[3][0] };
	float Y_Ki[4] = { BOX_Y_PID[0][1], BOX_Y_PID[1][1], BOX_Y_PID[2][1], BOX_Y_PID[3][1] };
	float Y_Kd[4] = { BOX_Y_PID[0][2], BOX_Y_PID[1][2], BOX_Y_PID[2][2], BOX_Y_PID[3][2] };
	float Y_i_limit[4] = { BOX_Y_PID[0][3], BOX_Y_PID[1][3], BOX_Y_PID[2][3], BOX_Y_PID[3][3] };
	float Y_output_limit[4] = { BOX_Y_PID[0][4], BOX_Y_PID[1][4], BOX_Y_PID[2][4], BOX_Y_PID[3][4] };

	box_y_pid.fuzzy_pid(&box_y_pid, &detection_box_width_err, Y_Kp, Y_Ki, Y_Kd, Y_i_limit, Y_output_limit, 1);
	y_speed_target = box_y_pid.positional_pid(&box_y_pid, detection_box_width_target, detection_box_width);
	
	// 追踪到阈值周围
	if(abs(detection_box_width_err) <= 6)
	{
		num++;
	}
	// 追踪到阈值内
	if(abs(detection_box_width_err) <= 4)
	{
		x_speed_target = 0;
		num = 0;
		box_Y_finsh_flag = True;
	}
	// 追踪到阈值周围，由于摩擦力等使车无法移动，超过判定次数
	if(num > 5)
	{
		x_speed_target = 0;
		num = 0;
		box_X_finsh_flag = True;
	}
}

/* BOX X/Y PID计算 */
static void box_xy_pid_calu(void){
	static uint16 num = 0;	// 符合偏移阈值的图像次数
	
	float detection_box_center_err = detection_box_center_x-AI_CAMERA_0_IMAGE_WIDTH/2; 
	float detection_box_width_err = detection_box_width-detection_box_width_target;
	move_solve_kind = XY_SPEED_SOLVE;
	
	/* BOX X */
	float X_Kp[4] = { BOX_X_PID[0][0], BOX_X_PID[1][0], BOX_X_PID[2][0], BOX_X_PID[3][0] };
	float X_Ki[4] = { BOX_X_PID[0][1], BOX_X_PID[1][1], BOX_X_PID[2][1], BOX_X_PID[3][1] };
	float X_Kd[4] = { BOX_X_PID[0][2], BOX_X_PID[1][2], BOX_X_PID[2][2], BOX_X_PID[3][2] };
	float X_i_limit[4] = { BOX_X_PID[0][3], BOX_X_PID[1][3], BOX_X_PID[2][3], BOX_X_PID[3][3] };
	float X_output_limit[4] = { BOX_X_PID[0][4], BOX_X_PID[1][4], BOX_X_PID[2][4], BOX_X_PID[3][4] };
	/* BOX Y */
	float Y_Kp[4] = { BOX_Y_PID[0][0], BOX_Y_PID[1][0], BOX_Y_PID[2][0], BOX_Y_PID[3][0] };
	float Y_Ki[4] = { BOX_Y_PID[0][1], BOX_Y_PID[1][1], BOX_Y_PID[2][1], BOX_Y_PID[3][1] };
	float Y_Kd[4] = { BOX_Y_PID[0][2], BOX_Y_PID[1][2], BOX_Y_PID[2][2], BOX_Y_PID[3][2] };
	float Y_i_limit[4] = { BOX_Y_PID[0][3], BOX_Y_PID[1][3], BOX_Y_PID[2][3], BOX_Y_PID[3][3] };
	float Y_output_limit[4] = { BOX_Y_PID[0][4], BOX_Y_PID[1][4], BOX_Y_PID[2][4], BOX_Y_PID[3][4] };

	box_x_pid.fuzzy_pid(&box_x_pid, &detection_box_center_err, X_Kp, X_Ki, X_Kd, X_i_limit, X_output_limit, 1);
	x_speed_target = box_x_pid.positional_pid(&box_x_pid, 0, -detection_box_center_err);
	box_y_pid.fuzzy_pid(&box_y_pid, &detection_box_width_err, Y_Kp, Y_Ki, Y_Kd, Y_i_limit, Y_output_limit, 1);
	y_speed_target = box_y_pid.positional_pid(&box_y_pid, detection_box_width_target, detection_box_width);
//	if(x_speed_target/x_speed_rate >= 6)
//		angular_speed_target = 6;
//	else
//		angular_speed_target = x_speed_target/x_speed_rate;
	
	// 追踪到阈值周围
	if(abs(detection_box_width_err) <= 6 && abs(detection_box_center_err) <= 6)
		num++;
	// 不在阈值范围内清零
	if(abs(detection_box_width_err) > 6 && abs(detection_box_center_err) > 6)
		num = 0;
	// 追踪到阈值内
	if(abs(detection_box_width_err) <= 4 && abs(detection_box_center_err) <= 4)
	{
		x_speed_target = 0;
		y_speed_target = 0;
		num = 0;
		box_XY_finsh_flag = True;
	}
	// 追踪到阈值周围，由于摩擦力等使车无法移动，超过判定次数
	if(num > 5)
	{
		x_speed_target = 0;
		y_speed_target = 0;
		num = 0;
		box_XY_finsh_flag = True;
	}
}

