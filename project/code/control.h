#ifndef _CONTROL_H_
#define _CONTROL_H_

/* 电机控制 */
void motor_control(void);

/* 电机PID计算 */
void motor_pid_calc(void);

/* 方向环PID计算 */
void path_pid_calc(void);

/* 角度环PID计算 */
void rotate_pid_calc(void);

/* BOX X/Y PID计算 */
void box_xy_pid_calu(void);

#endif