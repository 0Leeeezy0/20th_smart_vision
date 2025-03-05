/*
该文件用于图像处理

API：
二值化
绘制路径线
*/

#include "common.h"

uint8 image_OTSU[MT9V03X_H][MT9V03X_W];

/* 二值化 */
void threshold(void)
{
	int32 img_pixel_value_avg = 0;
	int32 sampling_num = 0;
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

/* 水漫算法 */

/* 绘制路径线 */
void path_draw(void)
{
	int num = 0;
	for(num = 0;num < path_end-path_start;num++)
	{
		image_OTSU[path[num][1]][path[num][0]] = 0;
	}
}

/* 绘制直线 */
void line_draw(uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end)
{
	int16 x_dir = (x_start < x_end ? 1 : -1);
    int16 y_dir = (y_start < y_end ? 1 : -1);
    float temp_rate = 0;
    float temp_b = 0;

    do
    {
        if(x_start != x_end)
        {
            temp_rate = (float)(y_start - y_end) / (float)(x_start - x_end);
            temp_b = (float)y_start - (float)x_start * temp_rate;
        }
        else
        {
            while(y_start != y_end)
            {
                image_OTSU[y_start][x_start] = 0;
                y_start += y_dir;
            }
			image_OTSU[y_start][x_start] = 0;
            break;
        }
        if(func_abs(y_start - y_end) > func_abs(x_start - x_end))
        {
            while(y_start != y_end)
            {
                image_OTSU[y_start][x_start] = 0;
                y_start += y_dir;
                x_start = (int16)(((float)y_start - temp_b) / temp_rate);
            }
			image_OTSU[y_start][x_start] = 0;
        }
        else
        {
            while(x_start != x_end)
            {
                image_OTSU[y_start][x_start] = 0;
                x_start += x_dir;
                y_start = (int16)((float)x_start * temp_rate + temp_b);
            }
			image_OTSU[y_start][x_start] = 0;
        }
    }while(0);
}


