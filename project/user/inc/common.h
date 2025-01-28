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
如果给DIR脚为高电平时电机逆时针旋转，则标定值为1
如果给DIR脚为高电平时电机顺时针旋转，则标定值为-1
*/
#define MOTOR_1_FRONT_DIR -1
#define MOTOR_2_FRONT_DIR 1
#define MOTOR_3_FRONT_DIR -1

/* 循线 */
#define PATH_START 10	// 路径线寻找开始高度
#define PATH_END 70	// 路径线寻找结束高度
#define CONTROL_POINT 40	// 控制点高度
#define CONTROL_POINT_2_MODEL_DISTANCE 10	// 控制点到车模中心距离
#define PREDICTION_POINT 50	// 预测点高度：其横坐标将作为下一帧的搜线起点

/* 系统参数 */
#define SENSOR_IT_TIME 1 // 传感器器值获取中断周期 ms
#define CONTROL_IT_TIME 20 // 控制中断周期 ms
#define AI_CAMERA_READ_IT_TIME	10 // AI摄像头读取中断周期 ms
#define SENSOR_IT_CH PIT_CH0 	// 编码器值获取中断号
#define CONTROL_IT_CH PIT_CH1	// 控制中断号
#define AI_CAMERA_READ_IT_CH PIT_CH2	// AI摄像头读取中断号
#define GEAR_RATIO (float)(4.4*26/36)	// 齿轮比（编码器转速：电机输出侧转速）
#define DUTY_LIMIT 7000	// PID占空比限幅
#define PATH_ERR_LIMIT 0.8	// PID循迹误差限幅
#define THRESHOLD_SAMPLING_DISTANCE 10	// 二值化采样间隔
#define ACC_OFFSET 0	// 加速度计正方向角度修正
#define GYRO_ACC_CALIBRATION_EPOCH (float)(200)	// 陀螺仪加速度计校准采样轮次
#define GYRO_ACC_GATA_LIMIT 0.005	// 陀螺仪加速度计门函数限制
#define CHASSIS_PID_CHOOSE 1	// 底盘PID类型（ 增量式：0  位置式：1 ）
#define CHASSIS_PID_I 500	// 底盘PID位置式积分项限幅
#define PATH_PID_CHOOSE 0	// 循迹PID类型（ 增量式：0  位置式：1 ）
#define PATH_PID_I 0.1	// 循迹PID位置式积分项限幅

/* VOFA调试 */
#define DATA_CH_NUM_MAX 100 // 最大数据量（字节）

/* 固定公式 */
#define SIN30 (float)0.5
#define SIN45 (float)0.7071067811865
#define SIN60 (float)0.8660254037844
#define COS30 (float)0.8660254037844
#define COS45 (float)0.7071067811865
#define COS60 (float)0.5
#define DEG2RAD(x) (float)(PI*x/180)
#define RAD2DEG(x) (float)(180*x/PI)

/* C标准库 */
#include "math.h"

/* 逐飞库头文件 */
#include "zf_common_headfile.h"
#include "zf_common_debug.h"
#include "isr.h"

/* 用户头文件 */
#include "data.h"
#include "chassis_control.h"
#include "path_control.h"
#include "cv.h"
#include "uart.h"

/* PID选择 */
#if CHASSIS_PID_CHOOSE == 0
#define CHASSIS_PID_KIND incremental_pid
#elif CHASSIS_PID_CHOOSE == 1
#define CHASSIS_PID_KIND positional_pid
#endif

#if PATH_PID_CHOOSE == 0
#define PATH_PID_KIND incremental_pid
#elif PATH_PID_CHOOSE == 1
#define PATH_PID_KIND positional_pid
#endif

#endif