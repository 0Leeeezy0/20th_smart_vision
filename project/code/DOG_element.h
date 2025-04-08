/*
该文件用于车模元素动作

API：
*/
#ifndef _ELEMENT_H_
#define _ELEMENT_H_

/* 对称法矫正初始化 */
void symmetry_rectificate_init(void);

/* 对称法矫正 */
void symmetry_rectificate(void);

/* 艹箱子 */
void fxxk_box(uint8 steps);

#endif