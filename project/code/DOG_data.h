#ifndef _DOG_DATA_H_
#define _DOG_DATA_H_

#include "stdio.h"

#define CHECK(x) ((x)==1?1:((x)==0?-1:0))

/* 定义 bool 类型 */
typedef enum _bool_{
	False = 0,
	True = 1,
}_bool_;

/* 定义 旋转方向 类型 */
typedef enum _rotate_dir_{
	positive = 1,
	negative = 0,
}_rotate_dir_;

/* 模糊 PID 子集 */
typedef enum _fuzzy_subset_{
	NB = 0,			// 负大
	NM = 1,			// 负中
	NS = 2,			// 负小
	ZERO = 3,		// 零
	PS = 4,			// 正小
	PM = 5,			// 正中
	PB = 6,			// 正大
	PID_NONE = 7	// 默认
}_fuzzy_subset_;

/* 赛道状态 */
typedef enum _path_state_{
	common_path = 0,	// 普通赛道
	L_circle_in = 1,	// 左圆环进环
	R_circle_in = 2,	// 右圆环进环
	L_circle_out = 3,	// 左圆环出环
	R_circle_out = 4,	// 右圆环出环
	zebra_path = 5,		// 斑马线赛道
}_path_state_;

#endif