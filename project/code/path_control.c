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

#include "common.h"

int16 path[MT9V03X_H][2] = {0};	// 路径线x、y坐标
_PID_ path_pid;

/* 赛道循迹控制初始化 */
void path_control_init(void)
{
	mt9v03x_init();
	path_pid = path_control_pid_init();
}

/* 路径线扫描 */
void path_search(void)
{
	int16 x,y;
	static int16 num = 0;
	if(num < 10)
	{
		path[0][0] = MT9V03X_W/2;
		num++;
	}
	else
	{
		path[0][0] = path[prediction_point][0];
	}
	path[0][1] = MT9V03X_H-1-path_start;
	for(y = MT9V03X_H-1-path_start-1;y >= MT9V03X_H-1-path_end;y--)
	{
		for(x = path[MT9V03X_H-1-path_start-y-1][0];x < MT9V03X_W;x++)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[MT9V03X_H-1-path_start-y][0] = x;
				break;
			}
			if(x == MT9V03X_W-1)
			{
				path[MT9V03X_H-1-path_start-y][0] = x;
			}
		}
		for(x = path[MT9V03X_H-1-path_start-y-1][0];x >= 0;x--)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[MT9V03X_H-1-path_start-y][0] += x;
				break;
			}
			if(x == 0)
			{
				path[MT9V03X_H-1-path_start-y][0] += x;
			}
		}
		path[MT9V03X_H-1-path_start-y][0] = path[MT9V03X_H-1-path_start-y][0]/2;
		path[MT9V03X_H-1-path_start-y][1] = y;
	}
}

/* 循迹控制 */
void path_control(float path_control_speed)
{
	path_err = path[control_point-path_start][0] - MT9V03X_W/2;
	angular_speed = path_control_pid(PATH_PID_KIND,path_pid,path_err);
	linear_speed = path_control_speed;
}

/* 循迹PID参数结构体初始化 */
_PID_ path_control_pid_init(void)
{
	static _PID_ path_pid;

	// 循迹 PID
	path_pid.p = PATH_PID[0];
	path_pid.i = PATH_PID[1];
	path_pid.d = PATH_PID[2];
	path_pid.output_limit = path_err_limit;
	path_pid.i_limit = path_pid_i_limit;
	path_pid.now_err =  0;
	path_pid.last_err =  0;
	path_pid.last_last_err =  0;
	
	return path_pid;
}

/* 循迹PID */
float path_control_pid(float (*p)(_PID_* pid,float target,float feedback),_PID_ path_pid,int16 path_err)
{
	float gyro_now_err;
	static float gyro_last_err;
	gyro_now_err = gyro_z;
	float value = p(&path_pid,0,-path_err)-PATH_PID[3]*(gyro_now_err-gyro_last_err);
	gyro_last_err = gyro_now_err;
	
	return value;
}	

