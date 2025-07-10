#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_sensor.h"

/****************************************************************************************************************************/
// 传感器值获取
void encoder_get(struct DOG_ENCODER* this){
	this -> encoder_raw = CHECK(this -> rotate_reverse_flag)*encoder_get_count(this -> encoder_idx);
	this -> encoder_rpm = (float)(this -> encoder_raw)/((this -> encoder_line_num)*(this -> encoder_IT_time)/1000.);
	this -> motor_rpm = (this -> encoder_rpm)/(this -> gear_ratio);
	this -> wheel_speed = (this -> wheel_circumference)*(float)(this -> motor_rpm);
	
	encoder_clear_count(this -> encoder_idx);	// 清空
}

// 构造函数
void encoder(struct DOG_ENCODER* this, encoder_index_enum encoder_idx, encoder_channel1_enum ch1_pin, encoder_channel2_enum ch2_pin, _bool_ rotate_reverse_flag, uint16 encoder_line_num, uint16 encoder_IT_time, float gear_ratio, float wheel_circumference){
	/* 成员变量 */
	this -> encoder_idx = encoder_idx;
	this -> ch1_pin = ch1_pin;
	this -> ch2_pin = ch2_pin;
	this -> rotate_reverse_flag = rotate_reverse_flag;
	this -> encoder_line_num = encoder_line_num;
	this -> encoder_IT_time = encoder_IT_time;
	this -> gear_ratio = gear_ratio;
	this -> wheel_circumference = wheel_circumference;
	
	this -> encoder_raw = 0;
	this -> encoder_rpm = 0;
	this -> motor_rpm = 0;
	this -> wheel_speed = 0;
	
	/* 成员函数 */
	this -> encoder_get = encoder_get;
	
	/* 初始化 */
	encoder_dir_init(encoder_idx, ch1_pin, ch2_pin);
	
	return;
}

// 析构函数
void _encoder(struct DOG_ENCODER* this){
	this -> encoder_raw = 0;
	this -> encoder_rpm = 0;
	this -> motor_rpm = 0;
	this -> wheel_speed = 0;
	
	encoder_clear_count(this -> encoder_idx);	// 清空
}
/****************************************************************************************************************************/
// 陀螺仪值获取
void gyro_get(struct DOG_IMU* this){
	imu660ra_get_gyro();
	
	if(this -> gyro_calibration_flag == False)
	{
		if(this -> epoch == 0)
		{
			this -> gyro_x_calibration = 0;
			this -> gyro_y_calibration = 0;
			this -> gyro_z_calibration = 0;
			this -> gyro_x_max = 0;
			this -> gyro_x_min = 0;
			this -> gyro_y_max = 0;
			this -> gyro_y_min = 0;
			this -> gyro_z_max = 0;
			this -> gyro_z_min = 0;
		}
		// 求解去零飘偏移量
		else if(this -> epoch > 0 && this -> epoch <= this -> calibration_epoch/2.0)
		{
			this -> gyro_x = CHECK(this -> X_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_x);
			this -> gyro_y = CHECK(this -> Y_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_y);
			this -> gyro_z = CHECK(this -> Z_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_z);
		
			this -> gyro_x_calibration += 2.0*this -> gyro_x/this -> calibration_epoch;
			this -> gyro_y_calibration += 2.0*this -> gyro_y/this -> calibration_epoch;
			this -> gyro_z_calibration += 2.0*this -> gyro_z/this -> calibration_epoch;
		}
		// 求解上下门限
		else if(this -> epoch > this -> calibration_epoch/2.0 && this -> epoch <= this -> calibration_epoch)
		{
			this -> gyro_x = CHECK(this -> X_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_x)-this -> gyro_x_calibration;
			this -> gyro_y = CHECK(this -> Y_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_y)-this -> gyro_y_calibration;
			this -> gyro_z = CHECK(this -> Z_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_z)-this -> gyro_z_calibration;
			
			if(this -> gyro_x > this -> gyro_x_max)
			{
				this -> gyro_x_max = this -> gyro_x;
			}
			if(this -> gyro_x < this -> gyro_x_min)
			{
				this -> gyro_x_min = this -> gyro_x;
			}
			if(this -> gyro_y > this -> gyro_y_max)
			{
				this -> gyro_y_max = this -> gyro_y;
			}
			if(this -> gyro_y < this -> gyro_y_min)
			{
				this -> gyro_y_min = this -> gyro_y;
			}
			if(this -> gyro_z > this -> gyro_z_max)
			{
				this -> gyro_z_max = this -> gyro_z;
			}
			if(this -> gyro_z < this -> gyro_z_min)
			{
				this -> gyro_z_min = this -> gyro_z;
			}
		}
		this -> epoch++;
		if(this -> epoch > this -> calibration_epoch)
		{
			this -> epoch = 0;
			this -> gyro_x = 0;
			this -> gyro_y = 0;
			this -> gyro_z = 0;
			this -> gyro_calibration_flag = True;
		}
	}	
	else
	{
		this -> gyro_x = CHECK(this -> X_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_x)-this -> gyro_x_calibration;
		this -> gyro_y = CHECK(this -> Y_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_y)-this -> gyro_y_calibration;
		this -> gyro_z = CHECK(this -> Z_reverse_flag)*imu660ra_gyro_transition(imu660ra_gyro_z)-this -> gyro_z_calibration;
		if(this -> gyro_x >= this -> gyro_x_min && this -> gyro_x <= this -> gyro_x_max)
		{
			this -> gyro_x = 0;
		}
		if(this -> gyro_y >= this -> gyro_y_min && this -> gyro_y <= this -> gyro_y_max)
		{
			this -> gyro_y = 0;
		}
		if(this -> gyro_z >= this -> gyro_z_min && this -> gyro_z <= this -> gyro_z_max)
		{
			this -> gyro_z = 0;
		}
	}
}

// 加速度计值获取
void acc_get(struct DOG_IMU* this){
	imu660ra_get_acc();
	
	if(this -> acc_calibration_flag == False)
	{
		if(this -> epoch == 0)
		{
			this -> acc_x_calibration = 0;
			this -> acc_y_calibration = 0;
			this -> acc_z_calibration = 0;
			this -> acc_x_max = 0;
			this -> acc_x_min = 0;
			this -> acc_y_max = 0;
			this -> acc_y_min = 0;
			this -> acc_z_max = 0;
			this -> acc_z_min = 0;
		}
		// 求解去零飘偏移量
		else if(this -> epoch > 0 && this -> epoch <= this -> calibration_epoch/2.0)
		{
			this -> acc_x = CHECK(this -> X_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_x);
			this -> acc_y = CHECK(this -> Y_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_y);
			this -> acc_z = CHECK(this -> Z_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_z);
		
			this -> acc_x_calibration += 2.0*this -> acc_x/this -> calibration_epoch;
			this -> acc_y_calibration += 2.0*this -> acc_y/this -> calibration_epoch;
			this -> acc_z_calibration += 2.0*this -> acc_z/this -> calibration_epoch;
		}
		// 求解上下门限
		else if(this -> epoch > this -> calibration_epoch/2.0 && this -> epoch <= this -> calibration_epoch)
		{
			this -> acc_x = CHECK(this -> X_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_x)-this -> acc_x_calibration;
			this -> acc_y = CHECK(this -> Y_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_y)-this -> acc_y_calibration;
			this -> acc_z = CHECK(this -> Z_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_z)-this -> acc_z_calibration;
			
			if(this -> acc_x > this -> acc_x_max)
			{
				this -> acc_x_max = this -> acc_x;
			}
			if(this -> acc_x < this -> acc_x_min)
			{
				this -> acc_x_min = this -> acc_x;
			}
			if(this -> acc_y > this -> acc_y_max)
			{
				this -> acc_y_max = this -> acc_y;
			}
			if(this -> acc_y < this -> acc_y_min)
			{
				this -> acc_y_min = this -> acc_y;
			}
			if(this -> acc_z > this -> acc_z_max)
			{
				this -> acc_z_max = this -> acc_z;
			}
			if(this -> acc_z < this -> acc_z_min)
			{
				this -> acc_z_min = this -> acc_z;
			}
		}
		this -> epoch++;
		if(this -> epoch > this -> calibration_epoch)
		{
			this -> epoch = 0;
			this -> acc_x = 0;
			this -> acc_y = 0;
			this -> acc_z = 0;
			this -> acc_calibration_flag = True;
		}	
	}
	else
	{
		this -> acc_x = CHECK(this -> X_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_x)-this -> acc_x_calibration;
		this -> acc_y = CHECK(this -> Y_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_y)-this -> acc_y_calibration;
		this -> acc_z = CHECK(this -> Z_reverse_flag)*imu660ra_acc_transition(imu660ra_acc_z)-this -> acc_z_calibration;
		if(this -> acc_x >= this -> acc_x_min && this -> acc_x <= this -> acc_x_max)
		{
			this -> acc_x = 0;
		}
		if(this -> acc_y >= this -> acc_y_min && this -> acc_y <= this -> acc_y_max)
		{
			this -> acc_y = 0;
		}
		if(this -> acc_z >= this -> acc_z_min && this -> acc_z <= this -> acc_z_max)
		{
			this -> acc_z = 0;
		}
	}
}

// 构造函数
void imu(struct DOG_IMU* this, _bool_ X_reverse_flag, _bool_ Y_reverse_flag, _bool_ Z_reverse_flag, uint32 calibration_epoch){
	/* 成员变量 */
	this -> X_reverse_flag = X_reverse_flag;			
	this -> Y_reverse_flag = Y_reverse_flag;			
	this -> Z_reverse_flag = Z_reverse_flag;			
	this -> gyro_calibration_flag = False;	
	this -> acc_calibration_flag = False;	
	this -> calibration_epoch = calibration_epoch;
	this -> epoch = 0;
	this -> gyro_x_calibration = 0;
	this -> gyro_y_calibration = 0;
	this -> gyro_z_calibration = 0;
	this -> gyro_x_max = 0;
	this -> gyro_x_min = 0;
	this -> gyro_y_max = 0;
	this -> gyro_y_min = 0;
	this -> gyro_z_max = 0;
	this -> gyro_z_min = 0;
	this -> acc_x_calibration = 0;
	this -> acc_y_calibration = 0;
	this -> acc_z_calibration = 0;
	this -> acc_x_max = 0;
	this -> acc_x_min = 0;
	this -> acc_y_max = 0;
	this -> acc_y_min = 0;
	this -> acc_z_max = 0;
	this -> acc_z_min = 0;

	this -> gyro_x = 0;
	this -> gyro_y = 0;
	this -> gyro_z = 0;
	this -> acc_x = 0;
	this -> acc_y = 0;
	this -> acc_z = 0;
	
	/* 成员函数 */
	this -> gyro_get = gyro_get;
	this -> acc_get = acc_get;
	
	/* 初始化 */
	imu660ra_init();
	
	return;
}

// 析构函数
void _imu(struct DOG_IMU* this){
	/* 成员变量 */		
	this -> gyro_calibration_flag = False;	
	this -> acc_calibration_flag = False;
	this -> epoch = 0;
	this -> gyro_x_calibration = 0;
	this -> gyro_y_calibration = 0;
	this -> gyro_z_calibration = 0;
	this -> gyro_x_max = 0;
	this -> gyro_x_min = 0;
	this -> gyro_y_max = 0;
	this -> gyro_y_min = 0;
	this -> gyro_z_max = 0;
	this -> gyro_z_min = 0;
	this -> acc_x_calibration = 0;
	this -> acc_y_calibration = 0;
	this -> acc_z_calibration = 0;
	this -> acc_x_max = 0;
	this -> acc_x_min = 0;
	this -> acc_y_max = 0;
	this -> acc_y_min = 0;
	this -> acc_z_max = 0;
	this -> acc_z_min = 0;	

	this -> gyro_x = 0;
	this -> gyro_y = 0;
	this -> gyro_z = 0;
	this -> acc_x = 0;
	this -> acc_y = 0;
	this -> acc_z = 0;
}
/****************************************************************************************************************************/
// 电流获取
float current_get(struct DOG_CURRENT* this){
	if(this -> current_calibration_flag == False)
	{
		if(this -> epoch == 0)
			this -> current_calibration = 0;
		// 求解去零飘偏移量
		else if(this -> epoch > 0 && this -> epoch <= this -> calibration_epoch)
		{
			this -> current = (float)adc_mean_filter_convert(this -> adc_ch, 10)/(this -> current_ratio);
			this -> current_calibration += this -> current/this -> calibration_epoch;
		}
		this -> epoch++;
		if(this -> epoch > this -> calibration_epoch)
		{
			this -> epoch = 0;
			this -> current = 0;
			this -> current_calibration_flag = True;
		}	
	}
	else
	{
	this -> current = (float)adc_mean_filter_convert(this -> adc_ch, 10)/(this -> current_ratio)-this -> current_calibration;  
    if (this ->current_dir == 0) this -> current=-1.0 * this -> current;
    }
    return (this -> current);

}

// 构造函数
void current(struct DOG_CURRENT* this, adc_channel_enum adc_ch, adc_resolution_enum resolution, float current_ratio, uint32 calibration_epoch,uint8 dir){
	this -> adc_ch = adc_ch;		
	this -> resolution = resolution;		
	this -> current_ratio = current_ratio;	
	this -> calibration_epoch = calibration_epoch;
	this -> epoch = 0;
	this -> current_calibration = 0;
    this ->current_dir=dir;
	/* 成员函数 */
	this -> current_get = current_get;
	
	/* 初始化 */
	adc_init(adc_ch, resolution);
}
// 析构函数
void _current(struct DOG_CURRENT* this){
	this -> current_ratio = 0;
	this -> epoch = 0;
	this -> current_calibration = 0;
}
/****************************************************************************************************************************/
// 电压获取
float voltage_get(struct DOG_VOLTAGE* this){
	switch(this -> resolution)
	{
		case ADC_8BIT:{ this -> voltage = (float)adc_mean_filter_convert(this -> adc_ch, 5)/256.; break; }
		case ADC_10BIT:{ this -> voltage = (float)adc_mean_filter_convert(this -> adc_ch, 5)/1024.; break; }
		case ADC_12BIT:{ this -> voltage = (float)adc_mean_filter_convert(this -> adc_ch, 5)/4096.; break; }
	}
	return (this -> voltage);
}

// 构造函数
void voltage(struct DOG_VOLTAGE* this, adc_channel_enum adc_ch, adc_resolution_enum resolution){
	this -> adc_ch = adc_ch;		
	this -> resolution = resolution;		

	/* 成员函数 */
	this -> voltage_get = voltage_get;
	
	/* 初始化 */
	adc_init(adc_ch, resolution);
}
// 析构函数
void _voltage(struct DOG_VOLTAGE* this);
/****************************************************************************************************************************/
