/*
该文件用于菜单实现

API：
****菜单组件****
菜单初始化
菜单页面初始化
按键动作获取
返回按键显示
页面标题显示
菜单返回
菜单选项指针
菜单数据更改
根页面
***************

****菜单页面****
启动
保存参数
加载参数
命令行
菜单编码器页面
菜单电机页面
陀螺仪、加速度计页面
菜单底盘数据页面
菜单电机1 PID页面
菜单电机2 PID页面
菜单电机3 PID页面
菜单循迹 PID页面
****************

****菜单页面服务****
菜单电机1 PID页面服务
菜单电机2 PID页面服务
菜单电机3 PID页面服务
菜单循迹 PID页面服务
********************
*/
#include "menu.h"
#include "data.h"

/* 页面列表 */
static _MENU_PAGE_ menu_page[] = 
{
	/* 页面名称         标题使能     级别 序号    参数行数   页面函数指针 			        	*/
	{"ROOT"         	,False 		,0 	,0 		,22 	,menu_root_page						},
	{"START"        	,True 		,1 	,0 		,0 		,start								},
	{"DEBUG"        	,True 		,1 	,1 		,0 		,debug								},
	{"PLAN"				,True		,1	,2		,1		,plan								},
	{"SAVE"        		,True 		,1 	,3 		,0 		,save								},
	{"LOAD"				,True 		,1 	,4 		,0 		,load								},
	{"CALIBRATE"		,True 		,1 	,5 		,0 		,sensor_calibrate					},
	{"ENCODER"			,True 		,1 	,6 		,0 		,menu_encoder_page					},
	{"MOTOR"			,True 		,1 	,7 		,3		,menu_motor_page					},
	{"GYRO_ACC"			,True 		,1 	,8 		,0 		,menu_gyro_acc_page					},
	{"EULER_ANGLE"      ,True		,1	,9		,0		,menu_euler_angle_page				},
	{"TRANSLATE_SHIFT"	,True		,1	,10		,0		,menu_translate_shift_page			},
	{"RECTIFICATE"		,True		,1	,11		,0		,menu_symmetry_rectificate_page		},
	{"COMMON_CAMERA"	,True		,1	,12		,1		,menu_common_camera_page			},
	{"AI_CAMERA_0"		,True		,1	,13		,8		,menu_ai_camera_0_page				},
	{"AI_CAMERA_1&2"	,True		,1	,14		,3		,menu_ai_camera_1_and_2_page		},
	{"DETECTION_LIST"	,True		,1	,15		,0		,menu_detection_list				},
	{"PATH"				,True		,1	,16		,11		,menu_path_page						},
	{"CIRCLE_PATH"		,True		,1	,17		,10		,menu_circle_path_page				},
	{"MOTOR_1 PID"		,True 		,1 	,18 	,11 	,menu_motor_1_pid_page				},
	{"MOTOR_2 PID"		,True 		,1 	,19 	,11 	,menu_motor_2_pid_page				},
	{"MOTOR_3 PID"		,True 		,1 	,20 	,11 	,menu_motor_3_pid_page				},
	{"PATH PID"			,True 		,1 	,21 	,7 		,menu_path_pid_page					}
};

static int16 num = 0;	// 页面在列表中的序号
static int16 page_level = 0;	// 页面级别
static int16 page_num = 0;	// 页面序号
static int16 page_row_num = 0;	// 页面选项行数
static int16 last_page_level = 0;	// 上一个页面级别
static int16 last_page_num = 0;	// 上一个页面序号
static int16 point_row_num = 0;	// 页面指针指向行数

FUNC_STRING screen_string;
FUNC_INT screen_int;
FUNC_UINT screen_uint;
FUNC_FLOAT screen_float;
FUNC_IMAGE screen_image;
FUNC_CLEAR screen_clear;
FUNC_DRAW_LINE screen_draw_line;
FUNC_DRAW_POINT screen_draw_point;

/****************************** 菜单组件 ******************************/

/* 菜单初始化 */
void menu_init(void)
{
	menu_data_leeeezy_init();
	menu_data_yjc_init();
	
	switch(SCREEN_KIND)
	{
		case 0:{ screen_string = &(tft180_show_string); screen_int = &(tft180_show_int); screen_float = &(tft180_show_float); screen_clear = &(tft180_clear); screen_image = &(tft180_show_gray_image); screen_uint = &(tft180_show_uint); screen_draw_line = &(tft180_draw_line); screen_draw_point = &(tft180_draw_point); break; }
		case 1:{ screen_string = &(ips200_show_string); screen_int = &(ips200_show_int); screen_float = &(ips200_show_float); screen_clear = &(ips200_clear); screen_image = &(ips200_show_gray_image); screen_uint = &(ips200_show_uint); screen_draw_line = &(ips200_draw_line); screen_draw_point = &(ips200_draw_point); break; }
	}
	
	
	ips200_init(IPS200_TYPE_SPI);
	
}

/* 菜单页面初始化 */
void menu_page_init(FUNC_PAGE func_page)
{
	int16 i = 0;
	point_row_num = 0;
	screen_clear();
	for(i = 0;i < sizeof(menu_page)/sizeof(menu_page[0]);i++)
	{
		if(func_page == menu_page[i].func_page)
		{
			page_level = menu_page[i].page_level;
			page_num = menu_page[i].page_num;
			page_row_num = menu_page[i].page_row_num;
			num = i;
			
			break;
		}
	}
}

/* 菜单服务启动 */
void menu_service_start(void)
{
	screen_clear();
	screen_string(20,20,"POWERED BY:");
	screen_string(20,40,"YJC");
	screen_string(20,60,"SJC");
	screen_string(20,80,"LZY");
	screen_string(20,100,"CAMERA TEST");
	screen_image(20, 120, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
	system_delay_ms(500);
	if(key_get_state(PRESS) == KEY_LONG_PRESS)
		menu_changea_parameter_write();
	menu_changea_parameter_read();
	system_delay_ms(500);
	menu_root_page();
}

/* 按键动作获取 */
void key_action_get(void)
{
	key_scanner();
}

/* 页面标题显示 */
void menu_title_show(void)
{
	screen_string(0,0,menu_page[num].name);
	switch(SCREEN_KIND)
	{
		case 0:{ screen_string(50,0,"BAT:"); screen_float(80,0,37.27*bat_voltage.voltage,2,1); break; }
		case 1:{ screen_string(155,0,"BAT:"); screen_float(190,0,37.27*bat_voltage.voltage,2,1); break; }
	}
}

/* 菜单返回 */
void menu_back(FUNC_PAGE_BACK_SERVICE func_page_back_service)
{
	int16 i = 0;
	switch(SCREEN_KIND)
	{
		case 0:{ screen_string(0,140,"BACK"); break; }
		case 1:{ screen_string(0,300,"BACK"); break; }
	}
	// 返回判断
	if(key_get_state(PRESS) == KEY_SHORT_PRESS && page_level > 0 && point_row_num == menu_page[num].page_row_num)
	{
		key_clear_all_state();
		for(i = 0;i < sizeof(menu_page)/sizeof(menu_page[0]);i++)
		{
			if(menu_page[i].page_level == last_page_level && menu_page[i].page_num == last_page_num)
			{
				point_row_num = 0;
				if(func_page_back_service != NULL)
				{
					func_page_back_service();
				}
				menu_changea_parameter_write();
				system_delay_ms(100);
				menu_page[i].func_page();	
				break;
			}
		}
	}
}

/* 	菜单选项指针 */
void menu_point(void)
{
	// 获取状态
	if(key_get_state(UP) == KEY_SHORT_PRESS)	// 上键短按上移
	{
		point_row_num--;
		screen_clear();
		key_clear_all_state();
	}
	else if(key_get_state(DOWN) == KEY_SHORT_PRESS)	// 下键短按下移
	{
		point_row_num++;
		screen_clear();
		key_clear_all_state();
	}
	// 正常选项
	else if(key_get_state(PRESS) == KEY_SHORT_PRESS && point_row_num < menu_page[num].page_row_num)
	{
		int16 i = 0;
		screen_clear();
		key_clear_all_state();
		for(i = 0;i < sizeof(menu_page)/sizeof(menu_page[0]);i++)
		{
			if(menu_page[i].page_level == page_level+1 && menu_page[i].page_num == point_row_num)
			{
				// 更新索引
				last_page_level = page_level;
				last_page_num = page_num;
				system_delay_ms(100);
				menu_page[i].func_page();	
				break;
			}
		}	
	}
		
	// 如果显示标题则需要 point_row_num+1才能正确显示指针
	if(menu_page[num].title_show)
	{
		if(point_row_num < 0)
		{
			point_row_num = menu_page[num].page_row_num;
		}
		else if(point_row_num > menu_page[num].page_row_num)
		{
			point_row_num = 0;
		}
		switch(SCREEN_KIND)
		{
			case 0:{ if(point_row_num < menu_page[num].page_row_num){ screen_string(118,((point_row_num%(MAX_ROW-1)+1))*MENU_ROW_PITCH,"*"); }else{ screen_string(118,140,"*"); } break; }
			case 1:{ if(point_row_num < menu_page[num].page_row_num){ screen_string(230,((point_row_num%(MAX_ROW-1)+1))*MENU_ROW_PITCH,"*"); }else{ screen_string(230,300,"*"); } break; }
		}
	}
	else
	{
		if(point_row_num < 0)
		{
			point_row_num = menu_page[num].page_row_num-1;
		}
		else if(point_row_num > menu_page[num].page_row_num-1)
		{
			point_row_num = 0;
		}
		switch(SCREEN_KIND)
		{
			case 0:{ screen_string(118,(point_row_num%MAX_ROW)*MENU_ROW_PITCH,"*"); break; }
			case 1:{ screen_string(230,(point_row_num%MAX_ROW)*MENU_ROW_PITCH,"*"); break; }
		}
	}
}

/* 菜单数据更改服务 */
void menu_data_change(FUNC_PAGE_SERVICE func_service_add,FUNC_PAGE_SERVICE func_service_reduce)
{
	// 获取状态
	if(key_get_state(LEFT) == KEY_SHORT_PRESS)	// 左键短按左移
	{
		func_service_reduce();
		screen_clear();

		key_clear_all_state();
	}
	else if(key_get_state(RIGHT) == KEY_SHORT_PRESS)	// 右键短按右移
	{
		func_service_add();
		screen_clear();
		key_clear_all_state();
	}
	if(key_get_state(LEFT) == KEY_LONG_PRESS)	// 左键长按左移
	{
		func_service_reduce();
		screen_clear();
		key_clear_all_state();
	}
	else if(key_get_state(RIGHT) == KEY_LONG_PRESS)	// 右键长按右移
	{
		func_service_add();
		screen_clear();
		key_clear_all_state();
	}
}

/* 根页面 */
void menu_root_page(void)
{
	menu_page_init(menu_root_page);
	while(1)
	{
		menu_point();
		int16 i = 0;
		// 停车
		control_kind = Stop;
		
		// 标志位初始化
		flag_init();
		// 变量初始化
		variable_init();
		
		// 支持无限页数
		for(i = 0;i < sizeof(menu_page)/sizeof(menu_page[0]);i++)
		{
			if(menu_page[i].page_level == page_level+1 && menu_page[i].page_num >= MAX_ROW*ROUND(point_row_num,MAX_ROW) && menu_page[i].page_num < MAX_ROW*(ROUND(point_row_num,MAX_ROW)+1))
			{
				screen_string(0,(menu_page[i].page_num%MAX_ROW)*MENU_ROW_PITCH,menu_page[i].name);
			}
			if(menu_page[i].page_level > page_level+1)
			{
				break;
			}
		}
		vofa_debug();
	}
}

/**********************************************************************/

/****************************** 菜单页面 ******************************/
/* 启动 */
void start(void)
{
	menu_page_init(start);
	
	system_delay_ms(100);
	
	// 标志位初始化
	flag_init();
	// 变量初始化
	variable_init();
	// 清空识别结果列表
	detection_result_num = 0;
	memset(detection_result_list, 0, sizeof(detection_result_list));	// 识别结果列表
	
	system_delay_ms(100);
	
	// 标志位设置
	euler_angle_solve.solve_flag = True;
	rotate_euler_angle_solve.solve_flag = False;
	circle_euler_angle_solve.solve_flag = False;
	box_euler_angle_solve.solve_flag = False;
	chassis_solve.solve_flag = True;
	displacement_solve.solve_flag = True;
	zebra_path_timer.ticking_flag = False;
	rwr_timer.ticking_flag = True;
	box_XY_finsh_flag = False;
	angle_rotate_finsh_flag = False;
	circle_rotate_finsh_flag = False;
	rotate_euler_angle_solve.encoder_merge_enable_flag = True;
	circle_euler_angle_solve.encoder_merge_enable_flag = True;
	box_euler_angle_solve.encoder_merge_enable_flag = True;
	
	system_delay_ms(100);
		
	while(1)
	{
		menu_back(menu_start_page_back_service);
		menu_point();
		menu_title_show();
		fsm();
		vofa_debug();
	}
}

/* 调试 */
void debug(void)
{
	menu_page_init(debug);
	
	system_delay_ms(500);
	
	// 标志位初始化
	flag_init();
	// 变量初始化
	variable_init();
	// 清空识别结果列表
	detection_result_num = 0;
	memset(detection_result_list, 0, sizeof(detection_result_list));	// 识别结果列表
	
	system_delay_ms(200);
	
	// 标志位设置
	euler_angle_solve.solve_flag = True;
	rotate_euler_angle_solve.solve_flag = False;
	circle_euler_angle_solve.solve_flag = False;
	box_euler_angle_solve.solve_flag = False;
	chassis_solve.solve_flag = True;
	displacement_solve.solve_flag = True;
	circle_enable_flag = True;
	zebra_enable_flag = True;
	zebra_path_timer.ticking_flag = False;
	rwr_timer.ticking_flag = True;
	box_XY_finsh_flag = False;
	angle_rotate_finsh_flag = False;
	circle_rotate_finsh_flag = False;
	rotate_euler_angle_solve.encoder_merge_enable_flag = True;
	circle_euler_angle_solve.encoder_merge_enable_flag = True;
	box_euler_angle_solve.encoder_merge_enable_flag = True;
		
	while(1)
	{
		menu_back(menu_debug_page_back_service);
		menu_point();
		menu_title_show();		
		fsm();
		
		/* 实时数据 */
		screen_draw_line(MT9V03X_W/2+path_err, MENU_ROW_PITCH, MT9V03X_W/2+path_err, MENU_ROW_PITCH+2*MT9V03X_H,RGB565_RED);
		screen_image(0, MENU_ROW_PITCH, dog_cv.image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_image(0, MT9V03X_H+MENU_ROW_PITCH, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		// 红线，边线提取起始截止线
		screen_draw_line(0, MENU_ROW_PITCH+side_extract_start_y, MT9V03X_W, MENU_ROW_PITCH+side_extract_start_y ,RGB565_RED);
		screen_draw_line(0, MENU_ROW_PITCH+side_extract_end_y, MT9V03X_W, MENU_ROW_PITCH+side_extract_end_y ,RGB565_RED);
		// 绿色，圆环检测线
		screen_draw_line(0, MENU_ROW_PITCH+circle_check_y, MT9V03X_W, MENU_ROW_PITCH+circle_check_y ,RGB565_GREEN);
		
		// 边线点
		for(int i = 0;i < dog_path.L_side_point_num;i++)
		{
			if(dog_path.L_side[i][0] <= MT9V03X_W && dog_path.L_side[i][0] >= 0 && dog_path.L_side[i][1] <= MT9V03X_H && dog_path.L_side[i][1] >= 0)
			{
				screen_draw_point(dog_path.L_side[i][0], MT9V03X_H+MENU_ROW_PITCH+dog_path.L_side[i][1], RGB565_RED);
			}
		}
		for(int i = 0;i < dog_path.R_side_point_num;i++)
		{
			if(dog_path.R_side[i][0] <= MT9V03X_W && dog_path.R_side[i][0] >= 0 && dog_path.R_side[i][1] <= MT9V03X_H && dog_path.R_side[i][1] >= 0)
			{
				screen_draw_point(dog_path.R_side[i][0], MT9V03X_H+MENU_ROW_PITCH+dog_path.R_side[i][1], RGB565_RED);
			}
		}
		
		// 左弯点数 循线误差 右弯点数
		screen_int(0,2*MT9V03X_H+MENU_ROW_PITCH,dog_path.L_bend_point_num,3);
		screen_int(DATA_MAX_COL/2,2*MT9V03X_H+MENU_ROW_PITCH,path_err,3);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+MENU_ROW_PITCH,dog_path.R_bend_point_num,3);
		
		// 左边框点数       右边框点数
		screen_int(0,2*MT9V03X_H+2*MENU_ROW_PITCH,dog_path.L_frame_point_num,3);
		screen_float(DATA_MAX_COL/2,2*MT9V03X_H+2*MENU_ROW_PITCH,displacement_solve.distance,3,3);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+2*MENU_ROW_PITCH,dog_path.R_frame_point_num,3);
		
		// 左边线点数 灰度值 右边线点数
		screen_int(0,2*MT9V03X_H+3*MENU_ROW_PITCH,dog_path.L_side_point_num,3);
		screen_float(DATA_MAX_COL/2,2*MT9V03X_H+3*MENU_ROW_PITCH,bat_voltage.voltage,1,2);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+3*MENU_ROW_PITCH,dog_path.R_side_point_num,3);
		vofa_debug();
	}
}

/* 方案选择 */
void plan(void)
{
	menu_page_init(plan);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_plan_data_add_service,menu_plan_data_reduce_service);
		menu_title_show();
		
		MENU_PLAN.plan_idx.data_uint8 = plan_idx;
		
		// 显示方案数据
		screen_string(0,MENU_ROW_PITCH,MENU_PLAN.plan_idx.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_PLAN.plan_idx.data_uint8,1);
		
		screen_string(0,3*MENU_ROW_PITCH,"PATH_Y_SPEED");
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,path_y_speed_target[plan_idx],3,1);
		
		screen_string(0,4*MENU_ROW_PITCH,"CIRCLE_Y_SPEED");
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,circle_y_speed_target[plan_idx],3,1);
		
		screen_string(0,5*MENU_ROW_PITCH,"BOX_FXXK_Y_SPEED");
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,box_fxxk_y_speed_target[plan_idx],3,1);
		
		vofa_debug();
	}
}

/* 保存参数 */
void save(void)
{

}

/* 加载参数 */
void load(void)
{

}

/* 传感器校准 */
void sensor_calibrate(void)
{
	menu_page_init(sensor_calibrate);
	system_delay_ms(1000);
	// 开始陀螺仪、加速度计校准
	imu660ra.gyro_calibration_flag = False;
	imu660ra.acc_calibration_flag = False;
	current_1.current_calibration_flag = False;
	current_2.current_calibration_flag = False;
	current_3.current_calibration_flag = False;
	while(1){
		menu_back(NULL);
		menu_point();
		menu_title_show();		
		if(imu660ra.gyro_calibration_flag == True && imu660ra.acc_calibration_flag == True){
			#ifndef SPEED
			if(current_1.current_calibration_flag == True && current_2.current_calibration_flag == True && current_3.current_calibration_flag == True){
				menu_root_page();
			}
			#endif
			#ifdef SPEED
			menu_root_page();
			#endif
		}
		else{
			screen_string(0,MENU_ROW_PITCH,"KEEP STOP     ");
		}
		vofa_debug();
	}
}

/* 菜单编码器页面 */
void menu_encoder_page(void)
{	
	menu_page_init(menu_encoder_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_title_show();
	
		MENU_ENCODER.encoder_1_count.data_int16 = encoder_1.encoder_raw;
		MENU_ENCODER.encoder_2_count.data_int16 = encoder_2.encoder_raw;
		MENU_ENCODER.encoder_3_count.data_int16 = encoder_3.encoder_raw;
		MENU_ENCODER.encoder_1_speed.data_float = encoder_1.encoder_rpm;
		MENU_ENCODER.encoder_2_speed.data_float = encoder_2.encoder_rpm;
		MENU_ENCODER.encoder_3_speed.data_float = encoder_3.encoder_rpm;
	
		// 显示编码器计数值
		screen_string(0,MENU_ROW_PITCH,MENU_ENCODER.encoder_1_count.name);
		screen_int(DATA_MAX_COL,MENU_ROW_PITCH,MENU_ENCODER.encoder_1_count.data_int16,4);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_count.name);
		screen_int(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_count.data_int16,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_count.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_count.data_int16,4);
	
		// 显示编码器转速
		screen_string(0,4*MENU_ROW_PITCH,MENU_ENCODER.encoder_1_speed.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_ENCODER.encoder_1_speed.data_float,4,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_speed.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_speed.data_float,4,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_speed.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_speed.data_float,4,3);
		vofa_debug();
	}
}

/* 菜单电机页面 */
void menu_motor_page(void)
{	
	menu_page_init(menu_motor_page);
	while(1)
	{
		control_kind = PWM;
		
		menu_back(menu_motor_page_back_service);
		menu_point();
		menu_title_show();	
		
		menu_data_change(menu_motor_data_add_service,menu_motor_data_reduce_service);
		
		MENU_MOTOR.motor_1_duty.data_int16 = motor_pwm_duty[0];
		MENU_MOTOR.motor_2_duty.data_int16 = motor_pwm_duty[1];
		MENU_MOTOR.motor_3_duty.data_int16 = motor_pwm_duty[2];
		MENU_MOTOR.motor_1_speed.data_float = encoder_1.wheel_speed;
		MENU_MOTOR.motor_2_speed.data_float = encoder_2.wheel_speed;
		MENU_MOTOR.motor_3_speed.data_float = encoder_3.wheel_speed;
		MENU_MOTOR.motor_1_I.data_float = current_1.current;
		MENU_MOTOR.motor_2_I.data_float = current_2.current;
		MENU_MOTOR.motor_3_I.data_float = current_3.current;
	
		// 调整电机方向及PWM
		screen_string(0,1*MENU_ROW_PITCH,MENU_MOTOR.motor_1_duty.name);
		screen_int(DATA_MAX_COL,1*MENU_ROW_PITCH,MENU_MOTOR.motor_1_duty.data_int16,4);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR.motor_2_duty.name);
		screen_int(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR.motor_2_duty.data_int16,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR.motor_3_duty.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR.motor_3_duty.data_int16,4);
		
		// 显示电机转速
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.data_float,4,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.data_float,4,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.data_float,4,3);
		
		// 显示电机转电流
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR.motor_1_I.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR.motor_1_I.data_float,4,3);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR.motor_2_I.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR.motor_2_I.data_float,4,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR.motor_3_I.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR.motor_3_I.data_float,4,3);
		vofa_debug();
	}
}

/* 菜单陀螺仪、加速度计页面 */
void menu_gyro_acc_page(void)
{	
	menu_page_init(menu_gyro_acc_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_title_show();
		
		MENU_GYRO_ACC.gyro_x.data_float = imu660ra.gyro_x;
		MENU_GYRO_ACC.gyro_y.data_float = imu660ra.gyro_y;
		MENU_GYRO_ACC.gyro_z.data_float = imu660ra.gyro_z;
		MENU_GYRO_ACC.acc_x.data_float = imu660ra.acc_x;
		MENU_GYRO_ACC.acc_y.data_float = imu660ra.acc_y;
		MENU_GYRO_ACC.acc_z.data_float = imu660ra.acc_z;
	
		// 显示陀螺仪
		screen_string(0,MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_x.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_x.data_float,2,4);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_y.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_y.data_float,2,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_z.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_z.data_float,2,4);
		
		// 显示加速度计
		screen_string(0,4*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_x.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_x.data_float,2,4);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_y.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_y.data_float,2,4);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_z.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_z.data_float,2,4);
		vofa_debug();
	}
}

/* 菜单欧拉角页面 */
void menu_euler_angle_page(void)
{
	menu_page_init(menu_euler_angle_page);
	while(1)
	{
//		update_data();
		menu_back(menu_euler_angle_page_back_service);
		menu_point();
		menu_title_show();
	
		euler_angle_solve.solve_flag = True;
		
		MENU_EULER_ANGLE.roll.data_float = euler_angle_solve.roll;
		MENU_EULER_ANGLE.pitch.data_float = euler_angle_solve.pitch;
		MENU_EULER_ANGLE.yaw.data_float = euler_angle_solve.yaw;
	
		// 显示陀螺仪
		screen_string(0,MENU_ROW_PITCH,MENU_EULER_ANGLE.roll.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_EULER_ANGLE.roll.data_float,3,3);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_EULER_ANGLE.pitch.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_EULER_ANGLE.pitch.data_float,3,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_EULER_ANGLE.yaw.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_EULER_ANGLE.yaw.data_float,3,3);
		vofa_debug();
	}
}

/* 菜单平动位移页面 */
void menu_translate_shift_page(void)
{
	menu_page_init(menu_translate_shift_page);
	while(1)
	{
		menu_back(menu_translate_shift_page_back_service);
		menu_point();
		menu_title_show();
		
		displacement_solve.solve_flag = True;
		
		MENU_SHIFT.distance.data_float = displacement_solve.distance;
		MENU_SHIFT.world_x.data_float = displacement_solve.world_x_displacement;
		MENU_SHIFT.world_y.data_float = displacement_solve.world_y_displacement;
		MENU_SHIFT.world_yaw.data_float = displacement_solve.yaw;
		
		// 显示位移解算
		screen_string(0,MENU_ROW_PITCH,MENU_SHIFT.distance.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_SHIFT.distance.data_float,5,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_SHIFT.world_x.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_SHIFT.world_x.data_float,5,1);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_SHIFT.world_y.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_SHIFT.world_y.data_float,5,1);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_SHIFT.world_yaw.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_SHIFT.world_yaw.data_float,3,1);
		
		screen_string(0,6*MENU_ROW_PITCH,"WHEEL_1_SHIFT");
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,displacement_solve.wheel_1_displacement,4,2);
		
		screen_string(0,7*MENU_ROW_PITCH,"WHEEL_2_SHIFT");
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,displacement_solve.wheel_2_displacement,4,2);
		
		screen_string(0,8*MENU_ROW_PITCH,"WHEEL_3_SHIFT");
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,displacement_solve.wheel_3_displacement,4,2);
		vofa_debug();
	}
}

/* 对称法矫正数据页面 */
void menu_symmetry_rectificate_page(void)
{
	menu_page_init(menu_symmetry_rectificate_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
//		menu_data_change(menu_symmetry_rectificate_data_add_service,menu_symmetry_rectificate_data_reduce_service);
		menu_title_show();
		
		dog_cv.threshold(&dog_cv, mt9v03x_image);
		screen_image(0, MENU_ROW_PITCH, dog_cv.image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_image(0, MT9V03X_H+MENU_ROW_PITCH, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		symmetry_rectificate(dog_cv.image_OTSU);
		screen_float(0, 2*MT9V03X_H+MENU_ROW_PITCH, sum_weight_normalization, 2, 3);
		screen_float(0, 2*MT9V03X_H+2*MENU_ROW_PITCH, frame_white_num_normalization[0], 2, 3);
		screen_float(0, 2*MT9V03X_H+3*MENU_ROW_PITCH, frame_white_num_normalization[1], 2, 3);
		screen_draw_line(0, MENU_ROW_PITCH+symmetry_rectificate_start_y, MT9V03X_W, MENU_ROW_PITCH+symmetry_rectificate_start_y ,RGB565_RED);
		screen_draw_line(0, MENU_ROW_PITCH+symmetry_rectificate_end_y, MT9V03X_W, MENU_ROW_PITCH+symmetry_rectificate_end_y ,RGB565_RED);
		screen_draw_line(MT9V03X_W/8, MENU_ROW_PITCH, MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		screen_draw_line(2*MT9V03X_W/8, MENU_ROW_PITCH, 2*MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		screen_draw_line(3*MT9V03X_W/8, MENU_ROW_PITCH, 3*MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		screen_draw_line(4*MT9V03X_W/8, MENU_ROW_PITCH, 4*MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		screen_draw_line(5*MT9V03X_W/8, MENU_ROW_PITCH, 5*MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		screen_draw_line(6*MT9V03X_W/8, MENU_ROW_PITCH, 6*MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		screen_draw_line(7*MT9V03X_W/8, MENU_ROW_PITCH, 7*MT9V03X_W/8, MENU_ROW_PITCH+MT9V03X_H ,RGB565_RED);
		vofa_debug();
	}
}

/* 普通摄像头 数据页面 */
void menu_common_camera_page(void)
{
	menu_page_init(menu_common_camera_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_common_camera_data_add_service,menu_common_camera_data_reduce_service);
		menu_title_show();
		
		MENU_COMMON_CAMERA.exp_time.data_uint16 = exp_time;
		
		// 二值化
		dog_cv.threshold(&dog_cv, mt9v03x_image);
		
		screen_string(0,MENU_ROW_PITCH,MENU_COMMON_CAMERA.exp_time.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_COMMON_CAMERA.exp_time.data_uint16,3);
		
		// 显示图像
		screen_image(0, 2*MENU_ROW_PITCH, dog_cv.image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_image(0, MT9V03X_H+2*MENU_ROW_PITCH, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);		
	}
}

/* AI摄像头0 数据页面 */
void menu_ai_camera_0_page(void)
{
	menu_page_init(menu_ai_camera_0_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_ai_camera_0_data_add_service,menu_ai_camera_0_data_reduce_service);
		menu_title_show();
		
		MENU_AI_CAMERA_0.ai_camera_0_enable_flag.data_uint8 = ai_camera_0_enable_flag;
		MENU_AI_CAMERA_0.detection_box_width_limit.data_int16 = detection_box_width_limit;
		MENU_AI_CAMERA_0.detection_box_width_target.data_int16 = detection_box_width_target;
		MENU_AI_CAMERA_0.detection_box_center_limit.data_int16 = detection_box_center_x_limit;
		MENU_AI_CAMERA_0.box_x_speed_target.data_float = box_x_speed_target;
		MENU_AI_CAMERA_0.box_x_angular_speed_rate.data_float = box_x_angular_speed_rate;
		MENU_AI_CAMERA_0.box_fxxk_speed.data_float = box_fxxk_y_speed_target[plan_idx];
		MENU_AI_CAMERA_0.box_distance.data_float = box_distance;
		
		screen_string(0,MENU_ROW_PITCH,MENU_AI_CAMERA_0.ai_camera_0_enable_flag.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_AI_CAMERA_0.ai_camera_0_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_limit.name);
		screen_int(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_limit.data_int16,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_target.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_target.data_int16,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_center_limit.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_center_limit.data_int16,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_x_speed_target.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_x_speed_target.data_float,3,1);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_x_angular_speed_rate.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_x_angular_speed_rate.data_float,1,2);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_fxxk_speed.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_fxxk_speed.data_float,3,1);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_distance.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_AI_CAMERA_0.box_distance.data_float,3,1);
		
		screen_string(0,10*MENU_ROW_PITCH,"CENTER_X");
		screen_int(DATA_MAX_COL,10*MENU_ROW_PITCH,detection_box_center_x,3);
		
		screen_string(0,11*MENU_ROW_PITCH,"BOX_WIDTH");
		screen_int(DATA_MAX_COL,11*MENU_ROW_PITCH,detection_box_width,3);
		
		screen_string(0,12*MENU_ROW_PITCH,"BOX_HEIGHT");
		screen_int(DATA_MAX_COL,12*MENU_ROW_PITCH,detection_box_height,3);
		
		screen_string(0,13*MENU_ROW_PITCH,"TRACK_ERR");
		screen_int(DATA_MAX_COL,13*MENU_ROW_PITCH,detection_box_center_x-AI_CAMERA_0_IMAGE_WIDTH/2,3);
		vofa_debug();
	}
}

/* AI摄像头1和2 数据页面 */
void menu_ai_camera_1_and_2_page(void)
{
	menu_page_init(menu_ai_camera_1_and_2_page);
	while(1)
	{
		/* 发送开始识别串口 */
		uint8 detection_start[5] = {0x4f, 0x16, 0x08, 0x76, 0x76};
		uart_write_buffer(AI_CAMERA_1_UART_INDEX, detection_start, sizeof(detection_start));
		#ifndef AI_CAMERA_MERGE
		uart_write_buffer(AI_CAMERA_2_UART_INDEX, detection_start, sizeof(detection_start));
		#endif
		
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_ai_camera_1_and_2_data_add_service,menu_ai_camera_1_and_2_data_reduce_service);
		menu_title_show();
		
		MENU_AI_CAMERA_1_2.ai_camera_1_enable_flag.data_uint8 = ai_camera_1_enable_flag;
		MENU_AI_CAMERA_1_2.ai_camera_2_enable_flag.data_uint8 = ai_camera_2_enable_flag;
		MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.data_uint8 = supplement_lamp_enable_flag;
		
		screen_string(0,MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.ai_camera_1_enable_flag.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.ai_camera_1_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.ai_camera_2_enable_flag.name);
		screen_uint(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.ai_camera_2_enable_flag.data_uint8,1);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.name);
		screen_uint(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.data_uint8,1);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.detection_result.name);
		if(detection_result.tool != 0X10)
		{
			switch(detection_result.tool)
			{
				case wrench:{ screen_string(0,6*MENU_ROW_PITCH,"WRENCH        "); break; }
				case soldering_iron:{ screen_string(0,6*MENU_ROW_PITCH,"SOLDERING_IRON"); break; }
				case electrodrill:{ screen_string(0,6*MENU_ROW_PITCH,"ELECTRODRILL  "); break; }
				case tape_measure:{ screen_string(0,6*MENU_ROW_PITCH,"TAPE_MEASURE  "); break; }
				case screwdriver:{ screen_string(0,6*MENU_ROW_PITCH,"SCREWDRIVER   "); break; }
				case pliers:{ screen_string(0,6*MENU_ROW_PITCH,"PLIERS        "); break; }
				case oscillograph:{ screen_string(0,6*MENU_ROW_PITCH,"OSCILLOGRAPH  "); break; }
				case multimeter:{ screen_string(0,6*MENU_ROW_PITCH,"MULTIMETER    "); break; }
				case printer:{ screen_string(0,6*MENU_ROW_PITCH,"PRINTER       "); break; }
				case keyboard:{ screen_string(0,6*MENU_ROW_PITCH,"KEYBOARD      "); break; }
				case mobilephone:{ screen_string(0,6*MENU_ROW_PITCH,"MOBILEPHONE   "); break; }
				case mouse:{ screen_string(0,6*MENU_ROW_PITCH,"MOUSE         "); break; }
				case headphones:{ screen_string(0,6*MENU_ROW_PITCH,"HEADPHONES    "); break; }
				case monitor:{ screen_string(0,6*MENU_ROW_PITCH,"MONITOR       "); break; }
				case speaker:{ screen_string(0,6*MENU_ROW_PITCH,"SPEAKER       "); break; }
				default:break;
			}
		}
		else if(detection_result.tool == 0X10)
		{
			screen_string(0,6*MENU_ROW_PITCH,"              ");
			screen_int(0,6*MENU_ROW_PITCH,detection_result.num,3);
		}
		
		screen_string(0,8*MENU_ROW_PITCH,"DETECTION_RAW_DATA");
		screen_uint(DATA_MAX_COL+20,8*MENU_ROW_PITCH,detection_result.tool_raw,3);
		screen_uint(DATA_MAX_COL+50,8*MENU_ROW_PITCH,detection_result.num_raw,3);
		
		screen_string(0,10*MENU_ROW_PITCH,"BOX_FXXK_DIR");
		if((detection_result.tool >= 0X01 && detection_result.tool <= 0X08) || ((detection_result.num&0X01) == 0 && detection_result.tool == 0X10)) screen_string(DATA_MAX_COL,10*MENU_ROW_PITCH,"RIGHT");
		else if((detection_result.tool >= 0X09 && detection_result.tool <= 0X0F) || ((detection_result.num&0X01) == 1 && detection_result.tool == 0X10)) screen_string(DATA_MAX_COL,10*MENU_ROW_PITCH,"LEFT ");
		else screen_string(DATA_MAX_COL,10*MENU_ROW_PITCH,"NONE ");
		vofa_debug();
	}
}

/* AI识别列表页面 */
void menu_detection_list(void)
{
	menu_page_init(menu_detection_list);
	
	int8 detection_list_page_num = 0;
	int8 row_num = MAX_ROW-2;
	dog_rwr.radar_scanning_enable_flag = False;
	dog_rwr.radar_tracking_enable_flag = False;
	dog_rwr.missile_launch_enable_flag = False;		
	
	while(1)
	{
		menu_back(NULL);
		menu_point();
		
		if(key_get_state(RIGHT) == KEY_SHORT_PRESS)
		{
			detection_list_page_num++;
			screen_clear();
			key_clear_all_state();
		}
		else if(key_get_state(LEFT) == KEY_SHORT_PRESS)
		{
			detection_list_page_num--;
			screen_clear();
			key_clear_all_state();
		}
		
		menu_title_show();
		
		if(detection_list_page_num > ROUND(detection_result_num,row_num))
			detection_list_page_num = 0;
		else if(detection_list_page_num < 0)
			detection_list_page_num = ROUND(detection_result_num,row_num);
		
		// 支持无限页数
		for(int i = detection_list_page_num*(MAX_ROW-2);i < (detection_list_page_num+1)*(MAX_ROW-2);i++)
		{
			if(detection_result_list[i].tool != 0X10)
			{
				switch(detection_result_list[i].tool)
				{
					case wrench:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"WRENCH"); break; }
					case soldering_iron:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"SOLDERING_IRON"); break; }
					case electrodrill:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"ELECTRODRILL"); break; }
					case tape_measure:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"TAPE_MEASURE"); break; }
					case screwdriver:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"SCREWDRIVER"); break; }
					case pliers:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"PLIERS"); break; }
					case oscillograph:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"OSCILLOGRAPH"); break; }
					case multimeter:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MULTIMETER"); break; }
					case printer:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"PRINTER"); break; }
					case keyboard:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"KEYBOARD"); break; }
					case mobilephone:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MOBILEPHONE"); break; }
					case mouse:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MOUSE"); break; }
					case headphones:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"HEADPHONES"); break; }
					case monitor:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MONITOR"); break; }
					case speaker:{ screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3); screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"SPEAKER"); break; }
					default:break;
				}
			}
			else if(detection_result_list[i].tool == 0X10)
			{
				screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i+1,3);
				screen_int(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,detection_result_list[i].num,3);
			}
			vofa_debug();
		}
	}
}

/* 菜单循线数据页面 */
void menu_path_page(void)
{
	menu_page_init(menu_path_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_path_data_add_service,menu_path_data_reduce_service);
		menu_title_show();
		
		MENU_PATH.zebra_enable_flag.data_uint8 = zebra_enable_flag;
		MENU_PATH.y_speed_target.data_float = path_y_speed_target[plan_idx];
		MENU_PATH.path_start.data_int16 = path_start;
		MENU_PATH.path_end.data_int16 = path_end;
		MENU_PATH.control_point_0.data_int16 = control_point[0];
		MENU_PATH.control_point_1.data_int16 = control_point[1];
		MENU_PATH.control_point_2.data_int16 = control_point[2];
		MENU_PATH.prediction_point.data_int16 = prediction_point;
		MENU_PATH.x_speed_rate.data_float = x_speed_rate;
		MENU_PATH.auto_control_point_min.data_uint16 = auto_control_point_normalize_range[0];
		MENU_PATH.auto_control_point_max.data_uint16 = auto_control_point_normalize_range[1];
	
		// 显示循线数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH.zebra_enable_flag.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_PATH.zebra_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH.y_speed_target.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_PATH.y_speed_target.data_float,3,1);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH.path_start.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_PATH.path_start.data_int16,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH.path_end.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_PATH.path_end.data_int16,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH.control_point_0.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_PATH.control_point_0.data_int16,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_PATH.control_point_1.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_PATH.control_point_1.data_int16,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_PATH.control_point_2.name);
		screen_int(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_PATH.control_point_2.data_int16,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_PATH.prediction_point.name);
		screen_int(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_PATH.prediction_point.data_int16,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_PATH.x_speed_rate.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_PATH.x_speed_rate.data_float,1,1);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_PATH.auto_control_point_min.name);
		screen_uint(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_PATH.auto_control_point_min.data_uint16,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_PATH.auto_control_point_max.name);
		screen_uint(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_PATH.auto_control_point_max.data_uint16,3);
		vofa_debug();
	}
}

/* 菜单圆环循线数据页面 */
void menu_circle_path_page(void)
{
	menu_page_init(menu_circle_path_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_circle_path_data_add_service,menu_circle_path_data_reduce_service);
		menu_title_show();
		
		MENU_CIRCLE_PATH.circle_enable_flag.data_uint8 = circle_enable_flag;
		MENU_CIRCLE_PATH.circle_y_speed_target.data_float = circle_y_speed_target[plan_idx];
		MENU_CIRCLE_PATH.circle_angular_speed_target.data_float = circle_angular_speed_target[plan_idx];
		MENU_CIRCLE_PATH.circle_check_y.data_int16 = circle_check_y;
		MENU_CIRCLE_PATH.circle_in_angle.data_int16 = circle_angle_target[0];
		MENU_CIRCLE_PATH.circle_out_angle.data_int16 = circle_angle_target[1];
		MENU_CIRCLE_PATH.side_extract_start.data_int16 = side_extract_start_y;
		MENU_CIRCLE_PATH.side_extract_end.data_int16 = side_extract_end_y;
		MENU_CIRCLE_PATH.circle_in_distance_limit.data_float = circle_in_distance_limit;
		MENU_CIRCLE_PATH.circle_out_distance_limit.data_float = circle_out_distance_limit;
	
		// 显示圆环循线数据
		screen_string(0,MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_enable_flag.name);
		screen_int(DATA_MAX_COL,MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_y_speed_target.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_y_speed_target.data_float,3,2);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_angular_speed_target.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_angular_speed_target.data_float,3,2);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_check_y.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_check_y.data_int16,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_angle.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_angle.data_int16,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_angle.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_angle.data_int16,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_start.name);
		screen_int(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_start.data_int16,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_end.name);
		screen_int(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_end.data_int16,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_distance_limit.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_distance_limit.data_float,3,1);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_distance_limit.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_distance_limit.data_float,3,1);
		vofa_debug();
	}
}

/* 菜单电机1 PID页面 */
void menu_motor_1_pid_page(void)
{
	menu_page_init(menu_motor_1_pid_page);
	wheel_speed_target[0] = 0;
	wheel_speed_target[1] = 0;
	wheel_speed_target[2] = 0;
	motor_debug_timer.ticking_flag = True;
	while(1)
	{
		menu_back(menu_motor_pid_page_back_service);
		menu_point();
		menu_data_change(menu_motor_1_pid_add_service,menu_motor_1_pid_reduce_service);
		menu_title_show();
		
		control_kind = Speed;
		
		// 正弦速度
        wheel_speed_target[0] = 60*sin((float)motor_debug_timer.time/600.0);
		MENU_MOTOR_1_PID.motor_target.data_int16 = wheel_speed_target[0];
		#ifndef FUZZY_SPEED_AND_CURRENT
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.data_float = MOTOR_1_PID[0];
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.data_float = MOTOR_1_PID[1];
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.data_float = MOTOR_1_PID[2];
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.data_float = MOTOR_1_PID[3];
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.data_float = MOTOR_1_PID[4];
		#endif
		
		MENU_MOTOR_1_PID.MOTOR_I_PID.p.data_float = I_1_PID[0];
		MENU_MOTOR_1_PID.MOTOR_I_PID.i.data_float = I_1_PID[1];
		MENU_MOTOR_1_PID.MOTOR_I_PID.d.data_float = I_1_PID[2];
		MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.data_float = I_1_PID[3];
		MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.data_float = I_1_PID[4];
	
		// 显示电机1 PID数据
		screen_string(0,1*MENU_ROW_PITCH,MENU_MOTOR_1_PID.motor_target.name);
		screen_int(DATA_MAX_COL,1*MENU_ROW_PITCH,MENU_MOTOR_1_PID.motor_target.data_int16,3);
		
		#ifndef FUZZY_SPEED_AND_CURRENT
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.data_float,3,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.data_float,3,4);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.data_float,3,4);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.data_float,5,1);
		#endif
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.p.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.p.data_float,5,1);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i.data_float,5,1);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.d.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.d.data_float,5,1);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.data_float,3,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.data_float,5,1);
		vofa_debug();
	}
}

/* 菜单电机2 PID页面 */
void menu_motor_2_pid_page(void)
{
	menu_page_init(menu_motor_2_pid_page);
	wheel_speed_target[0] = 0;
	wheel_speed_target[1] = 0;
	wheel_speed_target[2] = 0;
	motor_debug_timer.ticking_flag = True;
	while(1)
	{
		menu_back(menu_motor_pid_page_back_service);
		menu_point();
		menu_data_change(menu_motor_2_pid_add_service,menu_motor_2_pid_reduce_service);
		menu_title_show();
		
		control_kind = Speed;
		
		// 正弦速度
        wheel_speed_target[1] = 40*sin((float)motor_debug_timer.time/600.0)+100;
		MENU_MOTOR_2_PID.motor_target.data_int16 = wheel_speed_target[1];
		#ifndef FUZZY_SPEED_AND_CURRENT
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.data_float = MOTOR_2_PID[0];
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.data_float = MOTOR_2_PID[1];
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.data_float = MOTOR_2_PID[2];
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.data_float = MOTOR_2_PID[3];
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.data_float = MOTOR_2_PID[4];
		#endif
		
		MENU_MOTOR_2_PID.MOTOR_I_PID.p.data_float = I_2_PID[0];
		MENU_MOTOR_2_PID.MOTOR_I_PID.i.data_float = I_2_PID[1];
		MENU_MOTOR_2_PID.MOTOR_I_PID.d.data_float = I_2_PID[2];
		MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.data_float = I_2_PID[3];
		MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.data_float = I_2_PID[4];
	
		// 显示电机2 PID数据
		screen_string(0,1*MENU_ROW_PITCH,MENU_MOTOR_2_PID.motor_target.name);
		screen_int(DATA_MAX_COL,1*MENU_ROW_PITCH,MENU_MOTOR_2_PID.motor_target.data_int16,3);
		
		#ifndef FUZZY_SPEED_AND_CURRENT
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.data_float,3,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.data_float,3,4);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.data_float,3,4);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.data_float,2,2);
		#endif
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.p.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.p.data_float,5,1);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i.data_float,5,1);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.d.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.d.data_float,5,1);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.data_float,3,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.data_float,5,1);
		vofa_debug();
	}
}

/* 菜单电机3 PID页面 */
void menu_motor_3_pid_page(void)
{
	menu_page_init(menu_motor_3_pid_page);
	wheel_speed_target[0] = 0;
	wheel_speed_target[1] = 0;
	wheel_speed_target[2] = 0;
	motor_debug_timer.ticking_flag = True;
	while(1)
	{
		menu_back(menu_motor_pid_page_back_service);
		menu_point();
		menu_data_change(menu_motor_3_pid_add_service,menu_motor_3_pid_reduce_service);
		menu_title_show();
		
		control_kind = Speed;
		
		// 正弦速度
        wheel_speed_target[2] = 60*sin((float)motor_debug_timer.time/600.0);
		MENU_MOTOR_3_PID.motor_target.data_int16 = wheel_speed_target[2];
		#ifndef FUZZY_SPEED_AND_CURRENT
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.data_float = MOTOR_3_PID[0];
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.data_float = MOTOR_3_PID[1];
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.data_float = MOTOR_3_PID[2];
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.data_float = MOTOR_3_PID[3];
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.data_float = MOTOR_3_PID[4];
		#endif
		
		MENU_MOTOR_3_PID.MOTOR_I_PID.p.data_float = I_3_PID[0];
		MENU_MOTOR_3_PID.MOTOR_I_PID.i.data_float = I_3_PID[1];
		MENU_MOTOR_3_PID.MOTOR_I_PID.d.data_float = I_3_PID[2];
		MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.data_float = I_3_PID[3];
		MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.data_float = I_3_PID[4];
	
		// 显示电机3 PID数据
		screen_string(0,1*MENU_ROW_PITCH,MENU_MOTOR_3_PID.motor_target.name);
		screen_int(DATA_MAX_COL,1*MENU_ROW_PITCH,MENU_MOTOR_3_PID.motor_target.data_int16,3);
		
		#ifndef FUZZY_SPEED_AND_CURRENT
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.data_float,3,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.data_float,3,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.data_float,3,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.data_float,5,1);
		#endif
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.p.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.p.data_float,3,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i.data_float,3,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.d.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.d.data_float,3,3);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.data_float,3,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.data_float,5,1);
		vofa_debug();
	}
}

/* 菜单循迹 PID页面 */
void menu_path_pid_page(void)
{
	menu_page_init(menu_path_pid_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_path_pid_add_service,menu_path_pid_reduce_service);
		menu_title_show();
	
		MENU_PATH_PID.PATH_PID.p.data_float = PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][0];
		MENU_PATH_PID.PATH_PID.i.data_float = PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][1];
		MENU_PATH_PID.PATH_PID.d.data_float = PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][2];
		MENU_PATH_PID.PATH_PID.output_limit.data_float = PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][3];
		MENU_PATH_PID.PATH_PID.i_limit.data_float = PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][4];
		MENU_PATH_PID.PATH_PID.gyro_d.data_float = PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][5];
	
		// 显示循迹 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH_PID.pid_kind.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_PATH_PID.pid_kind.data_uint8,2);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.p.data_float,1,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i.data_float,1,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.d.data_float,1,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i_limit.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.output_limit.data_float,3,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.gyro_d.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.gyro_d.data_float,1,3);
		vofa_debug();
	}
}

/**********************************************************************/

/****************************** 菜单页面服务 ******************************/

/* 菜单启动页面返回服务 */
void menu_start_page_back_service(void)
{
	// 循线起点初始化
	dog_path.mid_x = MT9V03X_W/2;
}

/* 菜单调试页面返回服务 */
void menu_debug_page_back_service(void)
{
	// 循线起点初始化
	dog_path.mid_x = MT9V03X_W/2;
}

/* 电机页面返回服务 */
void menu_motor_page_back_service(void)
{
	// 停车
	memset(wheel_speed_target, 0, sizeof(wheel_speed_target));
	memset(motor_current_target, 0, sizeof(motor_current_target));	
	memset(motor_pwm_duty, 0, sizeof(motor_pwm_duty));
	control_kind = Stop;
}

/* 菜单欧拉角页面返回服务 */
void menu_euler_angle_page_back_service(void)
{
	// 停止解算
	euler_angle_solve.solve_flag = False;
}

/* 平动位移解算页面返回服务 */
void menu_translate_shift_page_back_service(void)
{
	// 停止解算
	displacement_solve.solve_flag = False;
}

/* 电机PID页面返回服务 */
void menu_motor_pid_page_back_service(void)
{
	// 停车
	memset(wheel_speed_target, 0, sizeof(wheel_speed_target));
	memset(motor_current_target, 0, sizeof(motor_current_target));	
	memset(motor_pwm_duty, 0, sizeof(motor_pwm_duty));
	control_kind = Stop;
	
	motor_debug_timer.ticking_flag = False;
}

/* 菜单对称法矫正数据页面服务 */
//void menu_symmetry_rectificate_data_add_service(void)
//{
//	switch(point_row_num)
//	{
//		case 0:{ ai_camera_0_enable_flag+=1; break; }
//		case 1:{ track_linear_speed_target+=0.01; break; }
//		case 2:{ track_linear_speed_revise+=0.01; break; }
//		case 3:{ detection_box_width_limit+=1; break; }
//		case 4:{ detection_box_width_std+=1; break; }
//		case 5:{ detection_box_center_limit+=1; break; }
//	}
//	if(ai_camera_0_enable_flag > 1)
//	{
//		ai_camera_0_enable_flag = 0;
//	}
//}
//void menu_asymmetry_rectificate_data_reduce_service(void)
//{
//	switch(point_row_num)
//	{
//		case 0:{ ai_camera_0_enable_flag-=1; break; }
//		case 1:{ track_linear_speed_target-=0.01; break; }
//		case 2:{ track_linear_speed_revise-=0.01; break; }
//		case 3:{ detection_box_width_limit-=1; break; }
//		case 4:{ detection_box_width_std-=1; break; }
//		case 5:{ detection_box_center_limit-=1; break; }
//	}
//	if(ai_camera_0_enable_flag > 1)
//	{
//		ai_camera_0_enable_flag = 1;
//	}
//}

/* 方案页面服务 */
void menu_plan_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ plan_idx+=1; break; }
	}
	if(plan_idx > 3)
		plan_idx = 0;
}
void menu_plan_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ plan_idx-=1; break; }
	}
	if(plan_idx > 3)
		plan_idx = 3;
}

/* 电机数据页面服务 */
void menu_motor_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ motor_pwm_duty[0]+=50; break; }
		case 1:{ motor_pwm_duty[1]+=50; break; }
		case 2:{ motor_pwm_duty[2]+=50; break; }
	}
	if(abs(motor_pwm_duty[0]) > 7000)
		motor_pwm_duty[0] = 0;
	if(abs(motor_pwm_duty[1]) > 7000)
		motor_pwm_duty[0] = 0;
	if(abs(motor_pwm_duty[2]) > 7000)
		motor_pwm_duty[0] = 0;
}
void menu_motor_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ motor_pwm_duty[0]-=50; break; }
		case 1:{ motor_pwm_duty[1]-=50; break; }
		case 2:{ motor_pwm_duty[2]-=50; break; }
	}
	if(abs(motor_pwm_duty[0]) > 7000)
		motor_pwm_duty[0] = 0;
	if(abs(motor_pwm_duty[1]) > 7000)
		motor_pwm_duty[0] = 0;
	if(abs(motor_pwm_duty[2]) > 7000)
		motor_pwm_duty[0] = 0;
}

/* 菜单普通摄像头数据页面服务 */
void menu_common_camera_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ exp_time+=1; break; }
	}
	mt9v03x_set_exposure_time(exp_time);
}
void menu_common_camera_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ exp_time-=1; break; }
	}
	mt9v03x_set_exposure_time(exp_time);
}

/* 菜单AI摄像头0数据页面服务 */
void menu_ai_camera_0_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ ai_camera_0_enable_flag+=1; break; }
		case 1:{ detection_box_width_limit+=1; break; }
		case 2:{ detection_box_width_target+=1; break; }
		case 3:{ detection_box_center_x_limit+=1; break; }
		case 4:{ box_x_speed_target+=0.5; break; }
		case 5:{ box_x_angular_speed_rate+=0.01; break; }
		case 6:{ box_fxxk_y_speed_target[plan_idx]+=5.0; break; }
		case 7:{ box_distance+=5; break; }
	}
	if(ai_camera_0_enable_flag > 1)
	{
		ai_camera_0_enable_flag = 0;
	}
}
void menu_ai_camera_0_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ ai_camera_0_enable_flag-=1; break; }
		case 1:{ detection_box_width_limit-=1; break; }
		case 2:{ detection_box_width_target-=1; break; }
		case 3:{ detection_box_center_x_limit-=1; break; }
		case 4:{ box_x_speed_target-=0.5; break; }
		case 5:{ box_x_angular_speed_rate-=0.01; break; }
		case 6:{ box_fxxk_y_speed_target[plan_idx]-=5.0; break; }
		case 7:{ box_distance-=5; break; }
	}
	if(ai_camera_0_enable_flag > 1)
	{
		ai_camera_0_enable_flag = 1;
	}
}

/* 菜单AI摄像头1/2数据页面服务 */
void menu_ai_camera_1_and_2_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ ai_camera_1_enable_flag+=1; break; }
		case 1:{ ai_camera_2_enable_flag+=1; break; }
		case 2:{ supplement_lamp_enable_flag+=1; break; }
	}
	if(ai_camera_1_enable_flag > 1)
	{
		ai_camera_1_enable_flag = 0;
	}
	if(ai_camera_2_enable_flag > 1)
	{
		ai_camera_2_enable_flag = 0;
	}
	if(supplement_lamp_enable_flag > 1)
	{
		supplement_lamp_enable_flag = 0;
	}
}
void menu_ai_camera_1_and_2_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ ai_camera_1_enable_flag-=1; break; }
		case 1:{ ai_camera_2_enable_flag-=1; break; }
		case 2:{ supplement_lamp_enable_flag-=1; break; }
	}
	if(ai_camera_1_enable_flag > 1)
	{
		ai_camera_1_enable_flag = 1;
	}
	if(ai_camera_2_enable_flag > 1)
	{
		ai_camera_2_enable_flag = 1;
	}
	if(supplement_lamp_enable_flag > 1)
	{
		supplement_lamp_enable_flag = 1;
	}
}

/* 菜单循线数据页面服务 */
void menu_path_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ zebra_enable_flag+=1; break; }
		case 1:{ path_y_speed_target[plan_idx]+=5; break; }
		case 2:{ path_start+=1; break; }
		case 3:{ path_end+=1; break; }
		case 4:{ control_point[0]+=1; break; }
		case 5:{ control_point[1]+=1; break; }
		case 6:{ control_point[2]+=1; break; }
		case 7:{ prediction_point+=1; break; }
		case 8:{ x_speed_rate+=0.1; break; }
		case 9:{ auto_control_point_normalize_range[0]+=5; break; }
		case 10:{ auto_control_point_normalize_range[1]+=5; break; }
	}
	if(zebra_enable_flag > 1)
	{
		zebra_enable_flag = 0;
	}
}
void menu_path_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ zebra_enable_flag-=1; break; }
		case 1:{ path_y_speed_target[plan_idx]-=5; break; }
		case 2:{ path_start-=1; break; }
		case 3:{ path_end-=1; break; }
		case 4:{ control_point[0]-=1; break; }
		case 5:{ control_point[1]-=1; break; }
		case 6:{ control_point[2]-=1; break; }
		case 7:{ prediction_point-=1; break; }
		case 8:{ x_speed_rate-=0.1; break; }
		case 9:{ auto_control_point_normalize_range[0]-=5; break; }
		case 10:{ auto_control_point_normalize_range[1]-=5; break; }
	}
	if(zebra_enable_flag > 1)
	{
		zebra_enable_flag = 1;
	}
}

/* 菜单圆环循线数据页面服务 */
void menu_circle_path_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ circle_enable_flag+=1; break; }
		case 1:{ circle_y_speed_target[plan_idx]+=5; break; }
		case 2:{ circle_angular_speed_target[plan_idx]+=1; break; }
		case 3:{ circle_check_y+=1; break; }
		case 4:{ circle_angle_target[0]+=1; break; }
		case 5:{ circle_angle_target[1]+=1; break; }
		case 6:{ side_extract_start_y+=1; break; }
		case 7:{ side_extract_end_y+=1; break; }
		case 8:{ circle_in_distance_limit+=1.0; break; }
		case 9:{ circle_out_distance_limit+=1.0; break; }			
	}
	if(circle_enable_flag > 1)
	{
		circle_enable_flag = 0;
	}
}
void menu_circle_path_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ circle_enable_flag-=1; break; }
		case 1:{ circle_y_speed_target[plan_idx]-=5; break; }
		case 2:{ circle_angular_speed_target[plan_idx]-=1; break; }
		case 3:{ circle_check_y-=1; break; }
		case 4:{ circle_angle_target[0]-=1; break; }
		case 5:{ circle_angle_target[1]-=1; break; }
		case 6:{ side_extract_start_y-=1; break; }
		case 7:{ side_extract_end_y-=1; break; }	
		case 8:{ circle_in_distance_limit-=1.0; break; }
		case 9:{ circle_out_distance_limit-=1.0; break; }			
	}
	if(circle_enable_flag > 1)
	{
		circle_enable_flag = 1;
	}
}

/* 菜单电机1 PID页面服务 */
void menu_motor_1_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ wheel_speed_target[0]+=5; break; }
		#ifndef FUZZY_SPEED_AND_CURRENT
		case 1:{ MOTOR_1_PID[0]+=0.001; break; }
		case 2:{ MOTOR_1_PID[1]+=0.0001; break; }
		case 3:{ MOTOR_1_PID[2]+=0.01; break; }
		case 4:{ MOTOR_1_PID[3]+=5; break; }
		case 5:{ MOTOR_1_PID[4]+=0.1; break; }
		#endif
		case 6:{ I_1_PID[0]+=10; break; }
		case 7:{ I_1_PID[1]+=10; break; }
		case 8:{ I_1_PID[2]+=10; break; }
		case 9:{ I_1_PID[3]+=5; break; }
		case 10:{ I_1_PID[4]+=100; break; }
	}
}
void menu_motor_1_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ wheel_speed_target[0]-=5; break; }
		#ifndef FUZZY_SPEED_AND_CURRENT
		case 1:{ MOTOR_1_PID[0]-=0.001; break; }
		case 2:{ MOTOR_1_PID[1]-=0.0001; break; }
		case 3:{ MOTOR_1_PID[2]-=0.01; break; }
		case 4:{ MOTOR_1_PID[3]-=5; break; }
		case 5:{ MOTOR_1_PID[4]-=0.1; break; }
		#endif
		case 6:{ I_1_PID[0]-=10; break; }
		case 7:{ I_1_PID[1]-=10; break; }
		case 8:{ I_1_PID[2]-=10; break; }
		case 9:{ I_1_PID[3]-=5; break; }
		case 10:{ I_1_PID[4]-=100; break; }
	}
}

/* 菜单电机2 PID页面服务 */
void menu_motor_2_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ wheel_speed_target[1]+=5; break; }
		#ifndef FUZZY_SPEED_AND_CURRENT
		case 1:{ MOTOR_2_PID[0]+=0.0001; break; }
		case 2:{ MOTOR_2_PID[1]+=0.0001; break; }
		case 3:{ MOTOR_2_PID[2]+=0.0001; break; }
		case 4:{ MOTOR_2_PID[3]+=5; break; }
		case 5:{ MOTOR_2_PID[4]+=0.1; break; }
		#endif
		case 6:{ I_2_PID[0]+=10; break; }
		case 7:{ I_2_PID[1]+=10; break; }
		case 8:{ I_2_PID[2]+=10; break; }
		case 9:{ I_2_PID[3]+=5; break; }
		case 10:{ I_2_PID[4]+=100; break; }
	}
}
void menu_motor_2_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ wheel_speed_target[1]-=5; break; }
		#ifndef FUZZY_SPEED_AND_CURRENT
		case 1:{ MOTOR_2_PID[0]-=0.0001; break; }
		case 2:{ MOTOR_2_PID[1]-=0.0001; break; }
		case 3:{ MOTOR_2_PID[2]-=0.0001; break; }
		case 4:{ MOTOR_2_PID[3]-=5; break; }
		case 5:{ MOTOR_2_PID[4]-=0.1; break; }
		#endif
		case 6:{ I_2_PID[0]-=10; break; }
		case 7:{ I_2_PID[1]-=10; break; }
		case 8:{ I_2_PID[2]-=10; break; }
		case 9:{ I_2_PID[3]-=5; break; }
		case 10:{ I_2_PID[4]-=100; break; }
	}
}


/* 菜单电机3 PID页面服务 */
void menu_motor_3_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ wheel_speed_target[2]+=5; break; }
		#ifndef FUZZY_SPEED_AND_CURRENT
		case 1:{ MOTOR_3_PID[0]+=0.1; break; }
		case 2:{ MOTOR_3_PID[1]+=0.01; break; }
		case 3:{ MOTOR_3_PID[2]+=0.01; break; }
		case 4:{ MOTOR_3_PID[3]+=5; break; }
		case 5:{ MOTOR_3_PID[4]+=5; break; }
		#endif
		case 6:{ I_3_PID[0]+=0.1; break; }
		case 7:{ I_3_PID[1]+=0.01; break; }
		case 8:{ I_3_PID[2]+=0.01; break; }
		case 9:{ I_3_PID[3]+=5; break; }
		case 10:{ I_3_PID[4]+=5; break; }
	}
}
void menu_motor_3_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ wheel_speed_target[2]-=5; break; }
		#ifndef FUZZY_SPEED_AND_CURRENT
		case 1:{ MOTOR_3_PID[0]-=0.1; break; }
		case 2:{ MOTOR_3_PID[1]-=0.01; break; }
		case 3:{ MOTOR_3_PID[2]-=0.01; break; }
		case 4:{ MOTOR_3_PID[3]-=5; break; }
		case 5:{ MOTOR_3_PID[4]-=5; break; }
		#endif
		case 6:{ I_3_PID[0]-=0.1; break; }
		case 7:{ I_3_PID[1]-=0.01; break; }
		case 8:{ I_3_PID[2]-=0.01; break; }
		case 9:{ I_3_PID[3]-=5; break; }
		case 10:{ I_3_PID[4]-=5; break; }
	}
}


/* 菜单循迹 PID页面服务 */
void menu_path_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_PATH_PID.pid_kind.data_uint8+=1; break; }
		case 1:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][0]+=0.005; break; }
		case 2:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][1]+=0.005; break; }
		case 3:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][2]+=0.005; break; }
		case 4:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][3]+=0.005; break; }
		case 5:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][4]+=0.005; break; }
		case 6:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][5]+=0.005; break; }
	}
	if(MENU_PATH_PID.pid_kind.data_uint8 > 3)
	{
		MENU_PATH_PID.pid_kind.data_uint8 = 0;
	}
}
void menu_path_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_PATH_PID.pid_kind.data_uint8-=1; break; }
		case 1:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][0]-=0.005; break; }
		case 2:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][1]-=0.005; break; }
		case 3:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][2]-=0.005; break; }
		case 4:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][3]-=0.005; break; }
		case 5:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][4]-=0.005; break; }
		case 6:{ PATH_PID[plan_idx][MENU_PATH_PID.pid_kind.data_uint8][5]-=0.005; break; }
	}
	if(MENU_PATH_PID.pid_kind.data_uint8 > 3)
	{
		MENU_PATH_PID.pid_kind.data_uint8 = 3;
	}
}

/*************************************************************************/