#ifndef _DOG_DATA_H_
#define _DOG_DATA_H_


#include "stdio.h"

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

#endif