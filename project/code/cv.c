/*
该文件用于图像处理

API：
*/

#include "common.h"

uint8 image[MT9V03X_W][MT9V03X_H] = {0};

/* 二值化 */
void threshold(void)
{
	int16 img_pixel_value_avg;
	int16 sampling_num;
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
//	img_pixel_value_avg = img_pixel_value_avg/sampling_num;
	img_pixel_value_avg = 150;
	
	
	for(x = 0;x < MT9V03X_W;x++)
	{
		for(y = 0;y < MT9V03X_H;y++)
		{
			if(mt9v03x_image[y][x] >= img_pixel_value_avg)
			{
				image[x][y] = 255;
			}
			else
			{
				image[x][y] = 0;
			}
		}
	}
}