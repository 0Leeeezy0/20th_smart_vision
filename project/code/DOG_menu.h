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

#ifndef _DOG_MENU_H_
#define _DOG_MENU_H_

#include "common.h"

/****************************** 屏幕兼容 ******************************/

/* 显示字符串函数指针 */ 
typedef void (*FUNC_STRING)(uint16, uint16, const char dat[]);
/* 显示整型函数指针 */
typedef void (*FUNC_INT)(uint16, uint16, const int32, uint8);
/* 显示无符号整型函数指针 */
typedef void (*FUNC_UINT)(uint16, uint16, const uint32, uint8);
/* 显示浮点型函数指针 */
typedef void (*FUNC_FLOAT)(uint16, uint16, const double, uint8, uint8);
/* 显示灰度图像 */
typedef void (*FUNC_IMAGE)(uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 threshold);
/* 清屏函数指针 */
typedef void (*FUNC_CLEAR)(void);
/* 显示直线函数指针 */
typedef void (*FUNC_DRAW_LINE)(uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end, const uint16 color);
/* 显示点函数指针 */
typedef void (*FUNC_DRAW_POINT)(uint16 x, uint16 y, const uint16 color);

extern FUNC_STRING screen_string;
extern FUNC_INT screen_int;
extern FUNC_UINT screen_uint;
extern FUNC_FLOAT screen_float;
extern FUNC_IMAGE screen_image;
extern FUNC_CLEAR screen_clear;
extern FUNC_DRAW_LINE screen_draw_line;
extern FUNC_DRAW_POINT screen_draw_point;

/**********************************************************************/

/****************************** 菜单组件 ******************************/

/* 菜单页面函数指针 */
typedef void (*FUNC_PAGE)(void);
/* 菜单页面服务指针 */
typedef void (*FUNC_PAGE_SERVICE)(void);
/* 菜单页面返回服务指针 */
typedef void (*FUNC_PAGE_BACK_SERVICE)(void);

/* 菜单页面 */
typedef struct
{
	char* name;	// 页面名称
	int16 title_show;	// 标题显示
	int16 page_level;	// 页面级别（由0-∞分级）
	int16 page_num;	// 页面序号（按同一级的先后顺序由0起排序）
	int16 page_row_num;	// 页面选项行数
	FUNC_PAGE func_page;	// 菜单页面索引
	_DEBUG_MODE_ debug_mode;	// 调试模式
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

/* 菜单返回 */
void menu_back(FUNC_PAGE_BACK_SERVICE func_page_back_service);

/* 菜单选项指针 */
void menu_point(void);

/* 菜单数据更改 */
void menu_data_change(FUNC_PAGE_SERVICE func_service_add,FUNC_PAGE_SERVICE func_service_reduce);

/* 根页面 */
void menu_root_page(void);

/**********************************************************************/

/****************************** 菜单页面 ******************************/

/* 启动 */
void start(void);

/* 调试 */
void debug(void);

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

/* 菜单平动位移页面 */
void menu_translate_shift_page(void);

/* 对称法矫正数据页面 */
void menu_symmetry_rectificate_page(void);
	
/* AI摄像头0 数据页面 */
void menu_ai_camera_0_page(void);

/* AI摄像头1 数据页面 */
void menu_ai_camera_1_and_2_page(void);

/* AI识别列表页面 */
void menu_detection_list(void);

/* 菜单底盘数据页面 */
void menu_chassis_page(void);

/* 菜单循线数据页面 */
void menu_path_page(void);

/* 菜单圆环循线数据页面 */
void menu_circle_path_page(void);

/* 菜单电机1 PID页面 */
void menu_motor_1_pid_page(void);

/* 菜单电机2 PID页面 */
void menu_motor_2_pid_page(void);

/* 菜单电机3 PID页面 */
void menu_motor_3_pid_page(void);

/* 菜单循迹 PID页面 */
void menu_path_pid_page(void);

/* 菜单转动角度 PID角度 */
void menu_rotate_angle_pid_page(void);

/**********************************************************************/

/****************************** 菜单页面服务 ******************************/

/* 菜单启动页面返回服务 */
void menu_start_page_back_service(void);

/* 菜单调试页面返回服务 */
void menu_debug_page_back_service(void);

/* 菜单欧拉角页面返回服务 */
void menu_euler_angle_page_back_service(void);

/* 平动位移解算页面返回服务 */
void menu_translate_shift_page_back_service(void);

/* 菜单对称法矫正数据页面服务 */
//void menu_symmetry_rectificate_data_add_service(void);
//void menu_asymmetry_rectificate_data_reduce_service(void);

/* 电机数据页面服务 */
void menu_motor_data_add_service(void);
void menu_motor_data_reduce_service(void);

/* 菜单AI摄像头0数据页面服务 */
void menu_ai_camera_0_data_add_service(void);
void menu_ai_camera_0_data_reduce_service(void);

/* 菜单底盘数据页面服务 */
void menu_chassis_data_add_service(void);
void menu_chassis_data_reduce_service(void);

/* 菜单循线数据页面服务 */
void menu_path_data_add_service(void);
void menu_path_data_reduce_service(void);

/* 菜单圆环循线数据页面服务 */
void menu_circle_path_data_add_service(void);
void menu_circle_path_data_reduce_service(void);

/* 菜单电机1 PID页面服务 */
void menu_motor_1_pid_add_service(void);
void menu_motor_1_pid_reduce_service(void);

/* 菜单电机2 PID页面服务 */
void menu_motor_2_pid_add_service(void);
void menu_motor_2_pid_reduce_service(void);

/* 菜单电机3 PID页面服务 */
void menu_motor_3_pid_add_service(void);
void menu_motor_3_pid_reduce_service(void);

/* 菜单循迹 PID页面服务 */
void menu_path_pid_add_service(void);
void menu_path_pid_reduce_service(void);

/* 菜单转动角度 PID页面服务 */
void menu_rotate_angle_pid_add_service(void);
void menu_rotate_angle_pid_reduce_service(void);

/*************************************************************************/

#endif