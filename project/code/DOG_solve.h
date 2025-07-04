#ifndef _DOG_SOLVE_H_
#define _DOG_SOLVE_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"
#include "DOG_sensor.h"

/* 解算 */
struct DOG_SOLVE{
	/* 变量 */
	float diff_world_x_displacement;	// 世界X位移微分
	float diff_world_y_displacement;	// 世界Y位移微分
	float diff_x_displacement;			// 车身X位移微分
	float diff_y_displacement;			// 车身Y位移微分
	float diff_displacement;			// 车身位移微分
	float diff_yaw;						// 车身航向角微分
	float diff_wheel_1_displacement;	// 车身轮子1位移
	float diff_wheel_2_displacement; 	// 车身轮子2位移
	float diff_wheel_3_displacement; 	// 车身轮子3位移
	float diff_displacement_yaw;		// 车身位移航向角微分
	/* 解算值 */
	// 欧拉角解算结果
	float roll;	
	float pitch;
	float yaw;
	// 运动学逆解算结果
	float wheel_1_speed;	
	float wheel_2_speed;
	float wheel_3_speed;
	// 运动学解算结果
	float wheel_1_displacement;	// 轮子位移
	float wheel_2_displacement;	
	float wheel_3_displacement;	
	float world_x_displacement;	// 世界坐标
	float world_y_displacement;	
	float distance;		// 路程
	float displacement;	// 位移
	float displacement_yaw;	// 位移航向角
	/* 底盘参数 */
	float radius;	// 底盘中心到车轮半径
	/* 解算中断时间 */
	uint16 solve_IT_time;
	/* 解算标志位 */
	_bool_ solve_flag;
	
	/* 成员函数 */
	void (*euler_angle)(struct DOG_SOLVE* this, struct DOG_IMU imu_data);	// 欧拉角解算
	void (*move_inv_solve)(struct DOG_SOLVE* this, _move_solve_kind_ kind, float data_1, float data_2, float angular_speed);	// 运动学逆解算
	void (*move_solve)(struct DOG_SOLVE* this, float wheel_1_speed_real, float wheel_2_speed_real, float wheel_3_speed_real, float yaw);		// 运动学解算
};

// 欧拉角解算
void euler_angle(struct DOG_SOLVE* this, struct DOG_IMU imu_data);
/*
	运动逆解算
	参数说明
	kind 运动解算类型
	data_1 线速度/X速度
	data_2 航向角/Y速度
	angular_speed 旋转速度
*/ 
void move_inv_solve(struct DOG_SOLVE* this, _move_solve_kind_ kind, float data_1, float data_2, float angular_speed);		
/*
	运动解算
	参数说明
	wheel_1_speed_real 轮子1 实际轮速
	wheel_2_speed_real 轮子2 实际轮速
	wheel_3_speed_real 轮子2 实际轮速
	yaw 实际航向角
*/ 
void move_solve(struct DOG_SOLVE* this, float wheel_1_speed_real, float wheel_2_speed_real, float wheel_3_speed_real, float yaw);		

// 构造函数
void solve(struct DOG_SOLVE* this, float radius, uint16 solve_IT_time);
// 析构函数
void _solve(struct DOG_SOLVE* this);


#endif