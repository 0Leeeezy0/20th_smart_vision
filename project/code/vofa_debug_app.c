 /*
该文件用于连接VOFA进行调试

API：
****用户****
命令行数据命令匹配
命令行APP运行
************

****APP****
命令错误
命令行信息
命令行帮助
命令行清屏
电机速度（理论）上传
电机速度（现实）上传
电机占空比上传
陀螺仪上传
加速度计上传
循迹路径误差上传
上传数据添加
上传数据结束
************
*/

#include "common.h"

/* 命令行内置APP */
static _CMD_APP_LIST_ cli_app_list[]=
{
	{"CMD_ERROR",9,"CLI commond error",cmd_error},
	{"CLI -info",9,"CLI information",cli_info},
	{"CLI -help",9,"CLI commond description",cli_help},
	{"CLI -clear",10,"clear CLI screen",cli_clear}
};

/* 命令行用户APP */
static _CMD_APP_LIST_ user_app_list[]=
{
	{"theory_motor_speed_update",25,"theory_motor_speed",theory_motor_speed_update},
	{"real_motor_speed_update",23,"real_motor_speed",real_motor_speed_update},
	{"motor_duty_update",17,"motor_duty",motor_duty_update},
	{"gyro_update",11,"gyro_value",gyro_update},
	{"acc_update",10,"acc_value",acc_update},
	{"path_err_update",15,"path_err",path_err_update},
	{"update_data_add",15," ",update_data_add},
	{"update_data_end",15," ",update_data_end},
	{"game_start",10,"start your fucking car",game_start},
	{"remote_control",14,"remote control",remote_control},
	{"menu",4,"menu",menu}
};

/* 命令行数据命令匹配 */
_CMD_APP_LIST_* cli_data_cmd_match(_CLI_DATA_* data_rx)
{
	uint32 i_cli = 0;
	uint32 i_user = 0;
	uint8_t user_cmd_match_flag = 1;
	uint8_t exit_flag_cli = 0;
	uint8_t exit_flag_user = 0;

    // 检索内置命令
	for(i_cli = 1;i_cli < sizeof(cli_app_list)/sizeof(cli_app_list[0]);i_cli++)
	{
		uint32 match_count = 0;
		// 遍历命令匹配表（除第一个）
		for(int j = 0;j < cli_app_list[i_cli].CMD_LEN;j++)
		{
			// 匹配命令
			if(cli_data_read(data_rx,j+1) != cli_app_list[i_cli].CMD[j])
			{
				match_count++;
			}
			if(j == cli_app_list[i_cli].CMD_LEN-1 && match_count == 0 && data_rx -> Num == cli_app_list[i_cli].CMD_LEN+2)
			{
				exit_flag_cli = 1;
				break;
			}
		}
		if(exit_flag_cli == 1)
		{
			return &(cli_app_list[i_cli]);
			user_cmd_match_flag = 0;
			break;
		}
	}
	// 检索用户命令
	if(user_cmd_match_flag == 1)
	{
		for(i_user = 0;i_user < sizeof(user_app_list)/sizeof(user_app_list[0]);i_user++)
		{
			uint32 match_count = 0;
			// 遍历命令匹配表（除第一个）
			for(uint32 j = 0;j < user_app_list[i_user].CMD_LEN;j++)
			{
				// 匹配命令
				if(cli_data_read(data_rx,j+1) != user_app_list[i_user].CMD[j])
				{
					match_count++;
				}
				if(j == user_app_list[i_user].CMD_LEN-1 && match_count == 0 && data_rx -> Num == user_app_list[i_user].CMD_LEN+2)
				{
					exit_flag_user = 1;
					break;
				}
			}
			if(exit_flag_user == 1)
			{
				return &(user_app_list[i_user]);
				break;
			}
		}
	}
	if(i_cli == sizeof(cli_app_list)/sizeof(cli_app_list[0]) && i_user == sizeof(user_app_list)/sizeof(user_app_list[0]))
	{
		return &(cli_app_list[0]);
	}
}

/* 命令行APP运行 */
void cli_app_run(_CMD_APP_LIST_* cli_app_run)
{
	cli_app_run -> CMD_FUNC();
}

/* 命令错误 */
void cmd_error(void)
{
	printf("No Such Commond\n");
}

/* 命令行信息 */
void cli_info(void)
{
	char choice[2] = {' ','*'};

	printf("***********************************************\n");
	// 命令行回显
	printf("*Local Echo [%c]\n",choice[CLI_LOCAL_ECHO_EN]);
	// 命令行删除
	printf("*Delete Char [%c]\n",choice[CLI_DELETE_EN]);
	// 作者信息
	printf("*Author: Leeeezy\n");
	printf("*Github ID: 0Leeeezy0\n");
	printf("***********************************************\n");
}

/* 命令行帮助 */
void cli_help(void)
{
	uint32_t i = 0;
	printf("***********************************************\n");
	for(i = 1;i < sizeof(cli_app_list)/sizeof(cli_app_list[0]);i++)
	{
		printf("%s:",cli_app_list[i].CMD);
		printf("%s\n",cli_app_list[i].CMD_DESCRIPTION);
	}
	for(i = 1;i < sizeof(user_app_list)/sizeof(user_app_list[0]);i++)
	{
		printf("%s:",user_app_list[i].CMD);
		printf("%s\n",user_app_list[i].CMD_DESCRIPTION);
	}
	printf("***********************************************\n");
}

/* 命令行清屏 */
void cli_clear(void)
{
	char data = 0x0c;
	printf(&data);
}

/* 逆解算电机速度（理论）上传 */
void theory_motor_speed_update(void)
{	
	printf("%f,%f,%f",chassis_control.motor_1_speed,chassis_control.motor_2_speed,chassis_control.motor_3_speed);
}

/* 电机速度（现实）上传 */
void real_motor_speed_update(void)
{	
	printf("%f,%f,%f",motor_1_speed,motor_2_speed,motor_3_speed);
}

/* 电机占空比上传 */
void motor_duty_update(void)
{	
	printf("%f,%f,%f",(float)chassis_control.motor_1.duty,(float)chassis_control.motor_2.duty,(float)chassis_control.motor_3.duty);
}

/* 陀螺仪上传 */
void gyro_update(void)
{	
	printf("%f,%f,%f",gyro_x,gyro_y,gyro_z);
}

/* 加速度计上传 */
void acc_update(void)
{	
	printf("%f,%f,%f",acc_x,acc_y,acc_z);
}

/* 循迹路径误差上传 */
void path_err_update(void)
{
	printf("%f",path_err);
}

/* 上传数据添加 */
void update_data_add(void)
{
	printf(",");
}

/* 上传数据结束 */
void update_data_end(void)
{
	printf("\n");
}

/* 发车 */
void game_start(void)
{
	uint8 data_rx_char;
	printf("press ENTER to exit\n");                      
	while(1)
	{
		threshold();
		path_search();
		path_draw();
		tft180_show_gray_image(0, 0, image_OTSU[0], MT9V03X_W, MT9V03X_H, MT9V03X_W, MT9V03X_H, 0);
 		path_control(linear_speed_target);
		
		wireless_uart_read_buffer(&data_rx_char,1);
		if(data_rx_char == '\n' || data_rx_char == '\r')
		{
			chassis_yaw = 0;
			chassis_linear_speed = 0;
			chassis_angular_speed = 0;
			break;
		}
	}
}

/* 远程控制 */
void remote_control(void)
{
	uint8 data_rx_char; 
	
	chassis_yaw = 0;
	chassis_linear_speed = 0;
	chassis_angular_speed = 0;
	int16 time = 0;
	
	while(1)
	{	
		cli_clear();
		printf("press Q to exit\n");  
		printf("YAW : %f\nL_SPEED : %f\nA_SPEED : %f\n",chassis_yaw,chassis_angular_speed,chassis_linear_speed);
		wireless_uart_read_buffer(&data_rx_char,1);
		
		/* 操控 */
		// 前进
		if(data_rx_char == 'w')
		{
			chassis_yaw = 0;
			chassis_linear_speed += 0.3;
			chassis_angular_speed = 0;
			data_rx_char = 0;
			time = 0;
		}
		// 左转
		else if(data_rx_char == 'a')
		{
			chassis_yaw = 0;
			chassis_angular_speed = -1;
			data_rx_char = 0;
			time = 0;
		}
		// 后退
		else if(data_rx_char == 's')
		{
			chassis_yaw = 0;
			chassis_linear_speed -= 0.3;
			chassis_angular_speed = 0;
			data_rx_char = 0;
			time = 0;
		}
		// 右转
		else if(data_rx_char == 'd')
		{
			chassis_yaw = 0;
			chassis_angular_speed = 1;
			data_rx_char = 0;
			time = 0;
		}
		// 刹车
		else if(data_rx_char == 'e')
		{
			chassis_yaw = 0;
			chassis_linear_speed = 0;
			chassis_angular_speed = 0;
			time = 0;
		}
		// 退出
		else if(data_rx_char == 'q')
		{
			chassis_yaw = 0;
			chassis_linear_speed = 0;
			chassis_angular_speed = 0;
			break;
		}
		// 按键未按下超时
		else
		{
			if(time > 40)
			{
				chassis_linear_speed = 0;
				chassis_angular_speed = 0;
			}
			else
			{
				time++;
			}
		}
		// 限幅
		if(abs(chassis_linear_speed) > 6)
		{
			chassis_linear_speed = 6*abs(chassis_linear_speed)/chassis_linear_speed;
		}
	}
}

/* 菜单 */
void menu(void)
{
	chassis_yaw = 0;
	chassis_linear_speed = 0;
	chassis_angular_speed = 0;
	menu_service_start();
}
