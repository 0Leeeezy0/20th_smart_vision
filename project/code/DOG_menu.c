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
	/* 页面名称         标题使能     级别 序号    参数行数   页面函数指针 */
	{"ROOT"         	,FALSE 		,0 	,0 		,19 	,menu_root_page},
	{"DEBUG"        	,TRUE 		,1 	,0 		,0 		,debug},
	{"SAVE"        		,TRUE 		,1 	,1 		,0 		,save},
	{"LOAD"				,TRUE 		,1 	,2 		,0 		,load},
	{"CLI"				,TRUE 		,1 	,3 		,0 		,cli},
	{"CALIBRATE"		,TRUE 		,1 	,4 		,0 		,sensor_calibrate},
	{"ENCODER"			,TRUE 		,1 	,5 		,0 		,menu_encoder_page},
	{"MOTOR"			,TRUE 		,1 	,6 		,0 		,menu_motor_page},
	{"GYRO_ACC"			,TRUE 		,1 	,7 		,0 		,menu_gyro_acc_page},
	{"EULER_ANGLE"      ,TRUE		,1	,8		,0		,menu_euler_angle_page},
	{"TRANSLATE_SHIFT"	,TRUE		,1	,9		,0		,menu_translate_shift_page},
	{"AI_CAMERA_0"		,TRUE		,1	,10		,6		,menu_ai_camera_0_page},
	{"AI_CAMERA_1"		,TRUE		,1	,11		,6		,menu_ai_camera_1_page},
	{"CHASSIS"			,TRUE 		,1 	,12 	,5 		,menu_chassis_page},
	{"PATH"				,TRUE		,1	,13		,6		,menu_path_page},
	{"MOTOR_1 PID"		,TRUE 		,1 	,14 	,5 		,menu_motor_1_pid_page},
	{"MOTOR_2 PID"		,TRUE 		,1 	,15 	,5 		,menu_motor_2_pid_page},
	{"MOTOR_3 PID"		,TRUE 		,1 	,16 	,5 		,menu_motor_3_pid_page},
	{"PATH PID"			,TRUE 		,1 	,17 	,7 		,menu_path_pid_page},
	{"ROTATE_PID"		,TRUE		,1	,18		,6		,menu_rotate_angle_pid_page}
};

static int16 num = 0;	// 页面在列表中的序号
static int16 page_level = 0;	// 页面级别
static int16 page_num = 0;	// 页面序号
static int16 page_row_num = 0;	// 页面选项行数
static int16 last_page_level = 0;	// 上一个页面级别
static int16 last_page_num = 0;	// 上一个页面序号
static int16 point_row_num = 0;	// 页面指针指向行数

static FUNC_STRING screen_string;
static FUNC_INT screen_int;
static FUNC_UINT screen_uint;
static FUNC_FLOAT screen_float;
static FUNC_IMAGE screen_image;
static FUNC_CLEAR screen_clear;
static FUNC_DRAW_LINE screen_draw_line;
static FUNC_DRAW_POINT screen_draw_point;

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
	screen_string(20,DATA_MAX_COL,"SJC");
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
	else if(key_get_state(PRESS) == KEY_LONG_PRESS && point_row_num < menu_page[num].page_row_num)
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
		
		if(key_get_state(ULTIMATE) == KEY_SHORT_PRESS)
			start();
		
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
	}
}

/**********************************************************************/

/****************************** 菜单页面 ******************************/

/* 启动 */
void start(void)
{
	menu_page_init(debug);
	int i;
	for(i = 0;i <= 20;i++)
	{
		if(i <=9)
		{
			gpio_set_level(BUZZER_PIN, 0);
			system_delay_ms(100-10*i);
			gpio_set_level(BUZZER_PIN, 1);
			system_delay_ms(10*i);
		}
		else
		{
			gpio_set_level(BUZZER_PIN, 0);
			system_delay_ms(10);
			gpio_set_level(BUZZER_PIN, 1);
			system_delay_ms(90);
		}	
	}
	gpio_set_level(BUZZER_PIN, 0);
	
	while(1)
	{
		if(key_get_state(ULTIMATE) == KEY_SHORT_PRESS)
		{
			gpio_set_level(BUZZER_PIN, 0);
			menu_root_page();
		}
		threshold(mt9v03x_image);
		longest_white_col();
		control_mode_dispatch();
	}
}

/* 调试 */
void debug(void)
{
	menu_page_init(debug);
	system_delay_ms(1000);
		
	while(1)
	{
//		screen_clear();
		menu_back(menu_debug_page_back_service);
		menu_point();
		menu_title_show();
		threshold(mt9v03x_image);
//		dilate(mt9v03x_image);
//		erode(mt9v03x_image);
		side_extract();
		side_point_kind_judge();
		circle_path_element_judge();
		
//		if(path_element_flag == R_CIRCLE_PATH || path_element_flag == L_CIRCLE_PATH)
//			gpio_set_level(BUZZER_PIN, 1);
//		else
//			gpio_set_level(BUZZER_PIN, 0);
		if(path_element_flag == L_CIRCLE_PATH || path_element_flag == R_CIRCLE_PATH)
			path_extract();
		else
			longest_white_col();
		
        uint8_t show[MT9V03X_H][MT9V03X_W];
		
		screen_draw_line(longest_white_col_x, MENU_ROW_PITCH, longest_white_col_x, MENU_ROW_PITCH+2*MT9V03X_H,RGB565_RED);
		screen_image(0, MENU_ROW_PITCH, image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_image(0, MT9V03X_H+MENU_ROW_PITCH, mt9v03x_image[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		screen_draw_line(0, MENU_ROW_PITCH+SIDE_EXTRACT_START_Y, MT9V03X_W, MENU_ROW_PITCH+SIDE_EXTRACT_START_Y ,RGB565_RED);
		screen_draw_line(0, MENU_ROW_PITCH+SIDE_EXTRACT_END_Y, MT9V03X_W, MENU_ROW_PITCH+SIDE_EXTRACT_END_Y ,RGB565_RED);
		screen_draw_line(0, MENU_ROW_PITCH+LOONGEST_WHITE_COL_START_Y, MT9V03X_W, MENU_ROW_PITCH+LOONGEST_WHITE_COL_START_Y ,RGB565_BLUE);
		screen_draw_line(0, MENU_ROW_PITCH+LOONGEST_WHITE_COL_START_Y-control_point, MT9V03X_W, MENU_ROW_PITCH+LOONGEST_WHITE_COL_START_Y-control_point ,RGB565_BLUE);
		
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
		screen_int(0,2*MT9V03X_H+2*MENU_ROW_PITCH,L_inflection_point_num,3);
		screen_int(DATA_MAX_COL/2,2*MT9V03X_H+2*MENU_ROW_PITCH,path_err,3);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+2*MENU_ROW_PITCH,R_inflection_point_num,3);
		screen_int(0,2*MT9V03X_H+3*MENU_ROW_PITCH,L_bend_point_num,3);
		screen_int(DATA_MAX_COL/2,2*MT9V03X_H+3*MENU_ROW_PITCH,R_side[0][0]-L_side[0][0],3);
		screen_int(DATA_MAX_COL,2*MT9V03X_H+3*MENU_ROW_PITCH,R_bend_point_num,3);
		screen_float(0,2*MT9V03X_H+4*MENU_ROW_PITCH,angle,3,2);
		control_mode_dispatch();
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
		
		if(gyro_calibration_flag && acc_calibration_flag)
		{
			screen_clear();
			screen_string(0,MENU_ROW_PITCH,"CALIBRATE_DONE");
		}
		else
		{
			screen_clear();
			screen_string(0,MENU_ROW_PITCH,"KEEP STOP");
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
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_ENCODER.encoder_1_speed.data_float,2,3);
		screen_string(0,5*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_speed.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_speed.data_float,2,3);
		screen_string(0,6*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_speed.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_speed.data_float,2,3);
	}
}

/* 菜单电机页面 */
void menu_motor_page(void)
{	
	menu_page_init(menu_motor_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_title_show();	
		
		MENU_MOTOR.motor_1_speed.data_float = motor_1_speed;
		MENU_MOTOR.motor_2_speed.data_float = motor_2_speed;
		MENU_MOTOR.motor_3_speed.data_float = motor_3_speed;
	
		// 显示电机转速
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.data_float,2,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.data_float,2,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.data_float,2,3);
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
		
		translate_shift_flag = TRUE;
		
		MENU_SHIFT.shift_yaw.data_float = shift_yaw;
		MENU_SHIFT.shift_distance.data_float = shift_distance;
		
		// 显示位移解算
		screen_string(0,MENU_ROW_PITCH,MENU_SHIFT.shift_yaw.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_SHIFT.shift_yaw.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_SHIFT.shift_distance.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_SHIFT.shift_distance.data_float,3,3);
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
		MENU_AI_CAMERA_0.track_linear_speed_target.data_float = track_linear_speed_target;
		MENU_AI_CAMERA_0.track_linear_speed_revise.data_float = track_linear_speed_revise;
		MENU_AI_CAMERA_0.detection_box_width_limit.data_int16 = detection_box_width_limit;
		MENU_AI_CAMERA_0.detection_box_width_std.data_int16 = detection_box_width_std;
		MENU_AI_CAMERA_0.detection_box_center_limit.data_int16 = detection_box_center_limit;
		
		// 显示MCXVISION摄像头数据
		screen_string(0,MENU_ROW_PITCH,MENU_AI_CAMERA_0.ai_camera_0_enable_flag.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_AI_CAMERA_0.ai_camera_0_enable_flag.data_uint8,1);
		screen_string(0,2*MENU_ROW_PITCH,MENU_AI_CAMERA_0.track_linear_speed_target.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_AI_CAMERA_0.track_linear_speed_target.data_float,2,4);
		screen_string(0,3*MENU_ROW_PITCH,MENU_AI_CAMERA_0.track_linear_speed_revise.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_AI_CAMERA_0.track_linear_speed_revise.data_float,2,4);
		screen_string(0,4*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_limit.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_limit.data_int16,3);
		screen_string(0,5*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_std.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_width_std.data_int16,3);
		screen_string(0,6*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_center_limit.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_AI_CAMERA_0.detection_box_center_limit.data_int16,3);
		screen_string(0,8*MENU_ROW_PITCH,"CENTER_X");
		screen_int(DATA_MAX_COL,8*MENU_ROW_PITCH,track_x_center,3);
		screen_string(0,9*MENU_ROW_PITCH,"BOX_WIDTH");
		screen_int(DATA_MAX_COL,9*MENU_ROW_PITCH,detection_box_width,3);
		screen_string(0,10*MENU_ROW_PITCH,"TRACK_ERR");
		screen_int(DATA_MAX_COL,10*MENU_ROW_PITCH,track_err,3);
	}
}

/* AI摄像头1 数据页面 */
void menu_ai_camera_1_page(void)
{
	menu_page_init(menu_ai_camera_1_page);
	while(1)
	{
		menu_back(NULL);
		menu_point();
		menu_data_change(menu_ai_camera_0_data_add_service,menu_ai_camera_0_data_reduce_service);
		menu_title_show();
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
		
		MENU_PATH.linear_speed_target.data_float = path_linear_speed_target;
		MENU_PATH.path_start.data_int16 = path_start;
		MENU_PATH.path_end.data_int16 = path_end;
		MENU_PATH.control_point.data_int16 = control_point;
		MENU_PATH.prediction_point.data_int16 = prediction_point;
		MENU_PATH.circle_path_enable_flag.data_uint8 = circle_path_enable_flag;
	
		// 显示底盘数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH.linear_speed_target.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_PATH.linear_speed_target.data_float,2,4);
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH.path_start.name);
		screen_int(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_PATH.path_start.data_int16,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH.path_end.name);
		screen_int(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_PATH.path_end.data_int16,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH.control_point.name);
		screen_int(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_PATH.control_point.data_int16,3);
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH.prediction_point.name);
		screen_int(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_PATH.prediction_point.data_int16,3);
		screen_string(0,6*MENU_ROW_PITCH,MENU_PATH.circle_path_enable_flag.name);
		screen_int(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_PATH.circle_path_enable_flag.data_uint8,1);
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
		
		chassis_motion_flag = CHASSIS_MOVE;
	
		MENU_MOTOR_1_PID.p.data_float = chassis_pid.motor_1_pid_parameters.p;
		MENU_MOTOR_1_PID.i.data_float = chassis_pid.motor_1_pid_parameters.i;
		MENU_MOTOR_1_PID.d.data_float = chassis_pid.motor_1_pid_parameters.d;
		MENU_MOTOR_1_PID.output_limit.data_float = chassis_pid.motor_1_pid_parameters.output_limit;
		MENU_MOTOR_1_PID.i_limit.data_float = chassis_pid.motor_1_pid_parameters.i_limit;
	
		// 显示电机1 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_1_PID.p.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR_1_PID.p.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i.data_float,3,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.d.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.d.data_float,3,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.output_limit.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.output_limit.data_float,5,1);
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i_limit.data_float,3,3);
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
		
		chassis_motion_flag = CHASSIS_MOVE;
	
		MENU_MOTOR_2_PID.p.data_float = chassis_pid.motor_2_pid_parameters.p;
		MENU_MOTOR_2_PID.i.data_float = chassis_pid.motor_2_pid_parameters.i;
		MENU_MOTOR_2_PID.d.data_float = chassis_pid.motor_2_pid_parameters.d;
		MENU_MOTOR_2_PID.output_limit.data_float = chassis_pid.motor_2_pid_parameters.output_limit;
		MENU_MOTOR_2_PID.i_limit.data_float = chassis_pid.motor_2_pid_parameters.i_limit;
	
		// 显示电机2 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_2_PID.p.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR_2_PID.p.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i.data_float,3,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.d.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.d.data_float,3,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.output_limit.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.output_limit.data_float,5,1);
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i_limit.data_float,3,3);
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
		
		chassis_motion_flag = CHASSIS_MOVE;
	
		MENU_MOTOR_3_PID.p.data_float = chassis_pid.motor_3_pid_parameters.p;
		MENU_MOTOR_3_PID.i.data_float = chassis_pid.motor_3_pid_parameters.i;
		MENU_MOTOR_3_PID.d.data_float = chassis_pid.motor_3_pid_parameters.d;
		MENU_MOTOR_3_PID.output_limit.data_float = chassis_pid.motor_3_pid_parameters.output_limit;
		MENU_MOTOR_3_PID.i_limit.data_float = chassis_pid.motor_3_pid_parameters.i_limit;
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_3_PID.p.name);
		screen_float(DATA_MAX_COL,MENU_ROW_PITCH,MENU_MOTOR_3_PID.p.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i.data_float,3,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.d.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.d.data_float,3,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.output_limit.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.output_limit.data_float,5,1);
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i_limit.data_float,3,3);
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
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.p.data_float,1,5);
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i.data_float,1,5);
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.d.data_float,1,5);
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.output_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.output_limit.data_float,2,5);
		screen_string(0,6*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.i_limit.data_float,1,5);
		screen_string(0,7*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.gyro_d.name);
		screen_float(DATA_MAX_COL,7*MENU_ROW_PITCH,MENU_PATH_PID.PATH_PID.gyro_d.data_float,1,5);
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
	
		MENU_ROTATE_PID.ROTATE_PID.p.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].p;
		MENU_ROTATE_PID.ROTATE_PID.i.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i;
		MENU_ROTATE_PID.ROTATE_PID.d.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].d;
		MENU_ROTATE_PID.ROTATE_PID.output_limit.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].output_limit;
		MENU_ROTATE_PID.ROTATE_PID.i_limit.data_float = chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i_limit;
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_ROTATE_PID.pid_kind.name);
		screen_uint(DATA_MAX_COL,MENU_ROW_PITCH,MENU_ROTATE_PID.pid_kind.data_uint8,1);
		screen_string(0,2*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.p.name);
		screen_float(DATA_MAX_COL,2*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.p.data_float,1,5);
		screen_string(0,3*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i.name);
		screen_float(DATA_MAX_COL,3*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i.data_float,1,5);
		screen_string(0,4*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.d.name);
		screen_float(DATA_MAX_COL,4*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.d.data_float,1,5);
		screen_string(0,5*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.output_limit.name);
		screen_float(DATA_MAX_COL,5*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.output_limit.data_float,1,5);
		screen_string(0,6*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i_limit.name);
		screen_float(DATA_MAX_COL,6*MENU_ROW_PITCH,MENU_ROTATE_PID.ROTATE_PID.i_limit.data_float,1,5);
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
	gpio_set_level(BUZZER_PIN, 0);
	// 初始化循迹标志位
	path_element_flag = STRIGHT_PATH;
}

/* 菜单调试页面返回服务 */
void menu_debug_page_back_service(void)
{
	// 循线起点初始化
	mid_x = MT9V03X_W/2;
	// 关闭蜂鸣器
	gpio_set_level(BUZZER_PIN, 0);
	// 初始化循迹标志位
	path_element_flag = STRIGHT_PATH;
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

/* 菜单AI摄像头0数据页面服务 */
void menu_ai_camera_0_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ ai_camera_0_enable_flag+=1; break; }
		case 1:{ track_linear_speed_target+=0.01; break; }
		case 2:{ track_linear_speed_revise+=0.01; break; }
		case 3:{ detection_box_width_limit+=1; break; }
		case 4:{ detection_box_width_std+=1; break; }
		case 5:{ detection_box_center_limit+=1; break; }
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
		case 2:{ track_linear_speed_revise-=0.01; break; }
		case 3:{ detection_box_width_limit-=1; break; }
		case 4:{ detection_box_width_std-=1; break; }
		case 5:{ detection_box_center_limit-=1; break; }
	}
	if(ai_camera_0_enable_flag > 1)
	{
		ai_camera_0_enable_flag = 1;
	}
}

/* 菜单底盘数据页面服务 */
void menu_chassis_data_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_motion_flag+=1; break; }
		case 1:{ chassis_yaw+=1; break; }
		case 2:{ chassis_linear_speed+=0.1; break; }
		case 3:{ chassis_angular_speed+=0.1; break; }
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
		case 2:{ chassis_linear_speed-=0.1; break; }
		case 3:{ chassis_angular_speed-=0.1; break; }
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
		case 0:{ path_linear_speed_target+=0.1; break; }
		case 1:{ path_start+=1; break; }
		case 2:{ path_end+=1; break; }
		case 3:{ control_point+=1; break; }
		case 4:{ prediction_point+=1; break; }
		case 5:{ circle_path_enable_flag+=1; break; }
	}
	if(circle_path_enable_flag > 1)
	{
		circle_path_enable_flag = 0;
	}
}
void menu_path_data_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ path_linear_speed_target-=0.1; break; }
		case 1:{ path_start-=1; break; }
		case 2:{ path_end-=1; break; }
		case 3:{ control_point-=1; break; }
		case 4:{ prediction_point-=1; break; }
		case 5:{ circle_path_enable_flag-=1; break; }
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
		case 0:{ chassis_pid.motor_1_pid_parameters.p+=1; break; }
		case 1:{ chassis_pid.motor_1_pid_parameters.i+=0.1; break; }
		case 2:{ chassis_pid.motor_1_pid_parameters.d+=1; break; }
		case 3:{ chassis_pid.motor_1_pid_parameters.output_limit+=5; break; }
		case 4:{ chassis_pid.motor_1_pid_parameters.i_limit+=5; break; }
	}
}
void menu_motor_1_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_1_pid_parameters.p-=1; break; }
		case 1:{ chassis_pid.motor_1_pid_parameters.i-=0.1; break; }
		case 2:{ chassis_pid.motor_1_pid_parameters.d-=1; break; }
		case 3:{ chassis_pid.motor_1_pid_parameters.output_limit-=5; break; }
		case 4:{ chassis_pid.motor_1_pid_parameters.i_limit-=5; break; }
	}
}

/* 菜单电机2 PID页面服务 */
void menu_motor_2_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_2_pid_parameters.p+=1; break; }
		case 1:{ chassis_pid.motor_2_pid_parameters.i+=0.1; break; }
		case 2:{ chassis_pid.motor_2_pid_parameters.d+=1; break; }
		case 3:{ chassis_pid.motor_2_pid_parameters.output_limit+=5; break; }
		case 4:{ chassis_pid.motor_2_pid_parameters.i_limit+=5; break; }
	}
}
void menu_motor_2_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_2_pid_parameters.p-=1; break; }
		case 1:{ chassis_pid.motor_2_pid_parameters.i-=0.1; break; }
		case 2:{ chassis_pid.motor_2_pid_parameters.d-=1; break; }
		case 3:{ chassis_pid.motor_2_pid_parameters.output_limit-=5; break; }
		case 4:{ chassis_pid.motor_2_pid_parameters.i_limit-=5; break; }
	}
}

/* 菜单电机3 PID页面服务 */
void menu_motor_3_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_3_pid_parameters.p+=1; break; }
		case 1:{ chassis_pid.motor_3_pid_parameters.i+=0.1; break; }
		case 2:{ chassis_pid.motor_3_pid_parameters.d+=1; break; }
		case 3:{ chassis_pid.motor_3_pid_parameters.output_limit+=5; break; }
		case 4:{ chassis_pid.motor_3_pid_parameters.i_limit+=5; break; }
	}
}
void menu_motor_3_pid_reduce_service(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_3_pid_parameters.p-=1; break; }
		case 1:{ chassis_pid.motor_3_pid_parameters.i-=0.1; break; }
		case 2:{ chassis_pid.motor_3_pid_parameters.d-=1; break; }
		case 3:{ chassis_pid.motor_3_pid_parameters.output_limit-=5; break; }
		case 4:{ chassis_pid.motor_3_pid_parameters.i_limit-=5; break; }
	}
}

/* 菜单循迹 PID页面服务 */
void menu_path_pid_add_service(void)
{
	switch(point_row_num)
	{
		case 0:{ MENU_PATH_PID.pid_kind.data_uint8+=1; break; }
		case 1:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].p+=0.0005; break; }
		case 2:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i+=0.00005; break; }
		case 3:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].d+=0.00005; break; }
		case 4:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].output_limit+=0.0005; break; }
		case 5:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i_limit+=0.0005; break; }
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
		case 1:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].p-=0.0005; break; }
		case 2:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i-=0.00005; break; }
		case 3:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].d-=0.00005; break; }
		case 4:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].output_limit-=0.0005; break; }
		case 5:{ path_pid.path_pid_parameters[MENU_PATH_PID.pid_kind.data_uint8].i_limit-=0.0005; break; }
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
		case 1:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].p+=0.0005; break; }
		case 2:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i+=0.00005; break; }
		case 3:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].d+=0.00005; break; }
		case 4:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].output_limit+=0.005; break; }
		case 5:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i_limit+=0.005; break; }
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
		case 1:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].p-=0.0005; break; }
		case 2:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i-=0.00005; break; }
		case 3:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].d-=0.00005; break; }
		case 4:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].output_limit-=0.005; break; }
		case 5:{ chassis_pid.rotate_pid_parameters[MENU_ROTATE_PID.pid_kind.data_uint8].i_limit-=0.005; break; }
	}
	if(MENU_ROTATE_PID.pid_kind.data_uint8 > 7)
	{
		MENU_ROTATE_PID.pid_kind.data_uint8 = 2;
	}
}

/*************************************************************************/




	