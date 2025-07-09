#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_cv.h"

// 结构元素（3x3矩阵）
static uint8 kernel[3][3] = {
    {255, 255, 255},
    {255, 255, 255},
    {255, 255, 255}
};

// 二值化
uint8 threshold(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]){
	int histogram[256] = {0}; // 灰度直方图
    int total_pixels = MT9V03X_W * MT9V03X_H;
    float sum = 0, sumB = 0;
    float wB = 0, wF = 0, max_var = 0;
    int threshold = 0;

    // 统计灰度直方图
	for(int x = 0;x < MT9V03X_W;x++)
	{
		for(int y = 0;y < MT9V03X_H;y++)
		{
			histogram[input[y][x]]++;
		}
	}

    // 计算总平均灰度
    for (int i = 0; i < 256; i++) {
        sum += i*histogram[i];
    }

    // 3. 遍历所有可能的阈值T
    for (int T = 0; T < 256; T++) {
        wB += histogram[T];       // 背景像素数累加
        if (wB == 0) continue;

        wF = total_pixels - wB;   // 前景像素数
        if (wF == 0) break;

        sumB += T * histogram[T]; // 背景灰度总和

        float mB = sumB / wB;            // 背景平均灰度
        float mF = (sum - sumB) / wF;    // 前景平均灰度
        float var = wB * wF * (mB - mF) * (mB - mF); // 类间方差

        // 更新最大方差和阈值
        if (var > max_var) {
            max_var = var;
            threshold = T;
        }
    }
		
	for(int x = 0;x < MT9V03X_W;x++)
	{
		for(int y = 0;y < MT9V03X_H;y++)
		{
			if(input[y][x] >= threshold)
			{
				this -> image_OTSU[y][x] = 255;
			}
			else
			{
				this -> image_OTSU[y][x] = 0;
			}
		}
	}
}

// 图形学膨胀
void dilate(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]){
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
            this -> image_dilate[i][j] = max_val;
        }
    }
}

// 图形学腐蚀
void erode(struct DOG_CV* this, uint8 input[MT9V03X_H][MT9V03X_W]){
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
            this -> image_erode[i][j] = min_val; // 设置输出图像的像素值
        }
    }
}

// 构造函数
void cv(struct DOG_CV* this){
	memset(this -> image_OTSU, 0., sizeof(this -> image_OTSU));
	memset(this -> image_dilate, 0., sizeof(this -> image_dilate));
	memset(this -> image_erode, 0., sizeof(this -> image_erode));
	
	/* 成员函数 */
	this -> threshold = threshold;
	this -> dilate = dilate;
	this -> erode = erode;
	
	/* 初始化 */
	mt9v03x_init();
}

// 析构函数
void _cv(struct DOG_CV* this){
	memset(this -> image_OTSU, 0., sizeof(this -> image_OTSU));
	memset(this -> image_dilate, 0., sizeof(this -> image_dilate));
	memset(this -> image_erode, 0., sizeof(this -> image_erode));
}