#ifndef _DOG_DATA_H_
#define _DOG_DATA_H_

#include "stdio.h"

#define CHECK(x) 		((x)==1?1:((x)==0?-1:0))	// 1->1;0->-1
#define DEG2RAD(x) 		(double)(PI*(x)/180.0)	// 角度->弧度
#define RAD2DEG(x) 		(double)(180.0*(x)/PI)	// 弧度->角度
#define ROUND(x,y) 		((x-(x%y))/y)		// 整除

#define SQRT_3			(double)(1.7320508075688772935274463415059)
#define SQRT_2			(double)(1.4142135623730950488016887242097)
#define SIN_30 			(double)(0.5)
#define SIN_45 			(double)(0.70710678118654752440084436210485)
#define SIN_60 			(double)(0.86602540378443864676372317075294)
#define COS_30 			(double)(0.86602540378443864676372317075294)
#define COS_45 			(double)(0.70710678118654752440084436210485)
#define COS_60 			(double)(0.5)

/* 定义 bool 类型 */
typedef enum _bool_{
	False = 0,
	True = 1,
	Float = 2
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

/* 数据类型 */
typedef enum _data_kind_{
	INT8 = 0,
	UINT8 = 1,
	INT16 = 2,
	UINT16 = 3,
	INT32 = 4,
	UINT32 = 5,
	FLOAT = 6,
	DOUBLE = 7
}_data_kind_;

/* 运动解算类型 */
typedef enum _move_solve_kind_{
	SPEED_YAW_SOLVE = 0,
	XY_SPEED_SOLVE = 1
}_move_solve_kind_;

#endif