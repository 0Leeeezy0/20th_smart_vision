/*
该文件用于车模赛道循迹控制

API：
****用户****
赛道循迹控制初始化
循迹控制
循迹PID参数结构体初始化
************

****底层****
路径线扫描
循迹PID
************
*/

#ifndef _DOG_PATH_H_
#define _DOG_PATH_H_

#include "common.h"

/* 最长白列 */
void longest_white_col(void);

/* 赛道循迹控制初始化 */
void path_control_init(void);

/* 路径线提取 */
void path_extract(void);

/* 边线提取 */
void side_extract(void);

/* 循迹控制 */
void path_control(float path_control_speed);

/* 边线点类型判断 */
void side_point_kind_judge(void);

/* 赛道归一化曲率计算 */
void path_curvature_normalization_judge(void);

/* 圆环判断 */
void circle_path_element_judge(void);

/* 斑马线元素判断 */
void zebra_crossing_path_element_judge(void);

/* 循迹PID参数结构体初始化 */
_PATH_PID_ path_control_pid_init(void);

/* 循迹PID */
float path_control_pid(float (*FUNC_PATH)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),_PATH_PID_ path_pid,int16 path_err);

#endif