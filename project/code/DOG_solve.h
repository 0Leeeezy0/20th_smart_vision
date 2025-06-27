#ifndef _DOG_SOLVE_H_
#define _DOG_SOLVE_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"
#include "DOG_sensor.h"

/* 解算 */
struct DOG_SOLVE{
	/* 解算值 */
	float roll;
	float pitch;
	float yaw;
	/* 解算中断时间 */
	uint16 solve_IT_time;
	/* 解算标志位 */
	_bool_ solve_flag;
	
	/* 成员函数 */
	void (*euler_angle)(struct DOG_SOLVE* this, struct DOG_IMU* imu_data);	// 欧拉角解算
};

// 欧拉角解算
void euler_angle(struct DOG_SOLVE* this, struct DOG_IMU* imu_data);

// 构造函数
void solve(struct DOG_SOLVE* this, uint16 solve_IT_time);
// 析构函数
void _solve(struct DOG_SOLVE* this);

#endif