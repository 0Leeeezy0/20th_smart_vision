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
	chassis_motion_flag = CHASSIS_MOVE;
	path_err = path[control_point-path_start][0] - MT9V03X_W/2;
	if(abs(path_err) > 15)
	{
		chassis_yaw = 0;
		chassis_angular_speed = path_control_pid(PATH_PID_KIND,path_pid,path_err);
	}
	else
	{
		chassis_yaw = 1.2*path_err;
		chassis_angular_speed = 0;
	}
	chassis_linear_speed = path_control_speed;
}

/* 循迹PID参数结构体初始化 */
_PATH_PID_ path_control_pid_init(void)
{
	static _PATH_PID_ path_pid;

	// 循迹 PID
	for(uint8 i = 0;i < 3; i++)
	{
		path_pid.path_pid_parameters[i].p = PATH_PID[i][0];
		path_pid.path_pid_parameters[i].i = PATH_PID[i][1];
		path_pid.path_pid_parameters[i].d = PATH_PID[i][2];
		path_pid.path_pid_parameters[i].output_limit = path_err_limit;
		path_pid.path_pid_parameters[i].i_limit = path_pid_i_limit;
	}
	path_pid.path_pid_variable.now_err =  0;
	path_pid.path_pid_variable.last_err =  0;
	path_pid.path_pid_variable.last_last_err =  0;
	
	return path_pid;
}

/* 循迹PID */
float path_control_pid(float (*FUNC_PATH)(_PID_PARAMETERS_*,_PID_VARIABLE_*,float,float),_PATH_PID_ path_pid,int16 path_err)
{
	float gyro_now_err,value;
	static float gyro_last_err = 0;
	gyro_now_err = GYRO_Z_FORWARD*gyro_z;
	if(abs(path_err) > 15 && abs(path_err) < 25)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[0]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[0][3]*(gyro_now_err-gyro_last_err);
	}
	else if(abs(path_err) >= 25 && abs(path_err) < 40)
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[1]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[1][3]*(gyro_now_err-gyro_last_err);
	}
	else
	{
		value = FUNC_PATH(&(path_pid.path_pid_parameters[2]),&(path_pid.path_pid_variable),0,-path_err)-PATH_PID[2][3]*(gyro_now_err-gyro_last_err);
	}
	gyro_last_err = gyro_now_err;
	
	return value;
}	

