#ifndef _COMMON_H_
#define _COMMON_H_

/* 以下顺序都是摄像头支架后为1开始顺时针记数 */
/* 电机驱动引脚 */
#define MOTOR_1_DIR D2
#define MOTOR_1_PWM PWM2_MODULE3_CHB_D3

#define MOTOR_2_DIR C9
#define MOTOR_2_PWM PWM2_MODULE1_CHA_C8

#define MOTOR_3_DIR C7
#define MOTOR_3_PWM PWM2_MODULE0_CHA_C6

/* 编码器引脚 */
#define ENCODER_1_MODULE_NUM QTIMER2_ENCODER1
#define ENCODER_1_CH1 QTIMER2_ENCODER1_CH1_C3
#define ENCODER_1_CH2 QTIMER2_ENCODER1_CH2_C4

#define ENCODER_2_MODULE_NUM QTIMER1_ENCODER2
#define ENCODER_2_CH1 QTIMER1_ENCODER2_CH1_C2
#define ENCODER_2_CH2 QTIMER1_ENCODER2_CH2_C24

#define ENCODER_3_MODULE_NUM QTIMER1_ENCODER1
#define ENCODER_3_CH1 QTIMER1_ENCODER1_CH1_C0
#define ENCODER_3_CH2 QTIMER1_ENCODER1_CH2_C1

/* 
电机方向标定
如果给DIR脚为高电平时电机逆时针旋转，则标定值为-1
如果给DIR脚为高电平时电机顺时针旋转，则标定值为1
*/
#define MOTOR_1_FRONT_DIR -1
#define MOTOR_2_FRONT_DIR 1
#define MOTOR_3_FRONT_DIR -1

/* 逐飞库头文件 */
#include "zf_common_headfile.h"

/* 用户头文件 */
#include "data.h"
#include "chassis_control.h"


#endif