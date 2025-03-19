/*
该文件用于图像处理

API：
二值化
绘制路径线
*/

#include "common.h"

uint8 image_OTSU[MT9V03X_H][MT9V03X_W] = {0};
uint8 image_dilate[MT9V03X_H][MT9V03X_W] = {0};
uint8 image_erode[MT9V03X_H][MT9V03X_W] = {0};
uint8 *PerImg_ip[MT9V03X_H][MT9V03X_W];

// 逆透视矩阵
double change_un_Mat[3][3] ={{-0.338889,0.548677,-33.082011},
							{-0.000000,0.042800,-11.005118},
							{-0.000000,0.006666,-0.713912}};

// 结构元素（3x3矩阵）
static int kernel[3][3] = {
    {255, 255, 255},
    {255, 255, 255},
    {255, 255, 255}
};

/* 二值化 */
void threshold(uint8 input[MT9V03X_H][MT9V03X_W])
{
	int32 img_pixel_value_avg = 0;
	int32 sampling_num = 0;
	int16 x,y;
	for(x = 0;x < MT9V03X_W;)
	{
		for(y = 0;y < MT9V03X_H;)
		{
			img_pixel_value_avg += input[y][x];
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
			if(input[y][x] >= img_pixel_value_avg)
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

/* 逆透视初始化 */
void unpivot_init(void) 
{
    static uint8_t BlackColor = 0;
    for (int i = 0; i < MT9V03X_W ;i++) 
    {
        for (int j = 0; j < MT9V03X_H ;j++) 
        {
            int local_x = (int) ((change_un_Mat[0][0] * i
                    + change_un_Mat[0][1] * j + change_un_Mat[0][2])
                    / (change_un_Mat[2][0] * i + change_un_Mat[2][1] * j
                            + change_un_Mat[2][2]));
            int local_y = (int) ((change_un_Mat[1][0] * i
                    + change_un_Mat[1][1] * j + change_un_Mat[1][2])
                    / (change_un_Mat[2][0] * i + change_un_Mat[2][1] * j
                            + change_un_Mat[2][2]));
            if (local_x>= 0&& local_y >= 0 && local_y < MT9V03X_H && local_x < MT9V03X_W)
                PerImg_ip[j][i] = &PER_IMG[local_y][local_x];
            else 
                PerImg_ip[j][i] = &BlackColor;          //&PER_IMG[0][0];
        }
    }
}

/* 图形学膨胀 */
void dilate(uint8 input[MT9V03X_H][MT9V03X_W]) 
{
    int i, j, m, n;
    int max_val = 0;

    for (i = 1; i < MT9V03X_H - 1; i++) 
	{
        for (j = 1; j < MT9V03X_W - 1; j++) 
		{
            max_val = 0;
            // 遍历结构元素
            for (m = -1; m <= 1; m++) 
			{
                for (n = -1; n <= 1; n++) 
				{
                    if (kernel[m + 1][n + 1] == 255 && input[i + m][j + n] == 255) 
					{
                        max_val = 255;
                        break;
                    }
                }
                if (max_val == 255) break;
            }
            image_dilate[i][j] = max_val;
        }
    }
}

/* 腐蚀操作函数 */
void erode(uint8 input[MT9V03X_H][MT9V03X_W]) 
{
    int i, j, m, n;
    int min_val;

    // 遍历图像的每个像素（忽略边界）
    for (i = 1; i < MT9V03X_H - 1; i++)
	{
        for (j = 1; j < MT9V03X_W - 1; j++) 
		{
            min_val = 1; // 初始化最小值
            // 遍历结构元素
            for (m = -1; m <= 1; m++) 
			{
                for (n = -1; n <= 1; n++) 
				{
                    // 如果结构元素为1且图像中对应像素为0，则设置min_val为0
                    if (kernel[m + 1][n + 1] == 255 && input[i + m][j + n] == 0) 
					{
                        min_val = 0;
                        break;
                    }
                }
                if (min_val == 0) break; // 如果已经找到0，提前退出
            }
            image_erode[i][j] = min_val; // 设置输出图像的像素值
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


