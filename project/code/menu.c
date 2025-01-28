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
	/* 页面名称         标题使能     级别 序号    行数   页面函数指针 */
	{"ROOT"         	,FALSE 		,0 	,0 		,13 ,menu_root_page},
	{"START"        	,TRUE 		,1 	,0 		,0 	,start},
	{"SAVE"        		,TRUE 		,1 	,1 		,0 	,save},
	{"LOAD"				,TRUE 		,1 	,2 		,0 	,load},
	{"CLI"				,TRUE 		,1 	,3 		,0 	,cli},
	{"ENCODER"			,TRUE 		,1 	,4 		,6 	,menu_encoder_page},
	{"MOTOR"			,TRUE 		,1 	,5 		,3 	,menu_motor_page},
	{"GYRO_ACC"			,TRUE 		,1 	,6 		,6 	,menu_gyro_acc_page},
	{"CHASSIS"			,TRUE 		,1 	,7 		,3 	,menu_chassis_page},
	{"PATH"				,TRUE		,1	,8		,5	,menu_path_page},
	{"MOTOR_1 PID"		,TRUE 		,1 	,9 		,5 	,menu_motor_1_pid_page},
	{"MOTOR_2 PID"		,TRUE 		,1 	,10 	,5 	,menu_motor_2_pid_page},
	{"MOTOR_3 PID"		,TRUE 		,1 	,11 	,5 	,menu_motor_3_pid_page},
	{"PATH PID"			,TRUE 		,1 	,12 	,5 	,menu_path_pid_page},
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
static FUNC_FLOAT screen_float;
static FUNC_CLEAR screen_clear;

/****************************** 菜单组件 ******************************/

/* 菜单初始化 */
void menu_init(void)
{
	menu_data_leeeezy_init();
	menu_data_yjc_init();
	
	switch(SCREEN_KIND)
	{
		case 0:{ screen_string = &(tft180_show_string); screen_int = &(tft180_show_int); screen_float = &(tft180_show_float); screen_clear = &(tft180_clear); break; }
		case 1:{ screen_string = &(ips200_show_string); screen_int = &(ips200_show_int); screen_float = &(ips200_show_float); screen_clear = &(ips200_clear); break; }
	}
	
	key_init(10);
	pit_ms_init (MENU_KEY_SCAN_IT_CH, MENU_KEY_SCAN_IT_TIME);
	pit_enable(MENU_KEY_SCAN_IT_CH);
}

/* 菜单页面初始化 */
void menu_page_init(FUNC_PAGE func_page)
{
	int16 i = 0;
	point_row_num = 0;
	
	// 停车
	yaw = 0;
	linear_speed = 0;
	angular_speed = 0;
	
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

/* 返回按键显示 */
void menu_back_button_show(void)
{
	switch(SCREEN_KIND)
	{
		case 0:{ screen_string(0,140,"BACK"); break; }
		case 1:{ screen_string(0,300,"BACK"); break; }
	}
}

/* 页面标题显示 */
void menu_title_show(void)
{
	screen_string(0,0,menu_page[num].name);
}

/* 菜单返回 */
void menu_back(void)
{
	int16 i = 0;
	point_row_num = 0;
	screen_clear();
	for(i = 0;i < sizeof(menu_page)/sizeof(menu_page[0]);i++)
	{
		if(menu_page[i].page_level == last_page_level && menu_page[i].page_num == last_page_num)
		{
			menu_page[i].func_page();	
			break;
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
	else if(key_get_state(DOWN) == KEY_LONG_PRESS && point_row_num < menu_page[num].page_row_num)
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
	// 返回键
	else if(key_get_state(UP) == KEY_LONG_PRESS && page_level > 0 && point_row_num == menu_page[num].page_row_num)
	{
		key_clear_all_state();
		menu_back();
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

/* 菜单数据更改 */
void menu_data_change(FUNC_SERVICE func_service_add,FUNC_SERVICE func_service_reduce)
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
	menu_page_init(start);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_title_show();
		
		threshold();
		path_search();
		path_draw();
		tft180_show_gray_image(0, 30, image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
		path_control(linear_speed_target);
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
		menu_back_button_show();
		menu_point();
		menu_title_show();
		
		debug_cli_init();
		cli_service_start();
	}
}

/* 菜单编码器页面 */
void menu_encoder_page(void)
{	
	menu_page_init(menu_encoder_page);
	while(1)
	{
		menu_back_button_show();
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
		screen_int(60,MENU_ROW_PITCH,MENU_ENCODER.encoder_1_count.data_int16,4);
		screen_string(0,2*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_count.name);
		screen_int(60,2*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_count.data_int16,4);
		screen_string(0,3*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_count.name);
		screen_int(60,3*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_count.data_int16,4);
	
		// 显示编码器转速
		screen_string(0,4*MENU_ROW_PITCH,MENU_ENCODER.encoder_1_speed.name);
		screen_float(60,4*MENU_ROW_PITCH,MENU_ENCODER.encoder_1_speed.data_float,2,3);
		screen_string(0,5*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_speed.name);
		screen_float(60,5*MENU_ROW_PITCH,MENU_ENCODER.encoder_2_speed.data_float,2,3);
		screen_string(0,6*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_speed.name);
		screen_float(60,6*MENU_ROW_PITCH,MENU_ENCODER.encoder_3_speed.data_float,2,3);
	}
}

/* 菜单电机页面 */
void menu_motor_page(void)
{	
	menu_page_init(menu_motor_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_title_show();	
		
		MENU_MOTOR.motor_1_speed.data_float = motor_1_speed;
		MENU_MOTOR.motor_2_speed.data_float = motor_2_speed;
		MENU_MOTOR.motor_3_speed.data_float = motor_3_speed;
	
		// 显示电机转速
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.name);
		screen_float(60,MENU_ROW_PITCH,MENU_MOTOR.motor_1_speed.data_float,2,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_MOTOR.motor_2_speed.data_float,2,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_MOTOR.motor_3_speed.data_float,2,3);
	}
}

/* 菜单陀螺仪、加速度计页面 */
void menu_gyro_acc_page(void)
{	
	menu_page_init(menu_gyro_acc_page);
	while(1)
	{
		menu_back_button_show();
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
		screen_float(60,MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_x.data_float,2,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_y.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_y.data_float,2,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_z.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_GYRO_ACC.gyro_z.data_float,2,3);
		// 显示加速度计
		screen_string(0,4*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_x.name);
		screen_float(60,4*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_x.data_float,2,3);
		screen_string(0,5*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_y.name);
		screen_float(60,5*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_y.data_float,2,3);
		screen_string(0,6*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_z.name);
		screen_float(60,6*MENU_ROW_PITCH,MENU_GYRO_ACC.acc_z.data_float,2,3);
	}
}

/* 菜单底盘数据页面 */
void menu_chassis_page(void)
{
	menu_page_init(menu_chassis_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_data_change(menu_chassis_data_add,menu_chassis_data_reduce);
		menu_title_show();
	
		MENU_CHASSIS.yaw.data_float = yaw;
		MENU_CHASSIS.linear_speed.data_float = linear_speed;
		MENU_CHASSIS.angular_speed.data_float = angular_speed;
	
		// 显示底盘数据
		
		screen_string(0,MENU_ROW_PITCH,MENU_CHASSIS.yaw.name);
		screen_float(60,MENU_ROW_PITCH,MENU_CHASSIS.yaw.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_CHASSIS.linear_speed.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_CHASSIS.linear_speed.data_float,2,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_CHASSIS.angular_speed.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_CHASSIS.angular_speed.data_float,2,3);
	}
}

/* 菜单循线数据页面 */
void menu_path_page(void)
{
	menu_page_init(menu_path_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_data_change(menu_path_data_add,menu_path_data_reduce);
		menu_title_show();
		
		MENU_PATH.linear_speed_target.data_float = linear_speed_target;
		MENU_PATH.path_start.data_int16 = path_start;
		MENU_PATH.path_end.data_int16 = path_end;
		MENU_PATH.control_point.data_int16 = control_point;
		MENU_PATH.prediction_point.data_int16 = prediction_point;
	
		// 显示底盘数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH.linear_speed_target.name);
		screen_float(60,MENU_ROW_PITCH,MENU_PATH.linear_speed_target.data_float,2,4);
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH.path_start.name);
		screen_int(60,2*MENU_ROW_PITCH,MENU_PATH.path_start.data_int16,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH.path_end.name);
		screen_int(60,3*MENU_ROW_PITCH,MENU_PATH.path_end.data_int16,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH.control_point.name);
		screen_int(60,4*MENU_ROW_PITCH,MENU_PATH.control_point.data_int16,3);
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH.prediction_point.name);
		screen_int(60,5*MENU_ROW_PITCH,MENU_PATH.prediction_point.data_int16,3);
	}
}

/* 菜单电机1 PID页面 */
void menu_motor_1_pid_page(void)
{
	menu_page_init(menu_motor_1_pid_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_data_change(menu_motor_1_pid_add,menu_motor_1_pid_reduce);
		menu_title_show();
	
		MENU_MOTOR_1_PID.p.data_float = chassis_pid.motor_1_pid.p;
		MENU_MOTOR_1_PID.i.data_float = chassis_pid.motor_1_pid.i;
		MENU_MOTOR_1_PID.d.data_float = chassis_pid.motor_1_pid.d;
		MENU_MOTOR_1_PID.output_limit.data_float = chassis_pid.motor_1_pid.output_limit;
		MENU_MOTOR_1_PID.i_limit.data_float = chassis_pid.motor_1_pid.i_limit;
	
		// 显示电机1 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_1_PID.p.name);
		screen_float(60,MENU_ROW_PITCH,MENU_MOTOR_1_PID.p.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i.data_float,3,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.d.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_MOTOR_1_PID.d.data_float,3,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.output_limit.name);
		screen_float(60,4*MENU_ROW_PITCH,MENU_MOTOR_1_PID.output_limit.data_float,5,1);
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i_limit.name);
		screen_float(60,5*MENU_ROW_PITCH,MENU_MOTOR_1_PID.i_limit.data_float,3,3);
	}
}

/* 菜单电机2 PID页面 */
void menu_motor_2_pid_page(void)
{
	menu_page_init(menu_motor_2_pid_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_data_change(menu_motor_2_pid_add,menu_motor_2_pid_reduce);
		menu_title_show();
	
		MENU_MOTOR_2_PID.p.data_float = chassis_pid.motor_2_pid.p;
		MENU_MOTOR_2_PID.i.data_float = chassis_pid.motor_2_pid.i;
		MENU_MOTOR_2_PID.d.data_float = chassis_pid.motor_2_pid.d;
		MENU_MOTOR_2_PID.output_limit.data_float = chassis_pid.motor_2_pid.output_limit;
		MENU_MOTOR_2_PID.i_limit.data_float = chassis_pid.motor_2_pid.i_limit;
	
		// 显示电机2 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_2_PID.p.name);
		screen_float(60,MENU_ROW_PITCH,MENU_MOTOR_2_PID.p.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i.data_float,3,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.d.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_MOTOR_2_PID.d.data_float,3,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.output_limit.name);
		screen_float(60,4*MENU_ROW_PITCH,MENU_MOTOR_2_PID.output_limit.data_float,5,1);
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i_limit.name);
		screen_float(60,5*MENU_ROW_PITCH,MENU_MOTOR_2_PID.i_limit.data_float,3,3);
	}
}

/* 菜单电机3 PID页面 */
void menu_motor_3_pid_page(void)
{
	menu_page_init(menu_motor_3_pid_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_data_change(menu_motor_3_pid_add,menu_motor_3_pid_reduce);
		menu_title_show();
	
		MENU_MOTOR_3_PID.p.data_float = chassis_pid.motor_3_pid.p;
		MENU_MOTOR_3_PID.i.data_float = chassis_pid.motor_3_pid.i;
		MENU_MOTOR_3_PID.d.data_float = chassis_pid.motor_3_pid.d;
		MENU_MOTOR_3_PID.output_limit.data_float = chassis_pid.motor_3_pid.output_limit;
		MENU_MOTOR_3_PID.i_limit.data_float = chassis_pid.motor_3_pid.i_limit;
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_MOTOR_3_PID.p.name);
		screen_float(60,MENU_ROW_PITCH,MENU_MOTOR_3_PID.p.data_float,3,3);
		screen_string(0,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i.data_float,3,3);
		screen_string(0,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.d.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_MOTOR_3_PID.d.data_float,3,3);
		screen_string(0,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.output_limit.name);
		screen_float(60,4*MENU_ROW_PITCH,MENU_MOTOR_3_PID.output_limit.data_float,5,1);
		screen_string(0,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i_limit.name);
		screen_float(60,5*MENU_ROW_PITCH,MENU_MOTOR_3_PID.i_limit.data_float,3,3);
	}
}

/* 菜单循迹 PID页面 */
void menu_path_pid_page(void)
{
	menu_page_init(menu_path_pid_page);
	while(1)
	{
		menu_back_button_show();
		menu_point();
		menu_data_change(menu_path_pid_add,menu_path_pid_reduce);
		menu_title_show();
	
		MENU_PATH_PID.p.data_float = path_pid.p;
		MENU_PATH_PID.i.data_float = path_pid.i;
		MENU_PATH_PID.d.data_float = path_pid.d;
		MENU_PATH_PID.output_limit.data_float = path_pid.output_limit;
		MENU_PATH_PID.i_limit.data_float = path_pid.i_limit;
	
		// 显示电机3 PID数据
		screen_string(0,MENU_ROW_PITCH,MENU_PATH_PID.p.name);
		screen_float(60,MENU_ROW_PITCH,MENU_PATH_PID.p.data_float,1,5);
		screen_string(0,2*MENU_ROW_PITCH,MENU_PATH_PID.i.name);
		screen_float(60,2*MENU_ROW_PITCH,MENU_PATH_PID.i.data_float,1,5);
		screen_string(0,3*MENU_ROW_PITCH,MENU_PATH_PID.d.name);
		screen_float(60,3*MENU_ROW_PITCH,MENU_PATH_PID.d.data_float,1,5);
		screen_string(0,4*MENU_ROW_PITCH,MENU_PATH_PID.output_limit.name);
		screen_float(60,4*MENU_ROW_PITCH,MENU_PATH_PID.output_limit.data_float,1,5);
		screen_string(0,5*MENU_ROW_PITCH,MENU_PATH_PID.i_limit.name);
		screen_float(60,5*MENU_ROW_PITCH,MENU_PATH_PID.i_limit.data_float,1,5);
	}
}

/**********************************************************************/

/****************************** 菜单页面服务 ******************************/

/* 菜单底盘数据页面服务 */
void menu_chassis_data_add(void)
{
	switch(point_row_num)
	{
		case 0:{ yaw+=1; break; }
		case 1:{ linear_speed+=0.1; break; }
		case 2:{ angular_speed+=0.1; break; }
	}
}
void menu_chassis_data_reduce(void)
{
	switch(point_row_num)
	{
		case 0:{ yaw-=1; break; }
		case 1:{ linear_speed-=0.1; break; }
		case 2:{ angular_speed-=0.1; break; }
	}
}

/* 菜单循线数据页面服务 */
void menu_path_data_add(void)
{
	switch(point_row_num)
	{
		case 0:{ linear_speed_target+=0.1; break; }
		case 1:{ path_start+=1; break; }
		case 2:{ path_end+=1; break; }
		case 3:{ control_point+=1; break; }
		case 4:{ prediction_point+=1; break; }
	}
}
void menu_path_data_reduce(void)
{
	switch(point_row_num)
	{
		case 0:{ linear_speed_target-=0.1; break; }
		case 1:{ path_start-=1; break; }
		case 2:{ path_end-=1; break; }
		case 3:{ control_point-=1; break; }
		case 4:{ prediction_point-=1; break; }
	}
}

/* 菜单电机1 PID页面服务 */
void menu_motor_1_pid_add(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_1_pid.p+=1; break; }
		case 1:{ chassis_pid.motor_1_pid.i+=0.1; break; }
		case 2:{ chassis_pid.motor_1_pid.d+=1; break; }
		case 3:{ chassis_pid.motor_1_pid.output_limit+=5; break; }
		case 4:{ chassis_pid.motor_1_pid.i_limit+=5; break; }
	}
}
void menu_motor_1_pid_reduce(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_1_pid.p-=1; break; }
		case 1:{ chassis_pid.motor_1_pid.i-=0.1; break; }
		case 2:{ chassis_pid.motor_1_pid.d-=1; break; }
		case 3:{ chassis_pid.motor_1_pid.output_limit-=5; break; }
		case 4:{ chassis_pid.motor_1_pid.i_limit-=5; break; }
	}
}

/* 菜单电机2 PID页面服务 */
void menu_motor_2_pid_add(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_2_pid.p+=1; break; }
		case 1:{ chassis_pid.motor_2_pid.i+=0.1; break; }
		case 2:{ chassis_pid.motor_2_pid.d+=1; break; }
		case 3:{ chassis_pid.motor_2_pid.output_limit+=5; break; }
		case 4:{ chassis_pid.motor_2_pid.i_limit+5; break; }
	}
}
void menu_motor_2_pid_reduce(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_2_pid.p-=1; break; }
		case 1:{ chassis_pid.motor_2_pid.i-=0.1; break; }
		case 2:{ chassis_pid.motor_2_pid.d-=1; break; }
		case 3:{ chassis_pid.motor_2_pid.output_limit-=5; break; }
		case 4:{ chassis_pid.motor_2_pid.i_limit-5; break; }
	}
}

/* 菜单电机3 PID页面服务 */
void menu_motor_3_pid_add(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_3_pid.p+=1; break; }
		case 1:{ chassis_pid.motor_3_pid.i+=0.1; break; }
		case 2:{ chassis_pid.motor_3_pid.d+=1; break; }
		case 3:{ chassis_pid.motor_3_pid.output_limit+=5; break; }
		case 4:{ chassis_pid.motor_3_pid.i_limit+=5; break; }
	}
}
void menu_motor_3_pid_reduce(void)
{
	switch(point_row_num)
	{
		case 0:{ chassis_pid.motor_3_pid.p-=1; break; }
		case 1:{ chassis_pid.motor_3_pid.i-=0.1; break; }
		case 2:{ chassis_pid.motor_3_pid.d-=1; break; }
		case 3:{ chassis_pid.motor_3_pid.output_limit-=5; break; }
		case 4:{ chassis_pid.motor_3_pid.i_limit-=5; break; }
	}
}

/* 菜单循迹 PID页面服务 */
void menu_path_pid_add(void)
{
	switch(point_row_num)
	{
		case 0:{ path_pid.p+=0.0005; break; }
		case 1:{ path_pid.i+=0.00005; break; }
		case 2:{ path_pid.d+=0.00005; break; }
		case 3:{ path_pid.output_limit+=0.05; break; }
		case 4:{ path_pid.i_limit+=0.005; break; }
	}
}
void menu_path_pid_reduce(void)
{
	switch(point_row_num)
	{
		case 0:{ path_pid.p-=0.0005; break; }
		case 1:{ path_pid.i-=0.00005; break; }
		case 2:{ path_pid.d-=0.00005; break; }
		case 3:{ path_pid.output_limit-=0.05; break; }
		case 4:{ path_pid.i_limit-=0.005; break; }
	}
}

/*************************************************************************/




	