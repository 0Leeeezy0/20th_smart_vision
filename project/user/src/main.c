/*********************************************************************************************************************
* RT1064DVL6A Opensourec Library 即（RT1064DVL6A 开源库）是一个基于官方 SDK 接口的第三方开源库
* Copyright (c) 2022 SEEKFREE 逐飞科技
* 
* 本文件是 RT1064DVL6A 开源库的一部分
* 
* RT1064DVL6A 开源库 是免费软件
* 您可以根据自由软件基金会发布的 GPL（GNU General Public License，即 GNU通用公共许可证）的条款
* 即 GPL 的第3版（即 GPL3.0）或（您选择的）任何后来的版本，重新发布和/或修改它
* 
* 本开源库的发布是希望它能发挥作用，但并未对其作任何的保证
* 甚至没有隐含的适销性或适合特定用途的保证
* 更多细节请参见 GPL
* 
* 您应该在收到本开源库的同时收到一份 GPL 的副本
* 如果没有，请参阅<https://www.gnu.org/licenses/>
* 
* 额外注明：
* 本开源库使用 GPL3.0 开源许可证协议 以上许可申明为译文版本
* 许可申明英文版在 libraries/doc 文件夹下的 GPL3_permission_statement.txt 文件中
* 许可证副本在 libraries 文件夹下 即该文件夹下的 LICENSE 文件
* 欢迎各位使用并传播本程序 但修改内容时必须保留逐飞科技的版权声明（即本声明）
//* 
//* 文件名称          main
//* 公司名称          成都逐飞科技有限公司
//* 版本信息          查看 libraries/doc 文件夹内 version 文件 版本说明
//* 开发环境          IAR 8.32.4 or MDK 5.33
* 适用平台          RT1064DVL6A
* 店铺链接          https://seekfree.taobao.com/
* 
* 修改记录
* 日期              作者                备注
* 2022-09-21        SeekFree            first version
********************************************************************************************************************/



// 打开新的工程或者工程移动了位置务必执行以下操作
// 第一步 关闭上面所有打开的文件
// 第二步 project->clean  等待下方进度条走完

// 本例程是开源库移植用空工程
#include "common.h"
#include "data.h"

int main(void)
{
    clock_init(SYSTEM_CLOCK_600M);  // 不可删除
    debug_init();                   // 调试端口初始化

    // 此处编写用户代码 例如外设初始化代码等
	
	/* IMU */
	imu(&imu660ra, IMU_X_FRONT_DIR, IMU_Y_FRONT_DIR, IMU_Z_FRONT_DIR);
	
	/* 电机 */
	
	motor(&motor_1, MOTOR_1_DIR, MOTOR_1_PWM, 10000, True);
	motor(&motor_2, MOTOR_2_DIR, MOTOR_2_PWM, 10000, True);
	motor(&motor_3, MOTOR_3_DIR, MOTOR_3_PWM, 10000, True);
	
	/* 编码器 */
	encoder(&encoder_1, ENCODER_1_MODULE_NUM, ENCODER_1_CH1, ENCODER_1_CH2, ENCODER_1_FRONT_DIR, 4096, SENSOR_SOLVE_IT_TIME, GEAR_RATIO, WHEEL_CIRCUMFERENCE);
	encoder(&encoder_2, ENCODER_2_MODULE_NUM, ENCODER_2_CH1, ENCODER_2_CH2, ENCODER_2_FRONT_DIR, 4096, SENSOR_SOLVE_IT_TIME, GEAR_RATIO, WHEEL_CIRCUMFERENCE);
	encoder(&encoder_3, ENCODER_3_MODULE_NUM, ENCODER_3_CH1, ENCODER_3_CH2, ENCODER_3_FRONT_DIR, 4096, SENSOR_SOLVE_IT_TIME, GEAR_RATIO, WHEEL_CIRCUMFERENCE);
	
	/* VOFA */
	vofa(&wireless_vofa, WIRELESS_UART_INDEX, 115200, WIRELESS_UART_TX_PIN, WIRELESS_UART_RX_PIN);
	
	/* 欧拉角解算 */
	solve(&euler_angle_solve, SENSOR_SOLVE_IT_TIME);
	
	/* 底盘解算 */
	solve(&chassis_solve, SENSOR_SOLVE_IT_TIME);
	chassis_solve.solve_flag = True;
	
	/* 位移解算 */
	solve(&displacement_solve, SENSOR_SOLVE_IT_TIME);
	
	/* 视觉 */
	cv(&dog_cv);
	
	/* 路径 */
//	path(&dog_path, )
	
	ips200_init(IPS200_TYPE_SPI);
	
	system_delay_ms(1000);
	
	// 传感器/解算中断初始化
	pit_ms_init (SENSOR_SOLVE_IT_CH, SENSOR_SOLVE_IT_TIME);
	// 控制中断初始化
	pit_ms_init (CONTROL_IT_CH, CONTROL_IT_TIME);
	// 中断使能
	pit_enable(SENSOR_SOLVE_IT_CH);
	pit_enable(CONTROL_IT_CH);
	
    // 此处编写用户代码 例如外设初始化代码等
    while(1)
    {
        // 此处编写需要循环执行的代码
//		run(&motor_1, positive, 2000);
		euler_angle_solve.solve_flag = True;
		displacement_solve.solve_flag = True;
		
//		justfloat_add(&wireless_vofa, 2, imu660ra.gyro_z, euler_angle_solve.yaw);
//		justfloat_add(&wireless_vofa, 3, displacement_solve.wheel_1_displacement, displacement_solve.wheel_2_displacement, displacement_solve.wheel_3_displacement);
		justfloat_add(&wireless_vofa, 3, displacement_solve.world_x_displacement, displacement_solve.world_y_displacement, euler_angle_solve.yaw);
		wireless_vofa.justfloat_send(&wireless_vofa);
		
		dog_cv.threshold(&dog_cv, mt9v03x_image);
		ips200_show_gray_image(0, 0, dog_cv.image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		
		// 此处编写需要循环执行的代码
    }
	
	return 0;
}



