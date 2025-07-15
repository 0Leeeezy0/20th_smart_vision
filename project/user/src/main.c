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
	
	/* 电机 */
	motor(&motor_1, MOTOR_1_DIR, MOTOR_1_PWM, 10000, MOTOR_1_FRONT_DIR);
	motor(&motor_2, MOTOR_2_DIR, MOTOR_2_PWM, 10000, MOTOR_2_FRONT_DIR);
	motor(&motor_3, MOTOR_3_DIR, MOTOR_3_PWM, 10000, MOTOR_3_FRONT_DIR);
	
	/* 编码器 */
	encoder(&encoder_1, ENCODER_1_MODULE_NUM, ENCODER_1_CH1, ENCODER_1_CH2, ENCODER_1_FRONT_DIR, 4096, SENSOR_SOLVE_IT_TIME, GEAR_RATIO, WHEEL_CIRCUMFERENCE);
	encoder(&encoder_2, ENCODER_2_MODULE_NUM, ENCODER_2_CH1, ENCODER_2_CH2, ENCODER_2_FRONT_DIR, 4096, SENSOR_SOLVE_IT_TIME, GEAR_RATIO, WHEEL_CIRCUMFERENCE);
	encoder(&encoder_3, ENCODER_3_MODULE_NUM, ENCODER_3_CH1, ENCODER_3_CH2, ENCODER_3_FRONT_DIR, 4096, SENSOR_SOLVE_IT_TIME, GEAR_RATIO, WHEEL_CIRCUMFERENCE);
	
	/* 电流采样 */
	current(&current_1, CURRENT_1_PIN, ADC_12BIT, CURRENT_RATIO, 500,CURRENT_1_FRONT_DIR);
	current(&current_2, CURRENT_2_PIN, ADC_12BIT, CURRENT_RATIO, 500,CURRENT_2_FRONT_DIR);
	current(&current_3, CURRENT_3_PIN, ADC_12BIT, CURRENT_RATIO, 500,CURRENT_1_FRONT_DIR);
	
	/* 灰度传感器 */
	voltage(&gray_sensor, GRAYSCALE_SENSOR_PIN, ADC_12BIT);
	
	/* 电池电压检测 */
	voltage(&bat_voltage, BAT_VOLTAGE_PIN, ADC_12BIT);
	
	/* 电流卡尔曼滤波 */
	karman(&current_1_karman, I_KARMAN[0], I_KARMAN[1]);
	karman(&current_2_karman, I_KARMAN[0], I_KARMAN[1]);
	karman(&current_3_karman, I_KARMAN[0], I_KARMAN[1]);
	
	/* AI CAMERA 0卡尔曼滤波 */
	karman(&box_center_x_karman, BOX_CENTER_X_KARMAN[0], BOX_CENTER_X_KARMAN[1]);
	karman(&box_width_karman, BOX_WIDTH_KARMAN[0], BOX_WIDTH_KARMAN[1]);
    
    /* 路径陀螺仪滤波 */
    karman(&path_gyro_karman, PATH_GYRO_KARMAN[0], PATH_GYRO_KARMAN[1]);
	
	/* VOFA */
	vofa(&wireless_vofa, WIRELESS_UART_INDEX, 115200, WIRELESS_UART_TX_PIN, WIRELESS_UART_RX_PIN);
	
	/* IMU */
	imu(&imu660ra, IMU_X_FRONT_DIR, IMU_Y_FRONT_DIR, IMU_Z_FRONT_DIR, 500);
	
	/* 计时器 */
	timer(&zebra_path_timer, 5);
    timer(&motor_debug_timer, 5);
	timer(&rwr_timer, 5);
	
	/* 欧拉角解算 */
	solve(&euler_angle_solve, RADIUS, SENSOR_SOLVE_IT_TIME);
	solve(&rotate_euler_angle_solve, RADIUS, SENSOR_SOLVE_IT_TIME);
	solve(&circle_euler_angle_solve, RADIUS, SENSOR_SOLVE_IT_TIME);
	solve(&box_euler_angle_solve, RADIUS, SENSOR_SOLVE_IT_TIME);
	
	/* 底盘解算 */
	solve(&chassis_solve, RADIUS, SENSOR_SOLVE_IT_TIME);
	
	/* 位移解算 */
	solve(&displacement_solve, RADIUS, SENSOR_SOLVE_IT_TIME);
	
	/* 视觉 */
	cv(&dog_cv);
	
	/* 路径 */
	path(&dog_path, path_start, path_end, side_extract_start_y, side_extract_end_y, prediction_point);
	
	/* RWR */
	rwr(&dog_rwr, BUZZER_PIN, &rwr_timer.time);
	
	/* PID */
	pid(&motor_1_pid);
	pid(&motor_2_pid);
	pid(&motor_3_pid);
	#ifdef FUZZY_SPEED_AND_CURRENT
	motor_1_pid.fuzzy_pid_init(&motor_1_pid, motor_fuzzy_rules, MOTOR_RANGE);
	motor_2_pid.fuzzy_pid_init(&motor_2_pid, motor_fuzzy_rules, MOTOR_RANGE);
	motor_3_pid.fuzzy_pid_init(&motor_3_pid, motor_fuzzy_rules, MOTOR_RANGE);
	#endif
	pid(&current_1_pid);
	pid(&current_2_pid);
	pid(&current_3_pid);
	pid(&path_pid);
	path_pid.fuzzy_pid_init(&path_pid, path_fuzzy_rules, PATH_RANGE);
	pid(&path_gyroz_pid);
	path_gyroz_pid.fuzzy_pid_init(&path_gyroz_pid, gyro_fuzzy_rules, GYRO_RANGE);
	pid(&angle_rotate_pid);
	angle_rotate_pid.fuzzy_pid_init(&angle_rotate_pid, angle_rotate_fuzzy_rules, ROTATE_RANGE);
	pid(&circle_rotate_pid);
	circle_rotate_pid.fuzzy_pid_init(&circle_rotate_pid, circle_rotate_fuzzy_rules, ROTATE_RANGE);
	pid(&box_x_pid);
	box_x_pid.fuzzy_pid_init(&box_x_pid, xy_fuzzy_rules, BOX_X_RANGE);
	pid(&box_y_pid);
	box_y_pid.fuzzy_pid_init(&box_y_pid, xy_fuzzy_rules, BOX_Y_RANGE);
	
	/* 箱子矫正 */
	symmetry_rectificate_init();
	
	/* 按键 */
	key_init(10);
	
	// 传感器/解算中断初始化
	pit_ms_init (SENSOR_SOLVE_IT_CH, SENSOR_SOLVE_IT_TIME);
	// 控制中断初始化
	pit_ms_init (CONTROL_IT_CH, CONTROL_IT_TIME);
	/* 计时器中断初始化 */
	pit_ms_init (TIMER_IT_CH, TIMER_IT_TIME);
	/* 按键中断初始化 */
	pit_ms_init (MENU_KEY_SCAN_IT_CH, MENU_KEY_SCAN_IT_TIME);
	// 中断使能
	pit_enable(SENSOR_SOLVE_IT_CH);
	pit_enable(CONTROL_IT_CH);
	pit_enable(TIMER_IT_CH);
	pit_enable(MENU_KEY_SCAN_IT_CH);
	
	/* AI摄像头（必须放到中断使能后） */
	ai_camera_init();
	
	/* 菜单 */
	menu_init();
	
	circle_enable_flag = True;			// 圆环 使能标志位
	zebra_enable_flag = True;			// 斑马线 使能标志位
	ai_camera_0_enable_flag = True;		// AI相机0 使能标志位
	ai_camera_1_enable_flag = False;		// AI相机1 使能标志位
	ai_camera_2_enable_flag = False;		// AI相机2 使能标志位
	
	ai_camera_0_init_flag = False;
	detection_result.ai_camera_init_flag[0] = False;
	detection_result.ai_camera_init_flag[1] = False;
	if(ai_camera_0_enable_flag == False)
		ai_camera_0_init_flag = True;
	if(ai_camera_1_enable_flag == False)
		detection_result.ai_camera_init_flag[0] = True;
	if(ai_camera_2_enable_flag == False)
		detection_result.ai_camera_init_flag[1] = True;

    // 此处编写用户代码 例如外设初始化代码等
    while(1)
    {	
		// 此处编写需要循环执行的代码
		#ifdef SPEED
		if(imu660ra.gyro_calibration_flag == True && imu660ra.acc_calibration_flag == True && ai_camera_0_init_flag == True && detection_result.ai_camera_init_flag[0] == True && detection_result.ai_camera_init_flag[1] == True)
		{
		#else
		if(imu660ra.gyro_calibration_flag == True && imu660ra.acc_calibration_flag == True && current_1.current_calibration_flag == True && current_2.current_calibration_flag == True && current_3.current_calibration_flag == True && ai_camera_0_init_flag == True && detection_result.ai_camera_init_flag[0] == True && detection_result.ai_camera_init_flag[1] == True)
		{
		#endif
			// 此处编写需要循环执行的代码
			menu_service_start(); 
			
			// 定位
//			control_kind = XY2Inv2Speed;
//			wireless_vofa.justfloat_add(&wireless_vofa, 4, (float)detection_box_center_x, (float)detection_box_width, (float)box_center_x_karman.value, (float)box_width_karman.value);
//			wireless_vofa.justfloat_send(&wireless_vofa);
			
			// 角度环
//			control_kind = Angle2Inv2Speed;
//			rotate_euler_angle_solve.solve_flag = True;
//			wireless_vofa.justfloat_add(&wireless_vofa, 1, rotate_euler_angle_solve.yaw);
//			wireless_vofa.justfloat_send(&wireless_vofa);
		}
    }
	
	return 0;
}



