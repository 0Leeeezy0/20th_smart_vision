#ifndef _COMMON_H_
#define _COMMON_H_

/****************************** 硬件参数 ******************************/

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

/* 按键引脚 */
#define UP_PIN C15
#define DOWN_PIN C14
#define LEFT_PIN C13
#define RIGHT_PIN C12
#define PRESS_PIN 

/* 底盘参数*/
#define GEAR_RATIO (float)(4.4*26/36)	// 齿轮比（ 编码器转速/电机输出侧转速 ）
#define GYRO_Z_FORWARD 1	// 陀螺仪Z轴方向（ 向上：1 向下：-1 ）
#define ACC_OFFSET 0	// 加速度计正方向角度修正

/* 屏幕类型 */
#define SCREEN_KIND 0	// 屏幕选择（ 0:tft180 1:ips200 ）

/*********************************************************************/

/****************************** 中断参数 ******************************/

#define SENSOR_IT_CH PIT_CH0 	// 传感器值获取中断号
#define SENSOR_IT_TIME 1 // 传感器值获取中断周期 ms
#define CONTROL_IT_CH PIT_CH1	// 控制中断号
#define CONTROL_IT_TIME 20 // 控制中断周期 ms
#define AI_CAMERA_READ_IT_CH PIT_CH2	// AI摄像头读取中断号
#define AI_CAMERA_READ_IT_TIME	10 // AI摄像头读取中断周期 ms
#define MENU_KEY_SCAN_IT_CH PIT_CH3	// 按键扫描中断号
#define MENU_KEY_SCAN_IT_TIME	20 // 按键扫描中断周期 ms

/*********************************************************************/

/****************************** 命令行参数 ******************************/

#define DEBUG_CLI_WELCOME "POWERED BY:YJC SJC LZY"	// 命令行欢迎语
#define DEBUG_CLI_NAME "SMART_CAR"	// 命令行名称
#define DEBUG_CLI_CONNECT_CHAR "$ "	// 命令行名称命令连接符

#define CLI_LOCAL_ECHO_EN 1	// 命令行回显（1:打开）CLI_DELETE_EN
#define CLI_DELETE_EN 1	// 命令行删除（1:打开）

/* 最大串口数据长度 */
#ifndef MAX_UART_DATA_LEN
#define MAX_UART_DATA_LEN 50
#endif

/***********************************************************************/

/****************************** 菜单参数 ******************************/

#define MENU_ROW_PITCH 20	// 菜单行间距
#define MAX_ROW 8	// 最大行数

/***********************************************************************/

/****************************** 数学参数 ******************************/

#define SIN30 (float)0.5
#define SIN45 (float)0.7071067811865
#define SIN60 (float)0.8660254037844
#define COS30 (float)0.8660254037844
#define COS45 (float)0.7071067811865
#define COS60 (float)0.5
#define DEG2RAD(x) (float)(PI*x/180)
#define RAD2DEG(x) (float)(180*x/PI)
#define ROUND(x,y) ((x-(x%y))/y)
	
/*********************************************************************/

/****************************** 预定义 ******************************/

#define TRUE 1
#define FALSE 0

/********************************************************************/

/****************************** 图像处理 ******************************/

#define THRESHOLD_SAMPLING_DISTANCE 10	// 二值化采样间隔

/**********************************************************************/

/****************************** PID ******************************/

#define CHASSIS_PID_CHOOSE 1	// 底盘PID类型（ 增量式：0  位置式：1 ）
#define PATH_PID_CHOOSE 0	// 循迹PID类型（ 增量式：0  位置式：1 ）

/*****************************************************************/

/****************************** 传感器参数 ******************************/

#define GYRO_ACC_CALIBRATION_EPOCH (float)(200)	// 陀螺仪加速度计校准采样轮次
#define GYRO_ACC_GATA_LIMIT 0.005	// 陀螺仪加速度计门函数限制

/***********************************************************************/

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
#include "vofa_debug.h"
#include "vofa_debug_app.h"
#include "menu.h"
#include "menu_data.h"

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