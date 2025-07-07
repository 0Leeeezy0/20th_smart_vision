#ifndef _CONTROL_H_
#define _CONTROL_H_

/* 
	角度环->运动学逆解算->速度环 控制 
	控制类型：Angle2Inv2Speed
	运动学解算类型：SPEED_YAW_SOLVE/XY_SPEED_SOLVE
	控制参数：目标角度：rotation_yaw_target
			 1.目标线速度：linear_speed_target、目标平动航向角：translation_yaw_target
			 2.目标X速度：x_speed_target、目标Y速度：y_speed_target
	使用前要先将rotate_finsh_flag置False
*/
void Angle2Inv2Speed_control(void);

/* 
	箱子X->运动学逆解算->速度环 控制 
	控制类型：X2Inv2Speed
	运动学解算类型：XY_SPEED_SOLVE（默认）
	控制参数：目标Y速度：y_speed_target、识别框中心X坐标：detection_box_center_x
	使用前要先将box_X_finsh_flag置False
*/
void X2Inv2Speed_control(void);

/* 
	箱子XY->运动学逆解算->速度环 控制 
	控制类型：XY2Inv2Speed
	运动学解算类型：XY_SPEED_SOLVE（默认）
	控制参数：识别框中心X坐标：detection_box_center_x、识别框宽度：detection_box_width
	使用前要先将box_XY_finsh_flag置False
*/
void XY2Inv2Speed_control(void);

/* 
	运动学逆解算->速度环 控制 
	控制类型：Inv2Speed
	运动学解算类型：SPEED_YAW_SOLVE/XY_SPEED_SOLVE
	控制参数：目标角度：rotation_yaw_target
			 1.目标线速度：linear_speed_target、目标平动航向角：translation_yaw_target
			 2.目标X速度：x_speed_target、目标Y速度：y_speed_target
*/
void Inv2Speed_control(void);

/* 
	纯速度环 控制 
	控制类型：Speed
	控制参数：三个轮子的目标转速：wheel_speed_target[0]、wheel_speed_target[1]、wheel_speed_target[2]
*/
void Speed_control(void);

/* 
	纯PWM 控制 
	控制类型：PWM
	控制参数：三个轮子的目标转速：motor_pwm_duty[0]、motor_pwm_duty[1]、motor_pwm_duty[2]
*/
void PWM_control(void);

/* 
	方向环PID 计算
	运动学解算类型：XY_SPEED_SOLVE（默认）
	控制参数：目标Y速度：y_speed_target
*/
void path_pid_calc(void);

/* 电机PID计算 */
static void motor_pid_calc(void);

/* 角度环PID计算 */
static void rotate_pid_calc(void);

/* BOX X PID计算 */
static void box_x_pid_calu(void);

/* BOX X/Y PID计算 */
static void box_xy_pid_calu(void);



#endif