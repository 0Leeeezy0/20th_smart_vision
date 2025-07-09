#ifndef _DOG_PATH_H_
#define _DOG_PATH_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"
#include "DOG_cv.h"

struct DOG_PATH;

typedef struct DOG_PATH{
	/* 成员变量 */
	uint16 mid_x;						// 动态中线
	uint16 path_start_y;				// 路径线提取开始高度
	uint16 path_end_y;					// 路径线提取结束高度
	uint16 side_extract_start_y;		// 边线开始提取高度
	uint16 side_extract_end_y;			// 边线结束提取高度
	uint16 path[MT9V03X_H][2];			// 路径线x、y坐标
	uint16 prediction_point;			// 预测点高度：其横坐标将作为下一帧的搜线起点
	uint16 longest_white_col_x;			// 最长白列X坐标
	uint16 L_side[MT9V03X_H*3][2];		// 左边线坐标
	uint16 R_side[MT9V03X_H*3][2];		// 右边线坐标
	uint16 L_side_point_num;			// 左边线点数量
	uint16 R_side_point_num;			// 右边线点数量
	uint16 L_frame_point_num;			// 左边框点数量
	uint16 R_frame_point_num;			// 右边框点数量
	uint16 L_bend_point[MT9V03X_H*2][2];// 左边线弯点坐标
	uint16 R_bend_point[MT9V03X_H*2][2];// 右边线弯点坐标
	uint16 L_bend_point_num;			// 左边线弯点数量
	uint16 R_bend_point_num;			// 右边线弯点数量
	int16 path_width[MT9V03X_H];		// 赛道宽度
	uint16 point_distance;				// 拐点/弯点距离
	double bend_point_angle_min;		// 弯点最小角度阈值
	double bend_point_angle_max;		// 弯点最大角度阈值
	
	/* 成员函数 */
	void (*longest_white_col)(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W], uint16 control_point);	// 最长白列
	void (*path_extract)(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W]);			// 路径线提取
	void (*side_extract)(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W]);			// 边线提取
	void (*side_point_kind_judge)(struct DOG_PATH* this);				// 边线点类型判断
}DOG_PATH;

// 最长白列
void longest_white_col(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W], uint16 control_point);	
// 路径线提取
void path_extract(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W]);	
// 边线提取
void side_extract(struct DOG_PATH* this, uint8 input[MT9V03X_H][MT9V03X_W]);		
// 边线点类型判断
void side_point_kind_judge(struct DOG_PATH* this);				

// 构造函数
void path(struct DOG_PATH* this, uint16 path_start, uint16 path_end, uint16 side_extract_start_y, uint16 side_extract_end_y, uint16 prediction_point);
// 析构函数
void _path(struct DOG_PATH* this);

#endif