#ifndef _DOG_CV_H_
#define _DOG_CV_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

struct DOG_CV;

typedef struct DOG_CV{
	/* 图像 */
	uint8 image_OTSU[MT9V03X_H][MT9V03X_W];			// 二值化图像
	uint8 image_dilate[MT9V03X_H][MT9V03X_W];		// 图形学膨胀图像
	uint8 image_erode[MT9V03X_H][MT9V03X_W];		// 图形学腐蚀图像
	
	/* 成员函数 */
	uint8 (*threshold)(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]);	// 二值化
	void (*dilate)(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]);	// 图形学膨胀
	void (*erode)(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]);	// 图形学腐蚀
}DOG_CV;

// 二值化
uint8 threshold(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]);
// 图形学膨胀
void dilate(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]);
// 图形学腐蚀
void erode(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]);

// 构造函数
void cv(struct DOG_CV* this);
// 析构函数
void _cv(struct DOG_CV* this);

#endif