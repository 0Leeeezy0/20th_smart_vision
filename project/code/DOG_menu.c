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

#include "common.h"

/* 页面列表 */
static _MENU_PAGE_ menu_page[] = 
{
	/* 页面名称         标题使能     级别 序号    参数行数   页面函数指针 						调试模式*/
	{"ROOT"         	,FALSE 		,0 	,0 		,23 	,menu_root_page						,NONE},
	{"START"        	,TRUE 		,1 	,0 		,0 		,start								,NONE},
	{"DEBUG"        	,TRUE 		,1 	,1 		,0 		,debug								,NONE},
	{"SAVE"        		,TRUE 		,1 	,2 		,0 		,save								,NONE},
	{"LOAD"				,TRUE 		,1 	,3 		,0 		,load								,NONE},
	{"CLI"				,TRUE 		,1 	,4 		,0 		,cli								,NONE},
	{"CALIBRATE"		,TRUE 		,1 	,5 		,0 		,sensor_calibrate					,NONE},
	{"ENCODER"			,TRUE 		,1 	,6 		,0 		,menu_encoder_page					,NONE},
	{"MOTOR"			,TRUE 		,1 	,7 		,9		,menu_motor_page					,NONE},
	{"GYRO_ACC"			,TRUE 		,1 	,8 		,0 		,menu_gyro_acc_page					,NONE},
	{"EULER_ANGLE"      ,TRUE		,1	,9		,0		,menu_euler_angle_page				,NONE},
	{"TRANSLATE_SHIFT"	,TRUE		,1	,10		,0		,menu_translate_shift_page			,NONE},
	{"RECTIFICATE"		,TRUE		,1	,11		,0		,menu_symmetry_rectificate_page		,NONE},
	{"AI_CAMERA_0"		,TRUE		,1	,12		,5		,menu_ai_camera_0_page				,NONE},
	{"AI_CAMERA_1&2"	,TRUE		,1	,13		,2		,menu_ai_camera_1_and_2_page		,NONE},
	{"DETECTION_LIST"	,TRUE		,1	,14		,0		,menu_detection_list				,NONE},
	{"CHASSIS"			,TRUE 		,1 	,15 	,5 		,menu_chassis_page					,NONE},
	{"PATH"				,TRUE		,1	,16		,9		,menu_path_page						,NONE},
	{"CIRCLE_PATH"		,TRUE		,1	,17		,13		,menu_circle_path_page				,NONE},
	{"MOTOR_1 PID"		,TRUE 		,1 	,18 	,12 	,menu_motor_1_pid_page				,NONE},
	{"MOTOR_2 PID"		,TRUE 		,1 	,19 	,12 	,menu_motor_2_pid_page				,NONE},
	{"MOTOR_3 PID"		,TRUE 		,1 	,20 	,12 	,menu_motor_3_pid_page				,NONE},
	{"PATH PID"			,TRUE 		,1 	,21 	,7 		,menu_path_pid_page					,NONE},
	{"ROTATE_PID"		,TRUE		,1	,22		,6		,menu_rotate_angle_pid_page			,NONE}
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
	
	key_init(10);
	ips200_init(IPS200_TYPE_SPI);
	pit_ms_init (MENU_KEY_SCAN_IT_CH, MENU_KEY_SCAN_IT_TIME);
	pit_enable(MENU_KEY_SCAN_IT_CH);
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
	system_delay_ms(1000);
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
		case 0:{ screen_string(50,0,"BAT:"); screen_float(80,0,bat_voltage,2,1); break; }
		case 1:{ screen_string(155,0,"BAT:"); screen_float(190,0,bat_voltage,2,1); break; }
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
				system_delay_ms(50);
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
		chassis_motion_flag = CHASSIS_STOP;
		// 停止解算
		euler_angle_flag = FALSE;
		translate_shift_flag = FALSE;
		
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
		
		if(bat_voltage < BAT_VOLTAGE_WARNING && bat_voltage > 5)
		{
			pwm_init(BUZZER_PIN, 600, PWM_DUTY_MAX / 2);
		}
	}
}

/**********************************************************************/

/****************************** 菜单页面 ******************************/
/* 启动 */
void start(void)
{
	menu_page_init(start);
	
	system_delay_ms(500);
	
	// 识别结果列表初始化
	ai_camera_detection_result_list_num = 0;
	memset(ai_camera_detection_result_list, 0, sizeof(ai_camera_detection_result_list));
	
	// 标志位初始化
	flag_init();
	// 变量初始化
	variable_init();
	
	// 这里加延时，防止计时未完成初始化
	system_delay_ms(500);
	
	zebra_crossing_path_element_judge_start_time_count_flag = TRUE;
	speed_control_time_count_flag = TRUE;
		
	while(1)
	{
		program_time_count = 0;
		menu_back(menu_start_page_back_service);
		menu_point();
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		control_mode_dispatch();
		screen_float(DATA_MAX_COL,2*MT9V03X_H+4*MENU_ROW_PITCH,1000.0/(float)program_time_count,3,3);
	}
}

/* 调试 */
void debug(void)
{
	menu_page_init(debug);
	
	system_delay_ms(500);
	
	// 识别结果列表初始化
	ai_camera_detection_result_list_num = 0;
	memset(ai_camera_detection_result_list, 0, sizeof(ai_camera_detection_result_list));
	
	// 标志位初始化
	flag_init();
	// 变量初始化
	variable_init();
	
	// 这里加延时，防止计时未完成初始化
	system_delay_ms(500);
	
	zebra_crossing_path_element_judge_start_time_count_flag = TRUE;
	speed_control_time_count_flag = TRUE;
		
	while(1)
	{
		program_time_count = 0;
		menu_back(menu_debug_page_back_service);
		menu_point();
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		control_mode_dispatch();
		
		/* 实时数据 */
		screen_draw_line(MT9V03X_W/2+path_err, MENU_ROW_PITCH, MT9V03X_W/2+path_err, MENU_ROW_PITCH+2*MT9V03X_H,RGB565_RED);
		screen_image(0, MENU_ROW_PITCH, image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_image(0, MT9V03X_H+MENU_ROW_PITCH, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		// 红线，边线提取起始截止线
		screen_draw_line(0, MENU_ROW_PITCH+side_extract_start_y, MT9V03X_W, MENU_ROW_PITCH+side_extract_start_y ,RGB565_RED);
		screen_draw_line(0, MENU_ROW_PITCH+side_extract_end_y, MT9V03X_W, MENU_ROW_PITCH+side_extract_end_y ,RGB565_RED);
		// 绿色，圆环检测线
		screen_draw_line(0, MENU_ROW_PITCH+circle_check_y, MT9V03X_W, MENU_ROW_PITCH+circle_check_y ,RGB565_GREEN);
		// 蓝色，循线起始截止线
		screen_draw_line(0, MENU_ROW_PITCH+path_start, MT9V03X_W, MENU_ROW_PITCH+path_start ,RGB565_BLUE);
		screen_draw_line(0, MENU_ROW_PITCH+path_start-control_point[path_follow_kind_flag], MT9V03X_W, MENU_ROW_PITCH+path_start-control_point[path_follow_kind_flag] ,RGB565_BLUE);
		
		// 边线点
		for(int i = 0;i < L_side_point_num;i++)
		{
			if(L_side[i][0] <= MT9V03X_W && L_side[i][0] >= 0 && L_side[i][1] <= MT9V03X_H && L_side[i][1] >= 0)
			{
				screen_draw_point(L_side[i][0], MT9V03X_H+MENU_ROW_PITCH+L_side[i][1], RGB565_RED);
			}
		}
		for(int i = 0;i < R_side_point_num;i++)
		{
			if(R_side[i][0] <= MT9V03X_W && R_side[i][0] >= 0 && R_side[i][1] <= MT9V03X_H && R_side[i][1] >= 0)
			{
				screen_draw_point(R_side[i][0], MT9V03X_H+MENU_ROW_PITCH+R_side[i][1], RGB565_RED);
			}
		}
		
		// 左弯点数 循线误差 右弯点数
		screen_int(0,2*MT9V03X_H+MENU_ROW_PITCH,L_bend_point_num,3);
		screen_int(DATA_MAX_COL/2,2*MT9V03X_H+MENU_ROW_PITCH,path_err,3);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+MENU_ROW_PITCH,R_bend_point_num,3);
		
		// 左边框点数 循线算法类型 右边框点数
		screen_int(0,2*MT9V03X_H+2*MENU_ROW_PITCH,L_frame_point_num,3);
		screen_int(DATA_MAX_COL/2,2*MT9V03X_H+2*MENU_ROW_PITCH,path_follow_kind_flag,3);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+2*MENU_ROW_PITCH,R_frame_point_num,3);
		
		// 左边线点数 灰度值 右边线点数
		screen_int(0,2*MT9V03X_H+3*MENU_ROW_PITCH,L_side_point_num,3);
		screen_uint(DATA_MAX_COL/2,2*MT9V03X_H+3*MENU_ROW_PITCH,grayscale,4);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+3*MENU_ROW_PITCH,R_side_point_num,3);
		
		// 位移距离 赛道归一化曲率 帧率
		screen_float(0,2*MT9V03X_H+4*MENU_ROW_PITCH,shift_distance,3,3);
		screen_float(DATA_MAX_COL/2,2*MT9V03X_H+4*MENU_ROW_PITCH,path_err_normalization,1,4);
		screen_float(DATA_MAX_COL,2*MT9V03X_H+4*MENU_ROW_PITCH,1000.0/(float)program_time_count,3,3);
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

/* 命令行 */
void cli(void)
{
	menu_page_init(cli);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		debug_cli_init();
		cli_service_start();
	}
}

/* 传感器校准 */
void sensor_calibrate(void)
{
	menu_page_init(sensor_calibrate);
	system_delay_ms(1000);
	// 开始陀螺仪、加速度计校准
	gyro_calibration_flag = FALSE;
	acc_calibration_flag = FALSE;
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		if(gyro_calibration_flag && acc_calibration_flag)
		{
			menu_root_page();
		}
		else
		{
			screen_string(0,MENU_ROW_PITCH,"KEEP STOP     ");
		}
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
		debug_service(menu_page[num].debug_mode);
	
		MENU_ENCODER.encoder_1_count.data_int16 = encoder_1_count;
		MENU_ENCODER.encoder_2_count.data_int16 = encoder_2_count;
		MENU_ENCODER.encoder_3_count.data_int16 = encoder_3_count;
		MENU_ENCODER.encoder_1_speed.data_float = encoder_1_speed;
		MENU_ENCODER.encoder_2_speed.data_float = encoder_2_speed;
		MENU_ENCODER.encoder_3_speed.data_float = encoder_3_speed;
	
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
	}
}

/* 菜单电机页面 */
void menu_motor_page(void)
{	
	menu_page_init(menu_motor_page);
	while(1)
	{
		chassis_motion_flag = CHASSIS_DEBUG;
		
		menu_back(NULL);
		menu_point();
		menu_title_show();	
		debug_service(menu_page[num].debug_mode);
		
		menu_data_change(menu_motor_data_add_service,menu_motor_data_reduce_service);
		
		MENU_MOTOR.motor_1_dir.data_int16 = chassis_control.motor_1.dir;
		MENU_MOTOR.motor_1_duty.data_int16 = chassis_control.motor_1.duty;
		MENU_MOTOR.motor_2_dir.data_int16 = chassis_control.motor_2.dir;
		MENU_MOTOR.motor_2_duty.data_int16 = chassis_control.motor_2.duty;
		MENU_MOTOR.motor_3_dir.data_int16 = chassis_control.motor_3.dir;
		MENU_MOTOR.motor_3_duty.data_int16 = chassis_control.motor_3.duty;
		MENU_MOTOR.motor_1_speed.data_float = motor_1_speed;
		MENU_MOTOR.motor_2_speed.data_float = motor_2_speed;
		MENU_MOTOR.motor_3_speed.data_float = motor_3_speed;
		MENU_MOTOR.motor_1_I.data_float = motor_1_I;
		MENU_MOTOR.motor_2_I.data_float = motor_2_I;
		MENU_MOTOR.motor_3_I.data_float = motor_3_I;
	
		// 调整电机方向及PWM
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR.motor_1_dir.name);
		screen_int(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR.motor_1_dir.data_int16,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR.motor_1_duty.name);
		screen_int(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR.motor_1_duty.data_int16,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR.motor_2_dir.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR.motor_2_dir.data_int16,1);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR.motor_2_duty.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR.motor_2_duty.data_int16,4);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR.motor_3_dir.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR.motor_3_dir.data_int16,1);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR.motor_3_duty.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR.motor_3_duty.data_int16,4);
		
		// 显示电机转速
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.data_float,4,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.data_float,4,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.data_float,4,3);
		
		// 显示电机转电流
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR.motor_1_I.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR.motor_1_I.data_float,4,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR.motor_2_I.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR.motor_2_I.data_float,4,3);
		
		screen_string(0,12*MENU_ROW_PITCH,MENU_MOTOR.motor_3_I.name);
		screen_float(DATA_MAX_COL,12*MENU_ROW_PITCH,MENU_MOTOR.motor_3_I.data_float,4,3);
		
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
		debug_service(menu_page[num].debug_mode);
		
		MENU_GYRO_ACC.gyro_x.data_float = gyro_x;
		MENU_GYRO_ACC.gyro_y.data_float = gyro_y;
		MENU_GYRO_ACC.gyro_z.data_float = gyro_z;
		MENU_GYRO_ACC.acc_x.data_float = acc_x;
		MENU_GYRO_ACC.acc_y.data_float = acc_y;
		MENU_GYRO_ACC.acc_z.data_float = acc_z;
	
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
		debug_service(menu_page[num].debug_mode);
	
		euler_angle_flag = TRUE;
		
		MENU_EULER_ANGLE.roll.data_float = roll;
		MENU_EULER_ANGLE.pitch.data_float = pitch;
		MENU_EULER_ANGLE.yaw.data_float = yaw;
	
		// 显示陀螺仪
		screen_string(0,MENU_ROW_PITCH,MENU_EULER_ANGLE.roll.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_EULER_ANGLE.roll.data_float,3,3);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_EULER_ANGLE.pitch.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_EULER_ANGLE.pitch.data_float,3,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_EULER_ANGLE.yaw.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_EULER_ANGLE.yaw.data_float,4,2);
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
		debug_service(menu_page[num].debug_mode);
		
		translate_shift_flag = TRUE;
		
		MENU_SHIFT.shift_yaw.data_float = shift_yaw;
		MENU_SHIFT.shift_distance.data_float = shift_distance;
		
		// 显示位移解算
		screen_string(0,MENU_ROW_PITCH,MENU_SHIFT.shift_yaw.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_SHIFT.shift_yaw.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_SHIFT.shift_distance.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_SHIFT.shift_distance.data_float,3,3);
		
		screen_string(0,4*MENU_ROW_PITCH,"WHEEL_1_SHIFT");
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,wheel_1_shift,3,3);
		
		screen_string(0,5*MENU_ROW_PITCH,"WHEEL_2_SHIFT");
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,wheel_2_shift,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,"WHEEL_3_SHIFT");
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,wheel_3_shift,3,3);
		
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
		debug_service(menu_page[num].debug_mode);
		
		threshold(mt9v03x_image);
		screen_image(0, MENU_ROW_PITCH, image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_image(0, MT9V03X_H+MENU_ROW_PITCH, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		symmetry_rectificate();
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
		debug_service(menu_page[num].debug_mode);
		
		MENU_AI_CAMERA_0.ai_camera_0_enable_flag.data_uint8 = ai_camera_0_enable_flag;
		MENU_AI_CAMERA_0.track_linear_speed_target.data_float = track_linear_speed_target;
		MENU_AI_CAMERA_0.detection_box_width_limit.data_int16 = detection_box_width_limit;
		MENU_AI_CAMERA_0.detection_box_width_std.data_int16 = detection_box_width_std;
		MENU_AI_CAMERA_0.detection_box_center_limit.data_int16 = detection_box_center_limit;
		
		// 显示MCXVISION摄像头数据
		screen_string(0,MENU_ROW_PITCH,MENU_AI_CAMERA_0.ai_camera_0_enable_flag.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_AI_CAMERA_0.ai_camera_0_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_AI_CAMERA_0.track_linear_speed_target.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_AI_CAMERA_0.track_linear_speed_target.data_float,2,4);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_limit.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_limit.data_int16,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_std.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_std.data_int16,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_center_limit.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_center_limit.data_int16,3);
		
		screen_string(0,7*MENU_ROW_PITCH,"CENTER_X");
		screen_int(DATA_MAX_COL,7*MENU_ROW_PITCH,track_x_center,3);
		
		screen_string(0,8*MENU_ROW_PITCH,"BOX_WIDTH");
		screen_int(DATA_MAX_COL,8*MENU_ROW_PITCH,detection_box_width,3);
		
		screen_string(0,9*MENU_ROW_PITCH,"TRACK_ERR");
		screen_int(DATA_MAX_COL,9*MENU_ROW_PITCH,track_x_center-MT9V03X_W/2,3);
	}
}

/* AI摄像头1和2 数据页面 */
void menu_ai_camera_1_and_2_page(void)
{
	menu_page_init(menu_ai_camera_1_and_2_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_ai_camera_1_and_2_data_add_service,menu_ai_camera_1_and_2_data_reduce_service);
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.data_uint8 = supplement_lamp_enable_flag;
		MENU_AI_CAMERA_1_2.supplement_lamp_color.data_uint8 = supplement_lamp_color;
		
		screen_string(0,MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.supplement_lamp_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.supplement_lamp_color.name);
		screen_uint(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.supplement_lamp_color.data_uint8,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_AI_CAMERA_1_2.detection_result.name);
		if(ai_camera_detection_result.result_kind == 0)
		{
			switch(ai_camera_detection_result.lable)
			{
				case wrench:{ screen_string(0,5*MENU_ROW_PITCH,"WRENCH        "); break; }
				case soldering_iron:{ screen_string(0,5*MENU_ROW_PITCH,"SOLDERING_IRON"); break; }
				case electrodrill:{ screen_string(0,5*MENU_ROW_PITCH,"ELECTRODRILL  "); break; }
				case tape_measure:{ screen_string(0,5*MENU_ROW_PITCH,"TAPE_MEASURE  "); break; }
				case screwdriver:{ screen_string(0,5*MENU_ROW_PITCH,"SCREWDRIVER   "); break; }
				case pliers:{ screen_string(0,5*MENU_ROW_PITCH,"PLIERS        "); break; }
				case oscillograph:{ screen_string(0,5*MENU_ROW_PITCH,"OSCILLOGRAPH  "); break; }
				case multimeter:{ screen_string(0,5*MENU_ROW_PITCH,"MULTIMETER    "); break; }
				case printer:{ screen_string(0,5*MENU_ROW_PITCH,"PRINTER       "); break; }
				case keyboard:{ screen_string(0,5*MENU_ROW_PITCH,"KEYBOARD      "); break; }
				case mobilephone:{ screen_string(0,5*MENU_ROW_PITCH,"MOBILEPHONE   "); break; }
				case mouse:{ screen_string(0,5*MENU_ROW_PITCH,"MOUSE         "); break; }
				case headphones:{ screen_string(0,5*MENU_ROW_PITCH,"HEADPHONES    "); break; }
				case monitor:{ screen_string(0,5*MENU_ROW_PITCH,"MONITOR       "); break; }
				case speaker:{ screen_string(0,5*MENU_ROW_PITCH,"SPEAKER       "); break; }
			}
		}
		else if(ai_camera_detection_result.result_kind == 1)
		{
			screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,ai_camera_detection_result.num,3);
		}
		
		screen_string(0,6*MENU_ROW_PITCH,"DETECTION_RAW_DATA");
		screen_uint(DATA_MAX_COL+20,6*MENU_ROW_PITCH,ai_camera_1_data_raw,3);
		screen_uint(DATA_MAX_COL+50,6*MENU_ROW_PITCH,ai_camera_2_data_raw,3);
	}
}

/* AI识别列表页面 */
void menu_detection_list(void)
{
	menu_page_init(menu_detection_list);
	
	int8 detection_list_page_num = 0;
	int8 row_num = MAX_ROW-2;
	
	while(1)
	{
		menu_back(NULL);
		menu_point();
		debug_service(menu_page[num].debug_mode);
		
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
		
		if(detection_list_page_num > ROUND(ai_camera_detection_result_list_num,row_num))
			detection_list_page_num = 0;
		else if(detection_list_page_num < 0)
			detection_list_page_num = ROUND(ai_camera_detection_result_list_num,row_num);
		
		// 支持无限页数
		for(int i = 0;i < ai_camera_detection_result_list_num;i++)
		{
			if(i >= detection_list_page_num*(MAX_ROW-2) && i < (detection_list_page_num+1)*(MAX_ROW-2))
			{
				screen_int(0,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,i,3);
				if(ai_camera_detection_result_list[i].result_kind == 0)
				{
					switch(ai_camera_detection_result_list[i].lable)
					{
						case wrench:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"WRENCH"); break; }
						case soldering_iron:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"SOLDERING_IRON"); break; }
						case electrodrill:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"ELECTRODRILL"); break; }
						case tape_measure:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"TAPE_MEASURE"); break; }
						case screwdriver:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"SCREWDRIVER"); break; }
						case pliers:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"PLIERS"); break; }
						case oscillograph:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"OSCILLOGRAPH"); break; }
						case multimeter:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MULTIMETER"); break; }
						case printer:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"PRINTER"); break; }
						case keyboard:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"KEYBOARD"); break; }
						case mobilephone:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MOBILEPHONE"); break; }
						case mouse:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MOUSE"); break; }
						case headphones:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"HEADPHONES"); break; }
						case monitor:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"MONITOR"); break; }
						case speaker:{ screen_string(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,"SPEAKER"); break; }
					}
				}
				else if(ai_camera_detection_result_list[i].result_kind == 1)
				{
					screen_int(50,(i%(MAX_ROW-2)+1)*MENU_ROW_PITCH,ai_camera_detection_result_list[i].num,3);
				}
			}
		}
	}
}

/* 菜单底盘数据页面 */
void menu_chassis_page(void)
{
	menu_page_init(menu_chassis_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_chassis_data_add_service,menu_chassis_data_reduce_service);
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		MENU_CHASSIS.motion_kind.data_uint8 = chassis_motion_flag;
		MENU_CHASSIS.chassis_yaw.data_float = chassis_yaw;
		MENU_CHASSIS.linear_speed.data_float = chassis_linear_speed;
		MENU_CHASSIS.angular_speed.data_float = chassis_angular_speed;
		MENU_CHASSIS.rotate_angle.data_float = chassis_rotate_angle;

		// 显示底盘数据
		screen_string(0,MENU_ROW_PITCH,MENU_CHASSIS.motion_kind.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_CHASSIS.motion_kind.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_CHASSIS.chassis_yaw.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_CHASSIS.chassis_yaw.data_float,3,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_CHASSIS.linear_speed.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_CHASSIS.linear_speed.data_float,2,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_CHASSIS.angular_speed.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_CHASSIS.angular_speed.data_float,2,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_CHASSIS.rotate_angle.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_CHASSIS.rotate_angle.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,"EULER_YAW");
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,yaw,3,3);
		
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
		debug_service(menu_page[num].debug_mode);
		
		MENU_PATH.linear_speed_target_pre.data_float = path_linear_speed_target[0];
		MENU_PATH.linear_speed_target_min.data_float = path_linear_speed_target[1];
		MENU_PATH.linear_speed_target_max.data_float = path_linear_speed_target[2];
		MENU_PATH.path_start.data_int16 = path_start;
		MENU_PATH.path_end.data_int16 = path_end;
		MENU_PATH.control_point_0.data_int16 = control_point[0];
		MENU_PATH.control_point_1.data_int16 = control_point[1];
		MENU_PATH.prediction_point.data_int16 = prediction_point;
		MENU_PATH.x_speed_rate.data_float = x_speed_rate;
	
		// 显示循线数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH.linear_speed_target_pre.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_PATH.linear_speed_target_pre.data_float,3,3);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH.linear_speed_target_min.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_PATH.linear_speed_target_min.data_float,3,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH.linear_speed_target_max.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_PATH.linear_speed_target_max.data_float,3,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH.path_start.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_PATH.path_start.data_int16,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH.path_end.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_PATH.path_end.data_int16,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_PATH.control_point_0.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_PATH.control_point_0.data_int16,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_PATH.control_point_1.name);
		screen_int(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_PATH.control_point_1.data_int16,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_PATH.prediction_point.name);
		screen_int(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_PATH.prediction_point.data_int16,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_PATH.x_speed_rate.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_PATH.x_speed_rate.data_float,1,1);
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
		debug_service(menu_page[num].debug_mode);
		
		MENU_CIRCLE_PATH.circle_path_enable_flag.data_uint8 = circle_path_enable_flag;
		MENU_CIRCLE_PATH.circle_path_linear_speed_target.data_float = circle_path_linear_speed_target;
		MENU_CIRCLE_PATH.circle_check_y.data_int16 = circle_check_y;
		MENU_CIRCLE_PATH.circle_in_linear_speed_target.data_float = circle_in_linear_speed_target;
		MENU_CIRCLE_PATH.circle_in_angular_speed_target.data_float = circle_in_angular_speed_target;
		MENU_CIRCLE_PATH.circle_in_angle.data_int16 = circle_in_angle;
		MENU_CIRCLE_PATH.circle_out_linear_speed_target.data_float = circle_out_linear_speed_target;
		MENU_CIRCLE_PATH.circle_out_angular_speed_target.data_float = circle_out_angular_speed_target;
		MENU_CIRCLE_PATH.circle_out_angle.data_int16 = circle_out_angle;
		MENU_CIRCLE_PATH.side_extract_start.data_int16 = side_extract_start_y;
		MENU_CIRCLE_PATH.side_extract_end.data_int16 = side_extract_end_y;
		MENU_CIRCLE_PATH.side_X_delta_max_limit.data_int16 = side_X_delta_limit[0];
		MENU_CIRCLE_PATH.side_X_delta_max_limit.data_int16 = side_X_delta_limit[1];
	
		// 显示圆环循线数据
		screen_string(0,MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_path_enable_flag.name);
		screen_int(DATA_MAX_COL,MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_path_enable_flag.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_path_linear_speed_target.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_path_linear_speed_target.data_float,3,2);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_check_y.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_check_y.data_int16,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_linear_speed_target.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_linear_speed_target.data_float,3,2);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_angular_speed_target.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_angular_speed_target.data_float,3,2);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_angle.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_in_angle.data_int16,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_linear_speed_target.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_linear_speed_target.data_float,3,2);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_angular_speed_target.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_angular_speed_target.data_float,3,2);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_angle.name);
		screen_int(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_CIRCLE_PATH.circle_out_angle.data_int16,3);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_start.name);
		screen_int(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_start.data_int16,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_end.name);
		screen_int(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_extract_end.data_int16,3);
		
		screen_string(0,12*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_X_delta_max_limit.name);
		screen_int(DATA_MAX_COL,12*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_X_delta_max_limit.data_int16,3);
		
		screen_string(0,13*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_X_delta_min_limit.name);
		screen_int(DATA_MAX_COL,13*MENU_ROW_PITCH,MENU_CIRCLE_PATH.side_X_delta_min_limit.data_int16,3);
	}
}

/* 菜单电机1 PID页面 */
void menu_motor_1_pid_page(void)
{
	menu_page_init(menu_motor_1_pid_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_motor_1_pid_add_service,menu_motor_1_pid_reduce_service);
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		chassis_motion_flag = CHASSIS_DEBUG;
		MENU_MOTOR_1_PID.motor_target.data_uint16 = chassis_control.motor_1_speed;
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.data_float = chassis_pid.motor_1_speed_pid_parameters.p;
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.data_float = chassis_pid.motor_1_speed_pid_parameters.i;
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.data_float = chassis_pid.motor_1_speed_pid_parameters.d;
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.data_float = chassis_pid.motor_1_speed_pid_parameters.output_limit;
		MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.data_float = chassis_pid.motor_1_speed_pid_parameters.i_limit;
		
		MENU_MOTOR_1_PID.MOTOR_I_PID.p.data_float = chassis_pid.motor_1_I_pid_parameters.p;
		MENU_MOTOR_1_PID.MOTOR_I_PID.i.data_float = chassis_pid.motor_1_I_pid_parameters.i;
		MENU_MOTOR_1_PID.MOTOR_I_PID.d.data_float = chassis_pid.motor_1_I_pid_parameters.d;
		MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.data_float = chassis_pid.motor_1_I_pid_parameters.output_limit;
		MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.data_float = chassis_pid.motor_1_I_pid_parameters.i_limit;
	
		// 显示电机1 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_1_PID.control_mode.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR_1_PID.control_mode.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.motor_target.name);
		screen_uint(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.motor_target.data_uint16,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.p.data_float,3,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i.data_float,3,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.d.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.output_limit.data_float,5,1);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_SPEED_PID.i_limit.data_float,3,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.p.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.p.data_float,3,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i.data_float,3,3);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.d.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.d.data_float,3,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.output_limit.data_float,5,1);
		
		screen_string(0,12*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.name);
		screen_float(DATA_MAX_COL,12*MENU_ROW_PITCH,MENU_MOTOR_1_PID.MOTOR_I_PID.i_limit.data_float,3,3);
		
		if(MENU_MOTOR_1_PID.control_mode.data_uint8 != 0)
			chassis_control.motor_1 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_1,chassis_control.motor_1_speed).motor_1;
		else
			chassis_control.motor_1.duty = 0;
	}
}

/* 菜单电机2 PID页面 */
void menu_motor_2_pid_page(void)
{
	menu_page_init(menu_motor_2_pid_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_motor_2_pid_add_service,menu_motor_2_pid_reduce_service);
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		chassis_motion_flag = CHASSIS_DEBUG;
		MENU_MOTOR_2_PID.motor_target.data_uint16 = chassis_control.motor_2_speed;
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.data_float = chassis_pid.motor_2_speed_pid_parameters.p;
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.data_float = chassis_pid.motor_2_speed_pid_parameters.i;
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.data_float = chassis_pid.motor_2_speed_pid_parameters.d;
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.data_float = chassis_pid.motor_2_speed_pid_parameters.output_limit;
		MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.data_float = chassis_pid.motor_2_speed_pid_parameters.i_limit;
		
		MENU_MOTOR_2_PID.MOTOR_I_PID.p.data_float = chassis_pid.motor_2_I_pid_parameters.p;
		MENU_MOTOR_2_PID.MOTOR_I_PID.i.data_float = chassis_pid.motor_2_I_pid_parameters.i;
		MENU_MOTOR_2_PID.MOTOR_I_PID.d.data_float = chassis_pid.motor_2_I_pid_parameters.d;
		MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.data_float = chassis_pid.motor_2_I_pid_parameters.output_limit;
		MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.data_float = chassis_pid.motor_2_I_pid_parameters.i_limit;
	
		// 显示电机2 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_2_PID.control_mode.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR_2_PID.control_mode.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.motor_target.name);
		screen_uint(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.motor_target.data_uint16,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.p.data_float,3,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i.data_float,3,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.d.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.output_limit.data_float,5,1);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_SPEED_PID.i_limit.data_float,3,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.p.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.p.data_float,3,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i.data_float,3,3);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.d.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.d.data_float,3,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.output_limit.data_float,5,1);
		
		screen_string(0,12*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.name);
		screen_float(DATA_MAX_COL,12*MENU_ROW_PITCH,MENU_MOTOR_2_PID.MOTOR_I_PID.i_limit.data_float,3,3);
		
		if(MENU_MOTOR_2_PID.control_mode.data_uint8 != 0)
			chassis_control.motor_2 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_2,chassis_control.motor_2_speed).motor_2;
		else
			chassis_control.motor_2.duty = 0;
	}
}

/* 菜单电机3 PID页面 */
void menu_motor_3_pid_page(void)
{
	menu_page_init(menu_motor_3_pid_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_motor_3_pid_add_service,menu_motor_3_pid_reduce_service);
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
		
		chassis_motion_flag = CHASSIS_DEBUG;
		MENU_MOTOR_3_PID.motor_target.data_uint16 = chassis_control.motor_3_speed;
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.data_float = chassis_pid.motor_3_speed_pid_parameters.p;
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.data_float = chassis_pid.motor_3_speed_pid_parameters.i;
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.data_float = chassis_pid.motor_3_speed_pid_parameters.d;
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.data_float = chassis_pid.motor_3_speed_pid_parameters.output_limit;
		MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.data_float = chassis_pid.motor_3_speed_pid_parameters.i_limit;
		
		MENU_MOTOR_3_PID.MOTOR_I_PID.p.data_float = chassis_pid.motor_3_I_pid_parameters.p;
		MENU_MOTOR_3_PID.MOTOR_I_PID.i.data_float = chassis_pid.motor_3_I_pid_parameters.i;
		MENU_MOTOR_3_PID.MOTOR_I_PID.d.data_float = chassis_pid.motor_3_I_pid_parameters.d;
		MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.data_float = chassis_pid.motor_3_I_pid_parameters.output_limit;
		MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.data_float = chassis_pid.motor_3_I_pid_parameters.i_limit;
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_3_PID.control_mode.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR_3_PID.control_mode.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.motor_target.name);
		screen_uint(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.motor_target.data_uint16,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.p.data_float,3,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i.data_float,3,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.d.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.output_limit.data_float,5,1);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_SPEED_PID.i_limit.data_float,3,3);
		
		screen_string(0,8*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.p.name);
		screen_float(DATA_MAX_COL,8*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.p.data_float,3,3);
		
		screen_string(0,9*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i.name);
		screen_float(DATA_MAX_COL,9*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i.data_float,3,3);
		
		screen_string(0,10*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.d.name);
		screen_float(DATA_MAX_COL,10*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.d.data_float,3,3);
		
		screen_string(0,11*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.name);
		screen_float(DATA_MAX_COL,11*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.output_limit.data_float,5,1);
		
		screen_string(0,12*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.name);
		screen_float(DATA_MAX_COL,12*MENU_ROW_PITCH,MENU_MOTOR_3_PID.MOTOR_I_PID.i_limit.data_float,3,3);
		
		if(MENU_MOTOR_3_PID.control_mode.data_uint8 != 0)
			chassis_control.motor_3 = motor_pid(MOTOR_SPEED_PID_KIND,MOTOR_I_PID_KIND,&chassis_pid,MOTOR_3,chassis_control.motor_3_speed).motor_3;
		else
			chassis_control.motor_3.duty = 0;
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
		debug_service(menu_page[num].debug_mode);
	
		MENU_PATH_PID.PATH_PID.p.data_float = path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].p;
		MENU_PATH_PID.PATH_PID.i.data_float = path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i;
		MENU_PATH_PID.PATH_PID.d.data_float = path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].d;
		MENU_PATH_PID.PATH_PID.output_limit.data_float = path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].output_limit;
		MENU_PATH_PID.PATH_PID.i_limit.data_float = path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i_limit;
		MENU_PATH_PID.PATH_PID.gyro_d.data_float = PATH_PID[MENU_PATH_PID.pid_kind.data_uint8][3];
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH_PID.pid_kind.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_PATH_PID.pid_kind.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.p.data_float,1,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i.data_float,1,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.d.data_float,1,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.output_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.output_limit.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i_limit.data_float,3,3);
		
		screen_string(0,7*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.gyro_d.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.gyro_d.data_float,1,3);
	}
}

/* 菜单转动角度 PID角度 */
void menu_rotate_angle_pid_page(void)
{
	menu_page_init(menu_rotate_angle_pid_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_rotate_angle_pid_add_service,menu_rotate_angle_pid_reduce_service);
		menu_title_show();
		debug_service(menu_page[num].debug_mode);
	
		MENU_ROTATE_PID.ROTATE_PID.p.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].p;
		MENU_ROTATE_PID.ROTATE_PID.i.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i;
		MENU_ROTATE_PID.ROTATE_PID.d.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].d;
		MENU_ROTATE_PID.ROTATE_PID.output_limit.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].output_limit;
		MENU_ROTATE_PID.ROTATE_PID.i_limit.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i_limit;
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_ROTATE_PID.pid_kind.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_ROTATE_PID.pid_kind.data_uint8,1);
		
		screen_string(0,2*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.p.data_float,1,3);
		
		screen_string(0,3*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i.data_float,1,3);
		
		screen_string(0,4*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.d.data_float,1,3);
		
		screen_string(0,5*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.output_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.output_limit.data_float,3,3);
		
		screen_string(0,6*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i_limit.data_float,3,3);
	}
}

/**********************************************************************/

/****************************** 菜单页面服务 ******************************/

/* 菜单启动页面返回服务 */
void menu_start_page_back_service(void)
{
	// 循线起点初始化
	mid_x = MT9V03X_W/2;
	// 关闭蜂鸣器
	pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
	// 初始化循迹标志位
	path_element_flag = STRIGHT_PATH;
	circle_in_time_count_flag = FALSE;
}

/* 菜单调试页面返回服务 */
void menu_debug_page_back_service(void)
{
	// 循线起点初始化
	mid_x = MT9V03X_W/2;
	// 关闭蜂鸣器
	pwm_init(BUZZER_PIN, 20000, PWM_DUTY_MAX / 2);
	// 初始化循迹标志位
	path_element_flag = STRIGHT_PATH;
	circle_in_time_count_flag = FALSE;
}

/* 菜单欧拉角页面返回服务 */
void menu_euler_angle_page_back_service(void)
{
	// 停止解算
	euler_angle_flag = FALSE;
}

/* 平动位移解算页面返回服务 */
void menu_translate_shift_page_back_service(void)
{
	// 停止解算
	translate_shift_flag = FALSE;
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

/* 电机数据页面服务 */
void menu_motor_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_control.motor_1.dir+=1; break; }
		case 1:{ chassis_control.motor_1.duty+=50; break; }
		case 2:{ chassis_control.motor_2.dir+=1; break; }
		case 3:{ chassis_control.motor_2.duty+=50; break; }
		case 4:{ chassis_control.motor_3.dir+=1; break; }
		case 5:{ chassis_control.motor_3.duty+=50; break; }
	}
	if(chassis_control.motor_1.dir > 1)
		chassis_control.motor_1.dir = 0;
	if(chassis_control.motor_1.duty > 7000)
		chassis_control.motor_1.duty = 0;
	if(chassis_control.motor_2.dir > 1)
		chassis_control.motor_2.dir = 0;
	if(chassis_control.motor_2.duty > 7000)
		chassis_control.motor_2.duty = 0;
	if(chassis_control.motor_3.dir > 1)
		chassis_control.motor_3.dir = 0;
	if(chassis_control.motor_3.duty > 7000)
		chassis_control.motor_3.duty = 0;
}
void menu_motor_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_control.motor_1.dir-=1; break; }
		case 1:{ chassis_control.motor_1.duty-=50; break; }
		case 2:{ chassis_control.motor_2.dir-=1; break; }
		case 3:{ chassis_control.motor_2.duty-=50; break; }
		case 4:{ chassis_control.motor_3.dir-=1; break; }
		case 5:{ chassis_control.motor_3.duty-=50; break; }
	}
	if(chassis_control.motor_1.dir < 0)
		chassis_control.motor_1.dir = 1;
	if(chassis_control.motor_1.duty < 0)
		chassis_control.motor_1.duty = 0;
	if(chassis_control.motor_2.dir < 0)
		chassis_control.motor_2.dir = 1;
	if(chassis_control.motor_2.duty < 0)
		chassis_control.motor_2.duty = 0;
	if(chassis_control.motor_3.dir < 0)
		chassis_control.motor_3.dir = 1;
	if(chassis_control.motor_3.duty < 0)
		chassis_control.motor_3.duty = 0;
}

/* 菜单AI摄像头0数据页面服务 */
void menu_ai_camera_0_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ ai_camera_0_enable_flag+=1; break; }
		case 1:{ track_linear_speed_target+=0.01; break; }
		case 2:{ detection_box_width_limit+=1; break; }
		case 3:{ detection_box_width_std+=1; break; }
		case 4:{ detection_box_center_limit+=1; break; }
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
		case 1:{ track_linear_speed_target-=0.01; break; }
		case 2:{ detection_box_width_limit-=1; break; }
		case 3:{ detection_box_width_std-=1; break; }
		case 4:{ detection_box_center_limit-=1; break; }
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
		case 0:{ supplement_lamp_enable_flag+=1; break; }
		case 1:{ supplement_lamp_color+=1; break; }
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
		case 0:{ supplement_lamp_enable_flag-=1; break; }
		case 1:{ supplement_lamp_color-=1; break; }
	}
	if(supplement_lamp_enable_flag > 1)
	{
		supplement_lamp_enable_flag = 1;
	}
}

/* 菜单底盘数据页面服务 */
void menu_chassis_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_motion_flag+=1; break; }
		case 1:{ chassis_yaw+=1; break; }
		case 2:{ chassis_linear_speed+=0.5; break; }
		case 3:{ chassis_angular_speed+=0.5; break; }
		case 4:{ chassis_rotate_angle+=1; break; }
	}
	if(chassis_motion_flag > 2)
	{
		chassis_motion_flag = 0;
	}
}
void menu_chassis_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_motion_flag-=1; break; }
		case 1:{ chassis_yaw-=1; break; }
		case 2:{ chassis_linear_speed-=0.5; break; }
		case 3:{ chassis_angular_speed-=0.5; break; }
		case 4:{ chassis_rotate_angle-=1; break; }
	}
	if(chassis_motion_flag > 2)
	{
		chassis_motion_flag = 2;
	}
}

/* 菜单循线数据页面服务 */
void menu_path_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ path_linear_speed_target[0]+=5; break; }
		case 1:{ path_linear_speed_target[1]+=5; break; }
		case 2:{ path_linear_speed_target[2]+=5; break; }
		case 3:{ path_start+=1; break; }
		case 4:{ path_end+=1; break; }
		case 5:{ control_point[0]+=1; break; }
		case 6:{ control_point[1]+=1; break; }
		case 7:{ prediction_point+=1; break; }
		case 8:{ x_speed_rate+=0.1; break; }
	}
}
void menu_path_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ path_linear_speed_target[0]-=5; break; }
		case 1:{ path_linear_speed_target[1]-=5; break; }
		case 2:{ path_linear_speed_target[2]-=5; break; }
		case 3:{ path_start-=1; break; }
		case 4:{ path_end-=1; break; }
		case 5:{ control_point[0]-=1; break; }
		case 6:{ control_point[1]-=1; break; }
		case 7:{ prediction_point-=1; break; }
		case 8:{ x_speed_rate-=0.1; break; }
	}
}

/* 菜单圆环循线数据页面服务 */
void menu_circle_path_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ circle_path_enable_flag+=1; break; }
		case 1:{ circle_path_linear_speed_target+=1; break; }
		case 2:{ circle_check_y+=1; break; }
		case 3:{ circle_in_linear_speed_target+=1; break; }
		case 4:{ circle_in_angular_speed_target+=1; break; }
		case 5:{ circle_in_angle+=1; break; }
		case 6:{ circle_out_linear_speed_target+=1; break; }
		case 7:{ circle_out_angular_speed_target+=1; break; }
		case 8:{ circle_out_angle+=1; break; }
		case 9:{ side_extract_start_y+=1; break; }
		case 10:{ side_extract_end_y+=1; break; }	
		case 11:{ side_X_delta_limit[0]+=1; break; }
		case 12:{ side_X_delta_limit[1]+=1; break; }			
	}
	if(circle_path_enable_flag > 1)
	{
		circle_path_enable_flag = 0;
	}
}
void menu_circle_path_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ circle_path_enable_flag-=1; break; }
		case 1:{ circle_path_linear_speed_target-=1; break; }
		case 2:{ circle_check_y-=1; break; }
		case 3:{ circle_in_linear_speed_target-=1; break; }
		case 4:{ circle_in_angular_speed_target-=1; break; }
		case 5:{ circle_in_angle-=1; break; }
		case 6:{ circle_out_linear_speed_target-=1; break; }
		case 7:{ circle_out_angular_speed_target-=1; break; }
		case 8:{ circle_out_angle-=1; break; }
		case 9:{ side_extract_start_y-=1; break; }
		case 10:{ side_extract_end_y-=1; break; }
		case 11:{ side_X_delta_limit[0]-=1; break; }	
		case 12:{ side_X_delta_limit[1]-=1; break; }	
	}
	if(circle_path_enable_flag > 1)
	{
		circle_path_enable_flag = 1;
	}
}

/* 菜单电机1 PID页面服务 */
void menu_motor_1_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_MOTOR_1_PID.control_mode.data_uint8+=1; break; }
		case 1:{ chassis_control.motor_1_speed+=5; break; }
		case 2:{ chassis_pid.motor_1_speed_pid_parameters.p+=0.1; break; }
		case 3:{ chassis_pid.motor_1_speed_pid_parameters.i+=0.01; break; }
		case 4:{ chassis_pid.motor_1_speed_pid_parameters.d+=0.01; break; }
		case 5:{ chassis_pid.motor_1_speed_pid_parameters.output_limit+=5; break; }
		case 6:{ chassis_pid.motor_1_speed_pid_parameters.i_limit+=5; break; }
		case 7:{ chassis_pid.motor_1_I_pid_parameters.p+=0.1; break; }
		case 8:{ chassis_pid.motor_1_I_pid_parameters.i+=0.01; break; }
		case 9:{ chassis_pid.motor_1_I_pid_parameters.d+=0.01; break; }
		case 10:{ chassis_pid.motor_1_I_pid_parameters.output_limit+=5; break; }
		case 11:{ chassis_pid.motor_1_I_pid_parameters.i_limit+=5; break; }
	}
	if(MENU_MOTOR_1_PID.control_mode.data_uint8 > 1)
	{
		MENU_MOTOR_1_PID.control_mode.data_uint8 = 0;
	}
}
void menu_motor_1_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_MOTOR_1_PID.control_mode.data_uint8-=1; break; }
		case 1:{ chassis_control.motor_1_speed-=5; break; }
		case 2:{ chassis_pid.motor_1_speed_pid_parameters.p-=0.1; break; }
		case 3:{ chassis_pid.motor_1_speed_pid_parameters.i-=0.01; break; }
		case 4:{ chassis_pid.motor_1_speed_pid_parameters.d-=0.01; break; }
		case 5:{ chassis_pid.motor_1_speed_pid_parameters.output_limit-=5; break; }
		case 6:{ chassis_pid.motor_1_speed_pid_parameters.i_limit-=5; break; }
		case 7:{ chassis_pid.motor_1_I_pid_parameters.p-=0.1; break; }
		case 8:{ chassis_pid.motor_1_I_pid_parameters.i-=0.01; break; }
		case 9:{ chassis_pid.motor_1_I_pid_parameters.d-=0.01; break; }
		case 10:{ chassis_pid.motor_1_I_pid_parameters.output_limit-=5; break; }
		case 11:{ chassis_pid.motor_1_I_pid_parameters.i_limit-=5; break; }
	}
	if(MENU_MOTOR_1_PID.control_mode.data_uint8 > 1)
	{
		MENU_MOTOR_1_PID.control_mode.data_uint8 = 1;
	}
}

/* 菜单电机2 PID页面服务 */
void menu_motor_2_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_MOTOR_2_PID.control_mode.data_uint8+=1; break; }
		case 1:{ chassis_control.motor_2_speed+=5; break; }
		case 2:{ chassis_pid.motor_2_speed_pid_parameters.p+=0.1; break; }
		case 3:{ chassis_pid.motor_2_speed_pid_parameters.i+=0.01; break; }
		case 4:{ chassis_pid.motor_2_speed_pid_parameters.d+=0.01; break; }
		case 5:{ chassis_pid.motor_2_speed_pid_parameters.output_limit+=5; break; }
		case 6:{ chassis_pid.motor_2_speed_pid_parameters.i_limit+=5; break; }
		case 7:{ chassis_pid.motor_2_I_pid_parameters.p+=0.1; break; }
		case 8:{ chassis_pid.motor_2_I_pid_parameters.i+=0.01; break; }
		case 9:{ chassis_pid.motor_2_I_pid_parameters.d+=0.01; break; }
		case 10:{ chassis_pid.motor_2_I_pid_parameters.output_limit+=5; break; }
		case 11:{ chassis_pid.motor_2_I_pid_parameters.i_limit+=5; break; }
	}
	if(MENU_MOTOR_2_PID.control_mode.data_uint8 > 1)
	{
		MENU_MOTOR_2_PID.control_mode.data_uint8 = 0;
	}
}
void menu_motor_2_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_MOTOR_2_PID.control_mode.data_uint8-=1; break; }
		case 1:{ chassis_control.motor_2_speed-=5; break; }
		case 2:{ chassis_pid.motor_2_speed_pid_parameters.p-=0.1; break; }
		case 3:{ chassis_pid.motor_2_speed_pid_parameters.i-=0.01; break; }
		case 4:{ chassis_pid.motor_2_speed_pid_parameters.d-=0.01; break; }
		case 5:{ chassis_pid.motor_2_speed_pid_parameters.output_limit-=5; break; }
		case 6:{ chassis_pid.motor_2_speed_pid_parameters.i_limit-=5; break; }
		case 7:{ chassis_pid.motor_2_I_pid_parameters.p-=0.1; break; }
		case 8:{ chassis_pid.motor_2_I_pid_parameters.i-=0.01; break; }
		case 9:{ chassis_pid.motor_2_I_pid_parameters.d-=0.01; break; }
		case 10:{ chassis_pid.motor_2_I_pid_parameters.output_limit-=5; break; }
		case 11:{ chassis_pid.motor_2_I_pid_parameters.i_limit-=5; break; }
	}
	if(MENU_MOTOR_2_PID.control_mode.data_uint8 > 1)
	{
		MENU_MOTOR_2_PID.control_mode.data_uint8 = 1;
	}
}

/* 菜单电机3 PID页面服务 */
void menu_motor_3_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_MOTOR_3_PID.control_mode.data_uint8+=1; break; }
		case 1:{ chassis_control.motor_3_speed+=5; break; }
		case 2:{ chassis_pid.motor_3_speed_pid_parameters.p+=0.1; break; }
		case 3:{ chassis_pid.motor_3_speed_pid_parameters.i+=0.01; break; }
		case 4:{ chassis_pid.motor_3_speed_pid_parameters.d+=0.01; break; }
		case 5:{ chassis_pid.motor_3_speed_pid_parameters.output_limit+=5; break; }
		case 6:{ chassis_pid.motor_3_speed_pid_parameters.i_limit+=5; break; }
		case 7:{ chassis_pid.motor_3_I_pid_parameters.p+=0.1; break; }
		case 8:{ chassis_pid.motor_3_I_pid_parameters.i+=0.01; break; }
		case 9:{ chassis_pid.motor_3_I_pid_parameters.d+=0.01; break; }
		case 10:{ chassis_pid.motor_3_I_pid_parameters.output_limit+=5; break; }
		case 11:{ chassis_pid.motor_3_I_pid_parameters.i_limit+=5; break; }
	}
	if(MENU_MOTOR_3_PID.control_mode.data_uint8 > 1)
	{
		MENU_MOTOR_3_PID.control_mode.data_uint8 = 0;
	}
}
void menu_motor_3_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_MOTOR_3_PID.control_mode.data_uint8-=1; break; }
		case 1:{ chassis_control.motor_3_speed-=5; break; }
		case 2:{ chassis_pid.motor_3_speed_pid_parameters.p-=0.1; break; }
		case 3:{ chassis_pid.motor_3_speed_pid_parameters.i-=0.01; break; }
		case 4:{ chassis_pid.motor_3_speed_pid_parameters.d-=0.01; break; }
		case 5:{ chassis_pid.motor_3_speed_pid_parameters.output_limit-=5; break; }
		case 6:{ chassis_pid.motor_3_speed_pid_parameters.i_limit-=5; break; }
		case 7:{ chassis_pid.motor_3_I_pid_parameters.p-=0.1; break; }
		case 8:{ chassis_pid.motor_3_I_pid_parameters.i-=0.01; break; }
		case 9:{ chassis_pid.motor_3_I_pid_parameters.d-=0.01; break; }
		case 10:{ chassis_pid.motor_3_I_pid_parameters.output_limit-=5; break; }
		case 11:{ chassis_pid.motor_3_I_pid_parameters.i_limit-=5; break; }
	}
	if(MENU_MOTOR_3_PID.control_mode.data_uint8 > 1)
	{
		MENU_MOTOR_3_PID.control_mode.data_uint8 = 1;
	}
}

/* 菜单循迹 PID页面服务 */
void menu_path_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_PATH_PID.pid_kind.data_uint8+=1; break; }
		case 1:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].p+=0.005; break; }
		case 2:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i+=0.005; break; }
		case 3:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].d+=0.005; break; }
		case 4:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].output_limit+=0.005; break; }
		case 5:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i_limit+=0.005; break; }
		case 6:{ PATH_PID[MENU_PATH_PID.pid_kind.data_uint8][3]+=0.0005; break; }
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
		case 1:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].p-=0.005; break; }
		case 2:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i-=0.005; break; }
		case 3:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].d-=0.005; break; }
		case 4:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].output_limit-=0.0005; break; }
		case 5:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i_limit-=0.005; break; }
		case 6:{ PATH_PID[MENU_PATH_PID.pid_kind.data_uint8][3]-=0.0005; break; }
	}
	if(MENU_PATH_PID.pid_kind.data_uint8 > 3)
	{
		MENU_PATH_PID.pid_kind.data_uint8 = 3;
	}
}

/* 菜单转动角度 PID页面服务 */
void menu_rotate_angle_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_ROTATE_PID.pid_kind.data_uint8 += 1; break; }
		case 1:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].p+=0.05; break; }
		case 2:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i+=0.05; break; }
		case 3:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].d+=0.05; break; }
		case 4:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].output_limit+=1; break; }
		case 5:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i_limit+=0.05; break; }
	}
	if(MENU_ROTATE_PID.pid_kind.data_uint8 > 7)
	{
		MENU_ROTATE_PID.pid_kind.data_uint8 = 0;
	}
}
void menu_rotate_angle_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_ROTATE_PID.pid_kind.data_uint8 -= 1; break; }
		case 1:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].p-=0.05; break; }
		case 2:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i-=0.05; break; }
		case 3:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].d-=0.05; break; }
		case 4:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].output_limit-=1; break; }
		case 5:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i_limit-=0.05; break; }
	}
	if(MENU_ROTATE_PID.pid_kind.data_uint8 > 7)
	{
		MENU_ROTATE_PID.pid_kind.data_uint8 = 7;
	}
}

/*************************************************************************/




	