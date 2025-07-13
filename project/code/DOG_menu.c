#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_menu.h"

static SCREEN_STRING screen_string;
static SCREEN_INT screen_int;
static SCREEN_UINT screen_uint;
static SCREEN_FLOAT screen_float;
static SCREEN_IMAGE screen_image;
static SCREEN_CLEAR screen_clear;
static SCREEN_DRAW_LINE screen_draw_line;
static SCREEN_DRAW_POINT screen_draw_point;

// 数据增加
void data_add(struct DOG_MENU_WIDGET* this, uint8 idx, double step){
	switch(this -> data_kind){
		case INT8:  { if(this->data_int8[idx] < 128-(int8)step)this->data_int8[idx]+=(int8)step; break; }
		case UINT8: { if(this->data_uint8[idx] < 256-(uint8)step)this->data_uint8[idx]+=(uint8)step; break; }
		case INT16: { if(this->data_int16[idx] < 32768-(int16)step)this->data_int16[idx]+=(int16)step; break; }
		case UINT16:{ if(this->data_uint16[idx] < 65536-(uint16)step)this->data_uint16[idx]+=(uint16)step; break; }
		case INT32: { if(this->data_int32[idx] < 2147483648-(int32)step)this->data_int32[idx]+=(int32)step; break; }
		case UINT32:{ if(this->data_uint32[idx] < 4294967296-(uint32)step)this->data_uint32[idx]+=(uint32)step; break; }
		case FLOAT: { if(this->data_float[idx] < 3.4e38f-(float)step)this->data_float[idx]+=(float)step; break; }
		case DOUBLE:{ if(this->data_double[idx] < 1.7976931348623157e308-step)this->data_double[idx]+=step; break; }
	}
}

// 数据减少
void data_reduce(struct DOG_MENU_WIDGET* this, uint8 idx, double step){
	switch(this -> data_kind){
		case INT8:  { if(this->data_int8[idx] > -129+(int8)step)this->data_int8[idx]-=(int8)step; break; }
		case UINT8: { if(this->data_uint8[idx] > -1+(uint8)step)this->data_uint8[idx]-=(uint8)step; break; }
		case INT16: { if(this->data_int16[idx] > -32769+(int16)step)this->data_int16[idx]-=(int16)step; break; }
		case UINT16:{ if(this->data_uint16[idx] > -1+(uint16)step)this->data_uint16[idx]-=(uint16)step; break; }
		case INT32: { if(this->data_int32[idx] > -2147483649+(int32)step)this->data_int32[idx]-=(int32)step; break; }
		case UINT32:{ if(this->data_uint32[idx] > -1+(uint32)step)this->data_uint32[idx]-=(uint32)step; break; }
		case FLOAT: { if(this->data_float[idx] > -3.4e38f+(float)step)this->data_float[idx]-=(float)step; break; }
		case DOUBLE:{ if(this->data_double[idx] > -1.7976931348623157e308+step)this->data_double[idx]-=step; break; }
	}
}

// 数据绑定
void data_bind(struct DOG_MENU_WIDGET* this, _bool_ change_enable_flag, _data_kind_ data_kind, ...){
	va_list args;
    va_start(args, 1);
	
	switch(this -> data_kind){
		case INT8:  { this ->data_int8 = va_arg(args, int8*); break; }
		case UINT8: { this ->data_uint8 = va_arg(args, uint8*); break; }
		case INT16: { this ->data_int16 = va_arg(args, int16*); break; }
		case UINT16:{ this ->data_uint16 = va_arg(args, uint16*); break; }
		case INT32: { this ->data_int32 = va_arg(args, int32*); break; }
		case UINT32:{ this ->data_uint32 = va_arg(args, uint32*); break; }
		case FLOAT: { this ->data_float = va_arg(args, float*); break; }
		case DOUBLE:{ this ->data_double = va_arg(args, double*); break; }
	}
	this -> change_enable_flag = change_enable_flag;
	
	va_end(args);
}

// 页面绑定
void page_bind(struct DOG_MENU_WIDGET* this, _bool_ title_enable_flag, void (*MENU_PAGE)(void)){
	this -> title_enable_flag = title_enable_flag;
	this -> MENU_PAGE = MENU_PAGE;
}

// 构造函数	
void widget(struct DOG_MENU_WIDGET* this, char* name, uint32 x, uint32 y){	
	/* 成员变量 */
	this -> name = name;
	this -> x = x;
	this -> y = y;
	
	/* 成员函数 */
	this -> data_add = data_add;
	this -> data_reduce = data_reduce;
	this -> data_bind = data_bind;
	this -> page_bind = page_bind;
}	

// 析构函数	
void _widget(struct DOG_MENU_WIDGET* this){	
	/* 成员变量 */
	this -> name = "NULL";
	this -> x = 0;
	this -> y = 0;
}	

// 滑窗
void page_sliding_window(struct DOG_MENU_PAGE* this){
	// 显示控件
	for(uint16 i = 0;i < this->widget_num;i++){
		if(this ->menu_widgets[i]->x >= this->sliding_window_x && this ->menu_widgets[i]->x <= this->sliding_window_x+this->screen_width-FONT_WIDTH && this ->menu_widgets[i]->y >= this->sliding_window_y && this ->menu_widgets[i]->y <= this->sliding_window_y+this->screen_height-FONT_HEIGHT){
			screen_string(this ->menu_widgets[i]->x, this ->menu_widgets[i]->y, this ->menu_widgets[i]->name);	
		}
	}
	// 获取按键状态并刷新屏幕
	if(key_get_state(UP) == KEY_SHORT_PRESS){			// 上键短按上移
		screen_clear();
		// 索引减少
		this -> idx--;
	}
	else if(key_get_state(DOWN) == KEY_SHORT_PRESS){	// 下键短按下移
		screen_clear();
		// 索引增加
		this -> idx++;
		key_clear_all_state();
	}
	// 显示控件选项
	for(uint16 i = this -> idx;i < this->widget_num;i++){
		
	}
	if(this -> menu_widgets[this -> idx] -> change_enable_flag != True){
		if(key_get_state(UP) == KEY_SHORT_PRESS)
			this -> idx--;
		if(key_get_state(DOWN) == KEY_SHORT_PRESS)
			this -> idx++;
	}
	
	// 控件索引范围限制
	if(this -> idx < 0)
		this -> idx = this -> widget_num-1;
	if(this -> idx >= this -> widget_num)
		this -> idx = 0;
	// 清除按键状态
	key_clear_all_state();
}	

// 构造函数
void menu_page(struct DOG_MENU_PAGE* this, struct DOG_MENU_WIDGET* menu_page_widget_bind, void (*page_service)(void), uint16 widget_num, ...){
	va_list args;
    va_start(args, (int)widget_num);

	DOG_MENU_WIDGET* menu_widget[widget_num];
	
	// 屏幕选择
	switch(SCREEN_KIND)
	{
		case 0:{ 
			screen_string = &(tft180_show_string); 
			screen_int = &(tft180_show_int); 
			screen_float = &(tft180_show_float); 
			screen_clear = &(tft180_clear); 
			screen_image = &(tft180_show_gray_image); 
			screen_uint = &(tft180_show_uint); 
			screen_draw_line = &(tft180_draw_line); 
			screen_draw_point = &(tft180_draw_point); 
			// 设置屏幕像素尺寸
			this -> screen_width = 128;
			this -> screen_height = 164;
			break; 
		}
		case 1:{ 
			screen_string = &(ips200_show_string); 
			screen_int = &(ips200_show_int); 
			screen_float = &(ips200_show_float); 
			screen_clear = &(ips200_clear); 
			screen_image = &(ips200_show_gray_image); 
			screen_uint = &(ips200_show_uint); 
			screen_draw_line = &(ips200_draw_line); 
			screen_draw_point = &(ips200_draw_point); 
			// 设置屏幕像素尺寸
			this -> screen_width = 240;
			this -> screen_height = 320;
			break; 
		}
	}
	
	// 获取所有控件
	for(uint16 i = 0;i < widget_num;i++){
		menu_widget[i] = va_arg(args, DOG_MENU_WIDGET*);
	}
	// 按照控件Y从小到大排序，保证控件在屏幕中是从上至下的
	for (uint16 i = 0; i < widget_num-1; i++) {
        for (uint16 j = 0; j < widget_num-i-1; j++) {
            if (menu_widget[j]->y > menu_widget[j+1]->y) {
                // 交换元素
                DOG_MENU_WIDGET* menu_widget_temp = menu_widget[j];
                menu_widget[j] = menu_widget[j+1];
                menu_widget[j+1] = menu_widget_temp;
            }
        }
    }
	// 存储至类中
	if(widget_num <= MAX_PAGE_WIDGET_NUM){
		for(uint16 i = 0;i < widget_num;i++){
			this->menu_widgets[i] = menu_widget[i];
		}
	}
	else{
		for(uint16 i = 0;i < MAX_PAGE_WIDGET_NUM;i++){
			this->menu_widgets[i] = menu_widget[i];
		}
	}
	
	/* 成员变量 */
	this -> idx = 0;
	this -> widget_num = widget_num;		
	this -> menu_page_widget_bind = menu_page_widget_bind;
	this -> sliding_window_x = 0;
	this -> sliding_window_y = 0;
	
	/* 成员函数 */
	this -> page_service = page_service;	// 绑定页面服务函数
	this -> page_sliding_window = page_sliding_window;
	
	va_end(args);
}

// 析构函数
void _menu_page(struct DOG_MENU_PAGE* this){
	/* 成员变量 */
	this -> idx = 0;
	this -> widget_num = 0;		
	this -> sliding_window_x = 0;
	this -> sliding_window_y = 0;
}