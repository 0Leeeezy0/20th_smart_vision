#ifndef _DOG_MENU_H_
#define _DOG_MENU_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

// 菜单控件
struct DOG_MENU_WIDGET{
	/* 控件参数 */
	char* name;				// 控件显示的字符名称
	_data_kind_ data_kind;	// 数据类型
	int8* data_int8; 		// int8类型数据
	uint8* data_uint8;		// uint8类型数据
	int16* data_int16; 		// int16类型数据
	uint16* data_uint16;	// uint16类型数据
	int32* data_int32; 		// int32类型数据
	uint32* data_uint32;	// uint32类型数据
	float* data_float;		// float类型数据
	double* data_double;	// double类型数据
	
	_bool_ change_enable_flag;	// 更改使能标志位
	
	uint32 x;	// 控件放置X坐标
	uint32 y;	// 控件放置Y坐标 
	
	/* 成员函数 */
	void (*widget_data_add)(struct DOG_MENU_WIDGET* this, uint32 step);		// 增加
	void (*widget_data_reduce)(struct DOG_MENU_WIDGET* this, uint32 step);	// 减少
	void (*widget_choose)(struct DOG_MENU_WIDGET* this);					// 控件选中
};

// 数据增加
void data_add(struct DOG_MENU_WIDGET* this, uint32 step);
// 数据减少
void data_reduce(struct DOG_MENU_WIDGET* this, uint32 step);

// 构造函数	
void menu_widget(struct DOG_MENU_WIDGET* this, char* name, _bool_ change_enable_flag, uint32 x, uint32 y, _data_kind_ data_kind, ...);

// 菜单页面
struct DOG_MENU_PAGE{
	/* 页面参数 */
	char* name;	// 页面名字
	uint16 page_level;	// 
	_bool_ title_enable_flag;	// 页面标题使能标志位
	/* 成员函数 */
	void (*menu_pointer)(struct DOG_MENU_PAGE* this);	// 菜单指针
};

#endif