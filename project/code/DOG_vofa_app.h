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

#ifndef _DOG_VOFA_APP_H_
#define _DOG_VOFA_APP_H_

#include "common.h"

/* 命令应用对应 */
typedef struct
{
	char* CMD;	// 命令
	uint32 CMD_LEN;	// 命令长度
	char* CMD_DESCRIPTION;	// 命令介绍
	void (*CMD_FUNC)(void);	//对应处理函数
}_CMD_APP_LIST_;

/* 命令行数据命令匹配 */
_CMD_APP_LIST_* cli_data_cmd_match(_CLI_DATA_* data_rx);

/* 命令行APP运行 */
void cli_app_run(_CMD_APP_LIST_* cli_app_run);

/* 命令错误 */
void cmd_error(void);

/* 命令行信息 */
void cli_info(void);

/* 命令行帮助 */
void cli_help(void);

/* 命令行清屏 */
void cli_clear(void);

/* 电机速度（理论）上传 */
void theory_motor_speed_update(void);

/* 电机速度（现实）上传 */
void real_motor_speed_update(void);

/* 电机占空比上传 */
void motor_duty_update(void);

/* 电机errot上传 */
void motor_error_update(void);
    
/* 电机delta上传 */
void motor_delta_update(void);

/* 电机value_delta上传 */
void motor_value_delta_update(void);

/* 陀螺仪上传 */
void gyro_update(void);

/* 加速度计上传 */
void acc_update(void);

/* 欧拉角上传 */
void euler_angle_update(void);

/* 循迹路径误差上传 */
void path_err_update(void);

/* 上传数据添加 */
void update_data_add(void);

/* 上传数据结束 */
void update_data_end(void);

/* 上传数据 */
void update_data(void);

/* 发车 */
void game_start(void);

/* 远程控制 */
void remote_control(void);

/* 菜单 */
void menu(void);

#endif