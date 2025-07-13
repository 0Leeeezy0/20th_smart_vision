#ifndef _DOG_MENU_H_
#define _DOG_MENU_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"
#include "DOG_data.h"

#define MAX_PAGE_WIDGET_NUM 	(50)	// 页面最大容纳控件数量
#define SCREEN_KIND 			(1)		// 屏幕选择（ 0:tft180 1:ips200 ）
#define FONT_WIDTH				(6)		// 显示字体宽度（6/8）
#define FONT_HEIGHT				(8)		// 显示字体高度（8/16）

/* 显示字符串函数指针 */ 
typedef void (*SCREEN_STRING)(uint16, uint16, const char dat[]);
/* 显示整型函数指针 */
typedef void (*SCREEN_INT)(uint16, uint16, const int32, uint8);
/* 显示无符号整型函数指针 */
typedef void (*SCREEN_UINT)(uint16, uint16, const uint32, uint8);
/* 显示浮点型函数指针 */
typedef void (*SCREEN_FLOAT)(uint16, uint16, const double, uint8, uint8);
/* 显示灰度图像 */
typedef void (*SCREEN_IMAGE)(uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 threshold);
/* 清屏函数指针 */
typedef void (*SCREEN_CLEAR)(void);
/* 显示直线函数指针 */
typedef void (*SCREEN_DRAW_LINE)(uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end, const uint16 color);
/* 显示点函数指针 */
typedef void (*SCREEN_DRAW_POINT)(uint16 x, uint16 y, const uint16 color);

struct DOG_MENU_WIDGET;
struct DOG_MENU_PAGE;

// 菜单控件
typedef struct DOG_MENU_WIDGET{
	/* 控件参数 */
	char* name;				// 控件字符名称
	_data_kind_ data_kind;	// 数据类型
	int8* data_int8; 		// int8类型数据
	uint8* data_uint8;		// uint8类型数据
	int16* data_int16; 		// int16类型数据
	uint16* data_uint16;	// uint16类型数据
	int32* data_int32; 		// int32类型数据
	uint32* data_uint32;	// uint32类型数据
	float* data_float;		// float类型数据
	double* data_double;	// double类型数据
	void (*MENU_PAGE)(void);	// 页面函数
	
	_bool_ change_enable_flag;	// 数据更改使能标志位
	_bool_ title_enable_flag;	// 页面标题使能标志位
	
	uint32 x;	// 控件放置X坐标
	uint32 y;	// 控件放置Y坐标 
	
	/* 成员函数 */
	void (*data_add)(struct DOG_MENU_WIDGET* this, uint8 idx, double step);		// 数据增加
	void (*data_reduce)(struct DOG_MENU_WIDGET* this, uint8 idx, double step);	// 数据减少
	void (*data_bind)(struct DOG_MENU_WIDGET* this, _bool_ change_enable_flag, _data_kind_ data_kind, ...);	// 数据绑定
	void (*page_bind)(struct DOG_MENU_WIDGET* this, _bool_ title_enable_flag, void (*MENU_PAGE)(void));		// 页面绑定
}DOG_MENU_WIDGET;

// 数据增加
void data_add(struct DOG_MENU_WIDGET* this, uint8 idx, double step);
// 数据减少
void data_reduce(struct DOG_MENU_WIDGET* this, uint8 idx, double step);
// 数据绑定
void data_bind(struct DOG_MENU_WIDGET* this, _bool_ change_enable_flag, _data_kind_ data_kind, ...);	
// 页面绑定
void page_bind(struct DOG_MENU_WIDGET* this, _bool_ title_enable_flag, void (*MENU_PAGE)(void));		
// 构造函数	
void widget(struct DOG_MENU_WIDGET* this, char* name, uint32 x, uint32 y);
// 析构函数	
void _widget(struct DOG_MENU_WIDGET* this);

// 菜单页面
typedef struct DOG_MENU_PAGE{
	/* 页面参数 */
	struct DOG_MENU_WIDGET* menu_page_widget_bind;		// 绑定该页面的控件
	struct DOG_MENU_WIDGET* menu_widgets[MAX_PAGE_WIDGET_NUM];			// 该页面显示的控件
	
	/* 变量 */
	int16 idx;			// 控件索引
	uint16 widget_num;	// 控件数量
	uint16 screen_width;	// 屏幕像素宽度
	uint16 screen_height;	// 屏幕像素高度
	uint32 sliding_window_x;	// 滑窗左上角X坐标
	uint32 sliding_window_y;	// 滑窗左上角Y坐标
	uint16 options_window_x;	// 选项窗左上角X坐标
	uint16 options_window_y;	// 选项窗左上角Y坐标
	
	/* 成员函数 */
	void (*page_sliding_window)(struct DOG_MENU_PAGE* this);	// 滑窗
	void (*page_service)(void);			// 服务
}DOG_MENU_PAGE;

// 滑窗
void page_sliding_window(struct DOG_MENU_PAGE* this);
// 服务
void page_service(void);	
// 构造函数
void menu_page(struct DOG_MENU_PAGE* this, struct DOG_MENU_WIDGET* menu_page_widget_bind, void (*page_service)(void), uint16 widget_num, ...);
// 析构函数
void _menu_page(struct DOG_MENU_PAGE* this);

#endif