#ifndef _COMMON_H_
#define _COMMON_H_

/****************************** 硬件参数 ******************************/
/* 以下顺序都是摄像头支架后为1开始顺时针记数 */
/* 电机驱动引脚 */
#define MOTOR_1_DIR 	( C7 )
#define MOTOR_1_PWM 	( PWM2_MODULE0_CHA_C6 )

#define MOTOR_2_DIR 	( D2 )
#define MOTOR_2_PWM 	( PWM2_MODULE3_CHB_D3 ) 

#define MOTOR_3_DIR 	( C9 )
#define MOTOR_3_PWM 	( PWM2_MODULE1_CHA_C8 ) 

/* 编码器引脚 */
#define ENCODER_1_MODULE_NUM 	( QTIMER1_ENCODER2 )
#define ENCODER_1_CH1 			( QTIMER1_ENCODER2_CH1_C2 )
#define ENCODER_1_CH2 			( QTIMER1_ENCODER2_CH2_C24 )

#define ENCODER_2_MODULE_NUM 	( QTIMER1_ENCODER1 )
#define ENCODER_2_CH1 			( QTIMER1_ENCODER1_CH1_C0 )
#define ENCODER_2_CH2 			( QTIMER1_ENCODER1_CH2_C1 )

#define ENCODER_3_MODULE_NUM 	( QTIMER2_ENCODER1 )
#define ENCODER_3_CH1 			( QTIMER2_ENCODER1_CH1_C3 )
#define ENCODER_3_CH2 			( QTIMER2_ENCODER1_CH2_C4 )

/* 
电机方向标定
如果给DIR脚为高电平时电机顺时针旋转，则标定值为 True
如果给DIR脚为高电平时电机逆时针旋转，则标定值为 False
*/
#define MOTOR_1_FRONT_DIR 	( True )
#define MOTOR_2_FRONT_DIR 	( True )
#define MOTOR_3_FRONT_DIR 	( False )

/* 
电流方向标定
如果正占空时旋转时电流数值为正，则标定值为 True
如果正占空时时电流数值为负，则标定值为 False
*/
#define CURRENT_1_FRONT_DIR ( False )
#define CURRENT_2_FRONT_DIR ( True )
#define CURRENT_3_FRONT_DIR ( False )

/* 
编码器方向标定
如果电机逆时针旋转时编码器数值为正，则标定值为 True
如果电机逆时针旋转时编码器数值为负，则标定值为 False
*/
#define ENCODER_1_FRONT_DIR ( False )
#define ENCODER_2_FRONT_DIR ( False )
#define ENCODER_3_FRONT_DIR ( False )

/* 
陀螺仪方向标定
如果车右转时陀螺仪Z轴度数为正，则标定值为 True
如果车右转时陀螺仪Z轴度数为负，则标定值为 False
*/
#define IMU_X_FRONT_DIR ( False )
#define IMU_Y_FRONT_DIR ( False )
#define IMU_Z_FRONT_DIR ( False )

/* 按键引脚 */
#define UP_PIN 		( C13 )
#define DOWN_PIN 	( C15 )
#define LEFT_PIN 	( C12 )
#define RIGHT_PIN 	( C14 )
#define PRESS_PIN 	( C11 )

/* AI摄像头0 串口引脚 */
#define AI_CAMERA_0_UART_INDEX				( UART_4 )                              
#define AI_CAMERA_0_UART_BAUDRATE         	( 115200 )                            
#define AI_CAMERA_0_UART_TX_PIN           	( UART4_TX_C16 )                       
#define AI_CAMERA_0_UART_RX_PIN           	( UART4_RX_C17 ) 

#define AI_CAMERA_MERGE			// AI摄像头融合
/* AI摄像头1 串口引脚 */
#define AI_CAMERA_1_UART_INDEX			    ( UART_1 )                              
#define AI_CAMERA_1_UART_BAUDRATE           ( 115200 )                            
#define AI_CAMERA_1_UART_TX_PIN             ( UART1_TX_B12 )                       
#define AI_CAMERA_1_UART_RX_PIN             ( UART1_RX_B13 ) 
#ifndef AI_CAMERA_MERGE
/* AI摄像头2 串口引脚 */
#define AI_CAMERA_2_UART_INDEX			    ( UART_2 )                              
#define AI_CAMERA_2_UART_BAUDRATE           ( 115200 )                            
#define AI_CAMERA_2_UART_TX_PIN             ( UART2_TX_B18 )                       
#define AI_CAMERA_2_UART_RX_PIN             ( UART2_RX_B19 ) 
#endif

/* 底盘参数*/
#define ENCODER_LINE_NUM		(float)(4096)			// 编码器线数
#define GEAR_RATIO 				(float)(4.22)			// 齿轮比（ 编码器转速/电机输出侧转速 ）(4.22*1/1)
#define WHEEL_CIRCUMFERENCE 	(float)(18.6047584)		// 轮周长（cm）
#define RADIUS					(float)(9.5244294)		// 底盘中心到车轮距离（cm）
#define GYRO_Z_RATE				(float)()				// 

/* 蜂鸣器 */
#define BUZZER_PIN 		(PWM4_MODULE3_CHA_C31)

/* 灰度传感器 */
#define GRAYSCALE_SENSOR_PIN	(ADC1_CH5_B16)

/* 电压监测 */
#define BAT_VOLTAGE_PIN				(ADC1_CH4_B15)		// 电池电压监测引脚

/* 电流采样 */
#define CURRENT_1_PIN				(ADC1_CH10_B21)		// 电流采样1 引脚
#define CURRENT_2_PIN				(ADC1_CH3_B14)		// 电流采样2 引脚
#define CURRENT_3_PIN				(ADC1_CH12_B23)		// 电流采样3 引脚
#define CURRENT_RATIO				(float)(49.6485)		// 电压-电流换算系数（电压/电流） a=4096 / 3.3 * 20 * 0.002

/* 补光灯引脚 */
#define SUPPLEMENT_LAMP_EN_PIN				(B10)		// 补光灯PWM引脚
#define SUPPLEMENT_LAMP_DIN_PIN				(B9)		// 补光灯通信引脚

/*********************************************************************/

/****************************** 预定义参数 ******************************/

#define FUZZY_SPEED_AND_CURRENT      						// 电机控制类型（模糊速度环+电流环：FUZZY_SPEED_AND_CURRENT;速度环+电流环：SPEED_AND_CURRENT;速度环：SPEED）
#define BOX_NUM_MAX 50										// 箱子最大数量

/***********************************************************************/

/****************************** AI摄像头参数 ******************************/

#define AI_CAMERA_0_IMAGE_WIDTH		( 160 )			// AI摄像头0 图像宽度
#define AI_CAMERA_0_IMAGE_HIGHT		( 120 )			// AI摄像头0 图像高度
#define AI_CAMERA_0_OFFSET 			(  5 )			// AI摄像头0 图像偏移量
#define AI_CAMERA_0_IMAGE_RATE		(float)(  1  ) 	// AI摄像头0 图像与总钻风比例，用于自适应AI追踪

/**************************************************************************/

/****************************** 菜单参数 ******************************/

#define SCREEN_KIND 			(1)		// 屏幕选择（ 0:tft180 1:ips200 ）
#define MENU_ROW_PITCH 20	// 菜单行间距
#define MAX_ROW 16			// 最大行数
#define DATA_MAX_COL 150	// 数据最大列

/***********************************************************************/

/****************************** 中断参数 ******************************/

#define SENSOR_SOLVE_IT_CH 						( PIT_CH0 ) 			// 传感器值/解算获取中断号
#define SENSOR_SOLVE_IT_TIME 					( 5 ) 					// 传感器值/解算获取中断周期 ms
#define CONTROL_IT_CH 							( PIT_CH1 )				// 控制中断号
#define CONTROL_IT_TIME  						( 5 )					// 控制中断周期 ms
#define TIMER_IT_CH 							( PIT_CH2 )				// 计时器中断号
#define TIMER_IT_TIME							( 5 )					// 计时器中断周期 ms
#define MENU_KEY_SCAN_IT_CH 					( PIT_CH3 )				// 按键扫描中断号
#define MENU_KEY_SCAN_IT_TIME					( 40 )  				// 按键扫描中断周期 ms
#define AI_CAMERA_0_UART_PRIORITY     			( LPUART4_IRQn )  		// AI摄像头0 串口接收中断号
#define AI_CAMERA_1_UART_PRIORITY     			( LPUART1_IRQn )  		// AI摄像头1 串口接收中断号
#define AI_CAMERA_2_UART_PRIORITY     			( LPUART2_IRQn )  		// AI摄像头1 串口接收中断号

/*********************************************************************/

/* C标准库 */
#include "math.h"

/* 逐飞库头文件 */
#include "zf_common_headfile.h"
#include "zf_common_debug.h"
#include "isr.h"

/* DOG库头文件 */
#include "DOG_motor.h"
#include "DOG_data.h"
#include "DOG_vofa.h"
#include "DOG_sensor.h"
#include "DOG_solve.h"
#include "DOG_cv.h"
#include "DOG_path.h"
#include "DOG_filter.h"
#include "DOG_pid.h"
#include "DOG_timer.h"
#include "DOG_rwr.h"
//#include "DOG_menu.h"

/* 用户头文件 */
#include "debug.h"
#include "menu.h"
#include "menu_data.h"
#include "ai.h"
#include "control.h"
#include "fsm.h"


#endif