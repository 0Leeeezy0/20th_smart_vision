/*
该文件用于图像处理

API：
*/

#include "common.h"

uint8 image_OTSU[MT9V03X_H][MT9V03X_W];

/* 二值化 */
void threshold(void)
{
	int img_pixel_value_avg = 0;
	int16 sampling_num = 0;
	int16 x,y;
	for(x = 0;x < MT9V03X_W;)
	{
		for(y = 0;y < MT9V03X_H;)
		{
			img_pixel_value_avg += mt9v03x_image[y][x];
			sampling_num++;
			y+=THRESHOLD_SAMPLING_DISTANCE;
		}
		x+=THRESHOLD_SAMPLING_DISTANCE;
	}
		
	img_pixel_value_avg = img_pixel_value_avg/sampling_num;
		
	for(x = 0;x < MT9V03X_W;x++)
	{
		for(y = 0;y < MT9V03X_H;y++)
		{
			if(mt9v03x_image[y][x] >= img_pixel_value_avg)
			{
				image_OTSU[y][x] = 255;
			}
			else
			{
				image_OTSU[y][x] = 0;
			}
		}
	}
}

/* 绘制路径线 */
void path_draw(void)
{
	int num = 0;
	for(num = 0;num < PATH_END-PATH_START;num++)
	{
		image_OTSU[path[num][1]][path[num][0]] = 0;
	}
}


