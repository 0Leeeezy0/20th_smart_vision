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
#include "DOG_motor.h"
#include "DOG_data.h"
#include "DOG_vofa.h"
#include "DOG_sensor.h"
#include "DOG_solve.h"
#include "DOG_cv.h"

int main(void)
{
    clock_init(SYSTEM_CLOCK_600M);  // 不可删除
    debug_init();                   // 调试端口初始化

    // 此处编写用户代码 例如外设初始化代码等
//	struct DOG_MOTOR motor_1;
//	dog_motor(&motor_1, C7, PWM2_MODULE0_CHA_C6, 10000, True);
	
	struct DOG_VOFA wireless_vofa;
	vofa(&wireless_vofa, WIRELESS_UART_INDEX, 115200, WIRELESS_UART_TX_PIN, WIRELESS_UART_RX_PIN);
	
	struct DOG_ENCODER encoder_1;
	encoder(&encoder_1, QTIMER1_ENCODER2, QTIMER1_ENCODER2_CH1_C2, QTIMER1_ENCODER2_CH2_C24, False, 4096, 5, 4.22, 17.90708);
	
	struct DOG_IMU imu660ra;
	imu(&imu660ra, False, False, False);
	
	struct DOG_SOLVE angle_solve;
	solve(&angle_solve, 10);
	
	struct DOG_CV dog_cv;
	cv(&dog_cv);
	
	ips200_init(IPS200_TYPE_SPI);
    // 此处编写用户代码 例如外设初始化代码等
    while(1)
    {
        // 此处编写需要循环执行的代码
//		run(&motor_1, positive, 2000);
		
		encoder_1.encoder_get(&encoder_1);
		imu660ra.gyro_get(&imu660ra);
		angle_solve.solve_flag = True;
		angle_solve.euler_angle(&angle_solve, &imu660ra);
		wireless_vofa.justfloat_add(&wireless_vofa, 4, (float)encoder_1.encoder_raw, encoder_1.encoder_rpm, encoder_1.motor_rpm, encoder_1.wheel_speed);
		justfloat_add(&wireless_vofa, 3, imu660ra.gyro_x, imu660ra.gyro_y, imu660ra.gyro_z);
		justfloat_add(&wireless_vofa, 3, angle_solve.roll, angle_solve.pitch, angle_solve.yaw);
		wireless_vofa.justfloat_send(&wireless_vofa);
		
		dog_cv.threshold(&dog_cv, mt9v03x_image);
		ips200_show_gray_image(0, 0, dog_cv.image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		
		// 此处编写需要循环执行的代码
    }
	
	return 0;
}



