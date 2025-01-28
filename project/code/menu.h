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

#ifndef _MENU_H_
#define _MENU_H_

#include "common.h"

/****************************** 屏幕兼容 ******************************/

/* 显示字符串函数指针 */ 
typedef void (*FUNC_STRING)(uint16, uint16, const char dat[]);
/* 显示整型函数指针 */
typedef void (*FUNC_INT)(uint16, uint16, const int32, uint8);
/* 显浮点型函数指针 */
typedef void (*FUNC_FLOAT)(uint16, uint16, const double, uint8, uint8);
/* 清屏函数指针 */
typedef void (*FUNC_CLEAR)(void);

/**********************************************************************/

/****************************** 菜单组件 ******************************/

/* 菜单页面函数指针 */
typedef void (*FUNC_PAGE)(void);
/* 菜单页面服务指针 */
typedef void (*FUNC_SERVICE)(void);

/* 菜单页面 */
typedef struct
{
	char* name;	// 页面名称
	int16 title_show;	// 标题显示
	int16 page_level;	// 页面级别（由0-∞分级）
	int16 page_num;	// 页面序号（按同一级的先后顺序由0起排序）
	int16 page_row_num;	// 页面选项行数
	FUNC_PAGE func_page;	// 菜单页面索引
}_MENU_PAGE_;

/* 菜单初始化 */
void menu_init(void);

/* 菜单页面初始化 */
void menu_page_init(FUNC_PAGE func_page);

/* 菜单服务启动 */
void menu_service_start(void);

/* 按键动作获取 */
void key_action_get(void);

/* 返回按键显示 */
void menu_back_button_show(void);

/* 页面标题显示 */
void menu_title_show(void);

/* 菜单返回 */
void menu_back(void);

/* 菜单选项指针 */
void menu_point(void);

/* 菜单数据更改 */
void menu_data_change(FUNC_SERVICE func_service_add,FUNC_SERVICE func_service_reduce);

/* 根页面 */
void menu_root_page(void);

/**********************************************************************/

/****************************** 菜单页面 ******************************/

/* 启动 */
void start(void);

/* 保存参数 */
void save(void);

/* 加载参数 */
void load(void);

/* 命令行 */
void cli(void);

/* 传感器校准 */
void sensor_calibrate(void);

/* 菜单编码器页面 */
void menu_encoder_page(void);

/* 菜单电机页面 */
void menu_motor_page(void);

/* 陀螺仪、加速度计页面 */
void menu_gyro_acc_page(void);

/* 菜单欧拉角页面 */
void menu_euler_angle_page(void);

/* 菜单底盘数据页面 */
void menu_chassis_page(void);

/* 菜单循线数据页面 */
void menu_path_page(void);

/* 菜单电机1 PID页面 */
void menu_motor_1_pid_page(void);

/* 菜单电机2 PID页面 */
void menu_motor_2_pid_page(void);

/* 菜单电机3 PID页面 */
void menu_motor_3_pid_page(void);

/* 菜单循迹 PID页面 */
void menu_path_pid_page(void);

/**********************************************************************/

/****************************** 菜单页面服务 ******************************/

/* 菜单底盘数据页面服务 */
void menu_chassis_data_add(void);
void menu_chassis_data_reduce(void);

/* 菜单循线数据页面服务 */
void menu_path_data_add(void);
void menu_path_data_reduce(void);

/* 菜单电机1 PID页面服务 */
void menu_motor_1_pid_add(void);
void menu_motor_1_pid_reduce(void);

/* 菜单电机2 PID页面服务 */
void menu_motor_2_pid_add(void);
void menu_motor_2_pid_reduce(void);

/* 菜单电机3 PID页面服务 */
void menu_motor_3_pid_add(void);
void menu_motor_3_pid_reduce(void);

/* 菜单循迹 PID页面服务 */
void menu_path_pid_add(void);
void menu_path_pid_reduce(void);

/*************************************************************************/

#endif