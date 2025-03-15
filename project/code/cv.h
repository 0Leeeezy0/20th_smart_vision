/*
该文件用于图像处理

API：
二值化
绘制路径线
*/

#ifndef _CV_H_
#define _CV_H_

#include "common.h"

/* 二值化 */
void threshold(uint8 input[MT9V03X_H][MT9V03X_W]);

/* 图形学膨胀 */
void dilate(uint8 input[MT9V03X_H][MT9V03X_W]) ;

//* 腐蚀操作函数 */
void erode(uint8 input[MT9V03X_H][MT9V03X_W]);

/* 绘制路径线 */
void path_draw(void);

/* 绘制直线 */
void line_draw(uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end);

#endif