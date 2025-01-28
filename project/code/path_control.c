/*
该文件用于车模赛道循迹控制

API：
*/

#include "common.h"

int16 path[PATH_END-PATH_START][2] = {0};	// 路径线x、y坐标

/* 赛道循迹控制初始化 */
void path_control_init(void)
{
	mt9v03x_init();
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
		path[0][0] = path[PREDICTION_POINT][0];
	}
	path[0][1] = MT9V03X_H-1-PATH_START;
	for(y = MT9V03X_H-1-PATH_START-1;y >= MT9V03X_H-1-PATH_END;y--)
	{
		for(x = path[MT9V03X_H-1-PATH_START-y-1][0];x < MT9V03X_W;x++)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[MT9V03X_H-1-PATH_START-y][0] = x;
				break;
			}
			if(x == MT9V03X_W-1)
			{
				path[MT9V03X_H-1-PATH_START-y][0] = x;
			}
		}
		for(x = path[MT9V03X_H-1-PATH_START-y-1][0];x >= 0;x--)
		{
			if(image_OTSU[y][x] == 0)
			{
				path[MT9V03X_H-1-PATH_START-y][0] += x;
				break;
			}
			if(x == 0)
			{
				path[MT9V03X_H-1-PATH_START-y][0] += x;
			}
		}
		path[MT9V03X_H-1-PATH_START-y][0] = path[MT9V03X_H-1-PATH_START-y][0]/2;
		path[MT9V03X_H-1-PATH_START-y][1] = y;
	}
}

/* 循迹控制 */
void path_control(float path_control_speed)
{
	int16 path_err;
	_PID_ path_pid = path_control_pid_init();
	path_err = path[CONTROL_POINT-PATH_START][0] - MT9V03X_W/2;
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
	path_pid.output_limit = PATH_PID[3];
	path_pid.i_limit = PATH_PID[4];
	path_pid.now_err =  0;
	path_pid.last_err =  0;
	path_pid.last_last_err =  0;
	
	return path_pid;
}

/* 循迹PID */
float path_control_pid(float (*p)(_PID_* pid,float target,float feedback),_PID_ path_pid,int16 path_err)
{
	return p(&path_pid,0,-path_err);
}	

