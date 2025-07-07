#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_solve.h"
#include "math.h"

// 欧拉角解算
void euler_angle(struct DOG_SOLVE* this, struct DOG_IMU imu_data){
	if((imu_data.gyro_calibration_flag == True || imu_data.acc_calibration_flag == True) && this -> solve_flag == True)
	{
		this -> roll += imu_data.gyro_x*this -> solve_IT_time/1000.;
		this -> pitch += imu_data.gyro_y*this -> solve_IT_time/1000.;
		this -> yaw += imu_data.gyro_z*this -> solve_IT_time/1000;
		
		this -> roll =  fmod(this -> roll, 360);
		this -> pitch = fmod(this -> pitch, 360);
		this -> yaw = fmod(this -> yaw, 360);
	}
	else if(this -> solve_flag == False)
	{
		this -> roll = 0;
		this -> pitch = 0;
		this -> yaw = 0;
	}
}

/*
	运动逆解算
	参数说明
	kind 运动解算类型
	data_1 线速度/X速度
	data_2 航向角/Y速度
	angular_speed 旋转速度
*/ 
void move_inv_solve(struct DOG_SOLVE* this, _move_solve_kind_ kind, float data_1, float data_2, float angular_speed){
	float x_speed = 0;
	float y_speed = 0;
	
	if(kind == SPEED_YAW_SOLVE){
		x_speed = data_1*sinf(DEG2RAD(data_2));
		y_speed = (float)data_1*cosf(DEG2RAD(data_2));
	}
	else{
		x_speed = data_1;
		y_speed = data_2;
	}
	this -> wheel_1_speed = -x_speed+angular_speed;
	this -> wheel_2_speed = x_speed*COS_60+y_speed*COS_30+angular_speed;
	this -> wheel_3_speed = x_speed*COS_60-y_speed*COS_30+angular_speed;
}

/*
	运动解算
	参数说明
	wheel_1_speed_real 轮子1 实际轮速
	wheel_2_speed_real 轮子2 实际轮速
	wheel_3_speed_real 轮子2 实际轮速
	yaw 实际航向角
	说明
	由于
*/ 
void move_solve(struct DOG_SOLVE* this, float wheel_1_speed_real, float wheel_2_speed_real, float wheel_3_speed_real, float yaw){
	if(this -> solve_flag == True)
	{
		// 三个轮子的位移微分
		this -> diff_wheel_1_displacement = wheel_1_speed_real*this -> solve_IT_time/1000.;
		this -> diff_wheel_2_displacement = wheel_2_speed_real*this -> solve_IT_time/1000.;
		this -> diff_wheel_3_displacement = wheel_3_speed_real*this -> solve_IT_time/1000.;
		
		// 分解到车身X、Y方向上的位移微分
		this -> diff_x_displacement = (-2.*this -> diff_wheel_1_displacement+this -> diff_wheel_2_displacement+this -> diff_wheel_3_displacement)/3.;
		this -> diff_y_displacement = (this -> diff_wheel_2_displacement-this -> diff_wheel_3_displacement)/SQRT_3;
		this -> diff_yaw = RAD2DEG((this -> diff_wheel_1_displacement+this -> diff_wheel_2_displacement+this -> diff_wheel_3_displacement)/(3.0*this -> radius));
		
		// 和位移微分
		this -> diff_displacement = sqrt(this -> diff_x_displacement*this -> diff_x_displacement+this -> diff_y_displacement*this -> diff_y_displacement);
		
		// 平动航向角微分（右正左负）
		if(this -> diff_y_displacement != 0)
			this -> diff_displacement_yaw = RAD2DEG(atan(this -> diff_x_displacement/this -> diff_y_displacement));
		else if(this -> diff_x_displacement >= 0 && this -> diff_y_displacement == 0)
			this -> diff_displacement_yaw = 0;
		else if(this -> diff_x_displacement < 0 && this -> diff_y_displacement == 0)
			this -> diff_displacement_yaw = -180;
		
		// 修正平动航向角
		if(this -> diff_x_displacement > 0 && this -> diff_y_displacement <0)
			this -> diff_displacement_yaw = this -> diff_displacement_yaw+180;
		else if(this -> diff_x_displacement < 0 && this -> diff_y_displacement <0)
			this -> diff_displacement_yaw = this -> diff_displacement_yaw-180;
		
		/* 修正航向角 */
		if(yaw > 180)yaw = yaw-360;
		else if(yaw < -180)yaw = yaw+360;
		
		// 世界X,Y方向上的位移微分和位移
		this -> diff_world_x_displacement = this -> diff_displacement*sinf(DEG2RAD(this -> diff_displacement_yaw+yaw*1.15));
		this -> diff_world_y_displacement = this -> diff_displacement*cosf(DEG2RAD(this -> diff_displacement_yaw+yaw*1.15));
		this -> world_x_displacement += this -> diff_world_x_displacement;
		this -> world_y_displacement += this -> diff_world_y_displacement;
	
		// 和位移
		this -> displacement = sqrt(this -> world_x_displacement*this -> world_x_displacement+this -> world_y_displacement*this -> world_y_displacement);
		// 和位移方向
		if(this -> world_y_displacement != 0)
			this -> displacement_yaw = RAD2DEG(atan(this -> world_x_displacement/this -> world_y_displacement));
		else if(this -> world_x_displacement >= 0 && this -> world_y_displacement == 0)
			this -> displacement_yaw = 0;
		else if(this -> world_x_displacement < 0 && this -> world_y_displacement == 0)
			this -> displacement_yaw = -180;
		// 修正和位移方向
		if(this -> world_x_displacement > 0 && this -> world_y_displacement <0)
			this -> displacement_yaw = this -> displacement_yaw+180;
		else if(this -> world_x_displacement < 0 && this -> world_y_displacement <0)
			this -> displacement_yaw = this -> displacement_yaw-180;
		
		// 三个轮子位移
		this -> wheel_1_displacement += this -> diff_wheel_1_displacement;
		this -> wheel_2_displacement += this -> diff_wheel_2_displacement;
		this -> wheel_3_displacement += this -> diff_wheel_3_displacement;
		
		// 路程（和位移微分积分）
		this -> distance += this -> diff_displacement;
	}
	else if(this -> solve_flag == False)
	{
		this -> wheel_1_displacement = 0;	// 轮子位移
		this -> wheel_2_displacement = 0;	
		this -> wheel_3_displacement = 0;	
		this -> world_x_displacement = 0;
		this -> world_y_displacement = 0;
		this -> distance = 0;				// 路程
		this -> displacement = 0;			// 位移
		this -> displacement_yaw = 0;		// 位移航向角
	}
}

// 构造函数
void solve(struct DOG_SOLVE* this, float radius, uint16 solve_IT_time){
	/* 成员变量 */
	this -> roll = 0.;
	this -> pitch = 0.;
	this -> yaw = 0.;	
	this -> wheel_1_displacement = 0;	// 轮子位移
	this -> wheel_2_displacement = 0;	
	this -> wheel_3_displacement = 0;	
	this -> world_x_displacement = 0;
	this -> world_y_displacement = 0;
	this -> distance = 0;				// 路程
	this -> displacement = 0;			// 位移
	this -> displacement_yaw = 0;		// 位移航向角
	this -> radius = radius;	
	this -> solve_IT_time = solve_IT_time;
	this -> solve_flag = False;
	this -> diff_world_x_displacement = 0.;	// 世界X位移微分
	this -> diff_world_y_displacement = 0.;	// 世界Y位移微分
	this -> diff_x_displacement = 0.;		// 车身X位移微分
	this -> diff_y_displacement = 0.;		// 车身Y位移微分
	this -> diff_displacement = 0.;			// 车身位移微分
	this -> diff_yaw = 0.;					// 车身航向角微分
	this -> diff_wheel_1_displacement = 0.;	// 车身轮子1位移
	this -> diff_wheel_2_displacement = 0.; // 车身轮子2位移
	this -> diff_wheel_3_displacement = 0.; // 车身轮子3位移
	this -> diff_displacement_yaw = 0.;		// 车身位移航向角微分
	
	/* 成员函数 */
	this -> euler_angle = euler_angle;
	this -> move_inv_solve = move_inv_solve;
	this -> move_solve = move_solve;
	
	return;
}

// 析构函数
void _solve(struct DOG_SOLVE* this){
	this -> roll = 0.;
	this -> pitch = 0.;
	this -> yaw = 0.;	
	this -> wheel_1_displacement = 0;	// 轮子位移
	this -> wheel_2_displacement = 0;	
	this -> wheel_3_displacement = 0;	
	this -> world_x_displacement = 0;
	this -> world_y_displacement = 0;
	this -> distance = 0;				// 路程
	this -> displacement = 0;			// 位移
	this -> displacement_yaw = 0;		// 位移航向角
	this -> solve_flag = False;
	this -> diff_world_x_displacement = 0.;	// 世界X位移微分
	this -> diff_world_y_displacement = 0.;	// 世界Y位移微分
	this -> diff_x_displacement = 0.;		// 车身X位移微分
	this -> diff_y_displacement = 0.;		// 车身Y位移微分
	this -> diff_displacement = 0.;			// 车身位移微分
	this -> diff_yaw = 0.;					// 车身航向角微分
	this -> diff_wheel_1_displacement = 0.;	// 车身轮子1位移
	this -> diff_wheel_2_displacement = 0.; // 车身轮子2位移
	this -> diff_wheel_3_displacement = 0.; // 车身轮子3位移
	this -> diff_displacement_yaw = 0.;		// 车身位移航向角微分
}