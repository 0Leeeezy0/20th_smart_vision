#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_solve.h"
#include "math.h"

// 欧拉角解算
void euler_angle(struct DOG_SOLVE* this, struct DOG_IMU* imu_data){
	if((imu_data -> gyro_calibration_flag || imu_data -> acc_calibration_flag) && this -> solve_flag)
	{
		this -> roll += imu_data -> gyro_x*this -> solve_IT_time/1000;
		this -> pitch += imu_data -> gyro_y*this -> solve_IT_time/1000;
		this -> yaw += imu_data -> gyro_z*this -> solve_IT_time/1000;
		
		this -> roll =  fmod(this -> roll, 360);
		this -> pitch = fmod(this -> pitch, 360);
		this -> yaw = fmod(this -> yaw, 360);
	}
	else
	{
		this -> roll = 0;
		this -> pitch = 0;
		this -> yaw = 0;
	}
}

// 构造函数
void solve(struct DOG_SOLVE* this, uint16 solve_IT_time){
	/* 成员变量 */
	this -> roll = 0;
	this -> pitch = 0;
	this -> yaw = 0;	this -> solve_IT_time = solve_IT_time;
	this -> solve_flag = False;
	
	/* 成员函数 */
	this -> euler_angle = euler_angle;
	
	return;
}

// 析构函数
void _solve(struct DOG_SOLVE* this){
	this -> roll = 0;
	this -> pitch = 0;
	this -> yaw = 0;
	this -> solve_flag = False;
}