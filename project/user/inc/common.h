#ifndef _COMMON_H_
#define _COMMON_H_

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
//#include "DOG_menu.h"

/* 用户头文件 */
#include "debug.h"
#include "menu.h"
#include "menu_data.h"
#include "ai.h"
#include "control.h"
#include "fsm.h"

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
<<<<<<< HEAD
#define MOTOR_1_FRONT_DIR 	( 1 )
#define MOTOR_2_FRONT_DIR 	( 1 )
#define MOTOR_3_FRONT_DIR 	( -1 )
=======
#define MOTOR_1_FRONT_DIR 	( True )
#define MOTOR_2_FRONT_DIR 	( True )
#define MOTOR_3_FRONT_DIR 	( False )

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
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

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

/* AI摄像头1 串口引脚 */
#define AI_CAMERA_1_UART_INDEX			    ( UART_1 )                              
#define AI_CAMERA_1_UART_BAUDRATE           ( 115200 )                            
#define AI_CAMERA_1_UART_TX_PIN             ( UART1_TX_B12 )                       
#define AI_CAMERA_1_UART_RX_PIN             ( UART1_RX_B13 ) 

<<<<<<< HEAD
/* AI摄像头1 串口引脚 */
=======
/* AI摄像头2 串口引脚 */
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c
#define AI_CAMERA_2_UART_INDEX			    ( UART_2 )                              
#define AI_CAMERA_2_UART_BAUDRATE           ( 115200 )                            
#define AI_CAMERA_2_UART_TX_PIN             ( UART2_TX_B18 )                       
#define AI_CAMERA_2_UART_RX_PIN             ( UART2_RX_B19 ) 

/* 底盘参数*/
<<<<<<< HEAD
#define GEAR_RATIO 		(float)(4.22)				// 齿轮比（ 编码器转速/电机输出侧转速 ）(4.22*1/1)
#define WHEEL_CIRCUMFERENCE 	(float)(17.90708)		// 轮周长
#define GYRO_Z_FORWARD 	( 1 )							// 陀螺仪Z轴方向（ 向上：1 向下：-1 ）
#define ACC_OFFSET 		( 0 )							// 加速度计正方向角度修正
#define TRANSLATE_SHIFT_REVISE	(float)(0.69565217391304347) 			// 平动位移解算修正

/* 屏幕类型 */
#define SCREEN_KIND 1	// 屏幕选择（ 0:tft180 1:ips200 ）
=======
#define ENCODER_LINE_NUM		(float)(4096)			// 编码器线数
#define GEAR_RATIO 				(float)(4.22)			// 齿轮比（ 编码器转速/电机输出侧转速 ）(4.22*1/1)
#define WHEEL_CIRCUMFERENCE 	(float)(18.6047584)		// 轮周长（cm）
#define RADIUS					(float)(10.0)			// 底盘中心到车轮距离（cm）
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

/* 蜂鸣器 */
#define BUZZER_PIN 		(PWM4_MODULE3_CHA_C31)

/* 灰度传感器 */
#define GRAYSCALE_SENSOR_PIN	(ADC1_CH5_B16)

/* 电压监测 */
#define BAT_VOLTAGE_PIN				(ADC1_CH4_B15)		// 电池电压监测引脚
<<<<<<< HEAD
#define BAT_VOLTAGE_CALIBRATION		(37.5)					// 电池电压标定参数
=======

/* 电流采样 */
#define CURRENT_1_PIN				(ADC1_CH10_B21)		// 电流采样1 引脚
#define CURRENT_2_PIN				(ADC1_CH3_B14)		// 电流采样2 引脚
#define CURRENT_3_PIN				(ADC1_CH12_B23)		// 电流采样3 引脚
#define CURRENT_RATIO				(float)(67584)		// 电压-电流换算系数（电压/电流）

/* 补光灯引脚 */
#define SUPPLEMENT_LAMP_EN_PIN				(B10)		// 补光灯PWM引脚
#define SUPPLEMENT_LAMP_DIN_PIN				(B9)		// 补光灯通信引脚
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

/*********************************************************************/

/****************************** 预定义参数 ******************************/
/***********************************************************************/

<<<<<<< HEAD
#define SENSOR_IT_CH 							( PIT_CH0 ) 			// 传感器值获取中断号
#define SENSOR_IT_TIME 							( 5 ) 					// 传感器值获取中断周期 ms
#define CONTROL_IT_CH 							( PIT_CH1 )				// 控制中断号
#define CONTROL_IT_TIME  						( 5 )					// 控制中断周期 ms
#define TIME_COUNT_IT_CH 						( PIT_CH2 )				// 计时中断号
#define TIME_COUNT_IT_TIME						( 1 )					// 计时中断周期 ms
#define MENU_KEY_SCAN_IT_CH 					( PIT_CH3 )				// 按键扫描中断号
#define MENU_KEY_SCAN_IT_TIME					( 20 )  				// 按键扫描中断周期 ms
#define AI_CAMERA_0_UART_PRIORITY     			( LPUART4_IRQn )  		// AI摄像头0 串口接收中断号
#define AI_CAMERA_1_UART_PRIORITY     			( LPUART1_IRQn )  		// AI摄像头1 串口接收中断号
#define AI_CAMERA_2_UART_PRIORITY     			( LPUART2_IRQn )  		// AI摄像头1 串口接收中断号
=======
#define SPEED      						// 电机控制类型（速度环+电流环：SPEED_AND_CURRENT;速度环：SPEED）
>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

/***********************************************************************/

/****************************** AI摄像头参数 ******************************/

#define AI_CAMERA_0_IMAGE_WIDTH		( 160 )			// AI摄像头0 图像宽度
#define AI_CAMERA_0_IMAGE_HIGHT		( 120 )			// AI摄像头0 图像高度
#define AI_CAMERA_0_OFFSET 			(  11 )			// AI摄像头0 图像偏移量
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
#define CONTROL_IT_TIME  						( 4 )					// 控制中断周期 ms
#define TIMER_IT_CH 							( PIT_CH2 )				// 计时器中断号
#define TIMER_IT_TIME							( 5 )					// 计时器中断周期 ms
#define MENU_KEY_SCAN_IT_CH 					( PIT_CH3 )				// 按键扫描中断号
#define MENU_KEY_SCAN_IT_TIME					( 20 )  				// 按键扫描中断周期 ms
#define AI_CAMERA_0_UART_PRIORITY     			( LPUART4_IRQn )  		// AI摄像头0 串口接收中断号
#define AI_CAMERA_1_UART_PRIORITY     			( LPUART1_IRQn )  		// AI摄像头1 串口接收中断号
#define AI_CAMERA_2_UART_PRIORITY     			( LPUART2_IRQn )  		// AI摄像头1 串口接收中断号

<<<<<<< HEAD
#define SIN30 			(float)(0.5)
#define SIN45 			(float)(0.7071067811865)
#define SIN60 			(float)(0.8660254037844)
#define COS30 			(float)(0.8660254037844)
#define COS45 			(float)(0.7071067811865)
#define COS60 			(float)(0.5)
#define DEG2RAD(x) 		(float)(PI*x/180)
#define RAD2DEG(x) 		(float)(180*x/PI)
#define ROUND(x,y) 		((x-(x%y))/y)	// 整除
	
/*********************************************************************/

/****************************** 预定义 ******************************/

#define TRUE 		(uint8)(1)
#define FALSE 		(uint8)(0)

/********************************************************************/

/****************************** 图像处理 ******************************/

#define THRESHOLD_SAMPLING_DISTANCE 	( 1 )	// 二值化采样间隔
#define PER_IMG     image_OTSU				// SimBinImage:用于透视变换的图像
#define image_unpivot   *PerImg_ip			// *PerImg_ip定义使用的图像，image_unpivot为用于巡线和识别的图像

/**********************************************************************/

/****************************** 赛道元素提取参数 ******************************/

#define TRACK_WIDTH 					( 10 )	// 赛道在前瞻点高度的宽度
#define POINT_DISTANCE 					( 10 )	// 拐点/弯点距离
#define BEND_POINT_ANGLE_MIN 			(double)( 0 )	// 弯点最小角度阈值
#define BEND_POINT_ANGLE_MAX 			(double)( 170 )	// 弯点最大角度阈值
#define SIDE_END 						( 130 ) // 边线提取截止横偏差

/**********************************************************************/


/****************************** PID ******************************/

#define MOTOR_PID_CHOOSE 			( 0 )			// 电机PID类型（ 增量式：0   位置式：1）
#define ROTATE_PID_CHOOSE 			( 1 )			// 转动PID类型（ 增量式：0	位置式：1）
#define TRANSLATE_PID_CHOOSE 		( 0 )			// 平动PID类型（ 增量式：0	位置式：1）
#define PATH_PID_CHOOSE 			( 1 )			// 循迹PID类型（ 增量式：0   位置式：1）

/*****************************************************************/

/****************************** 传感器参数 ******************************/

#define GYRO_ACC_CALIBRATION_EPOCH 	(float)(1000)	// 陀螺仪加速度计校准采样轮次
#define GYRO_ACC_GATA_LIMIT 		( 0.005 )					// 陀螺仪加速度计门函数限制

/***********************************************************************/   

/* C标准库 */
#include "math.h"

/* 逐飞库头文件 */
#include "zf_common_headfile.h"
#include "zf_common_debug.h"
#include "isr.h"

/* 用户头文件 */
#include "data.h"
#include "DOG_chassis.h"
#include "DOG_path.h"
#include "DOG_image.h"
#include "DOG_vofa.h"
#include "DOG_vofa_app.h"
#include "DOG_menu.h"
#include "DOG_menu_data.h"
#include "DOG_ai.h"
#include "DOG_fsm.h"
#include "DOG_pid.h"
#include "DOG_element.h"

/* PID选择 */
#if MOTOR_PID_CHOOSE == 0
#define MOTOR_PID_KIND incremental_pid
#elif MOTOR_PID_CHOOSE == 1
#define MOTOR_PID_KIND positional_pid
#endif

#if ROTATE_PID_CHOOSE == 0
#define ROTATE_PID_KIND incremental_pid
#elif ROTATE_PID_CHOOSE == 1
#define ROTATE_PID_KIND positional_pid
#endif

#if TRANSLATE_PID_CHOOSE == 0
#define TRANSLATE_PID_KIND incremental_pid
#elif TRANSLATE_PID_CHOOSE == 1
#define TRANSLATE_PID_KIND positional_pid
#endif

#if PATH_PID_CHOOSE == 0
#define PATH_PID_KIND incremental_pid
#elif PATH_PID_CHOOSE == 1
#define PATH_PID_KIND positional_pid
#endif
=======
/*********************************************************************/

>>>>>>> 7295a0a293e342ca2ba407fd0b968a2e6043c05c

#endif