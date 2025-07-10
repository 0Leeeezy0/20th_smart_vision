#ifndef _DOG_SENSOR_H_
#define _DOG_SENSOR_H_

#include "zf_common_headfile.h"
#include "zf_common_debug.h"

#include "DOG_data.h"

struct DOG_ENCODER;
struct DOG_IMU;
struct DOG_CURRENT;
struct DOG_VOLTAGE;

/****************************************************************************************************************************/
/* 编码器 */
typedef struct DOG_ENCODER{
	/* 编码器参数 */
	encoder_index_enum encoder_idx;
	encoder_channel1_enum ch1_pin;	// 通道1引脚
	encoder_channel2_enum ch2_pin;	// 通道2引脚
	_bool_ rotate_reverse_flag;	// 反转参考方向标志位
	uint16 encoder_line_num;	// 编码器线数
	float encoder_IT_time;		// 编码器中断时长（ms）
	float gear_ratio;			// 齿比（编码器转速/电机输出侧转速）
	float wheel_circumference;	// 轮周长（cm）
	/* 读取值 */
	int16 encoder_raw;	// 编码器原始值（线）
	float encoder_rpm;	// 编码器转速（转/s）
	float motor_rpm;	// 电机转速（转/s）
	float wheel_speed;	// 轮速（cm/s）
	
	/* 成员函数 */
	void (*encoder_get)(struct DOG_ENCODER* this);	// 传感器值获取
}DOG_ENCODER;

// 传感器值获取
void encoder_get(struct DOG_ENCODER* this);

// 构造函数
void encoder(struct DOG_ENCODER* this, encoder_index_enum encoder_idx, encoder_channel1_enum ch1_pin, encoder_channel2_enum ch2_pin, _bool_ rotate_reverse_flag, uint16 encoder_line_num, uint16 encoder_IT_time, float gear_ratio, float wheel_circumference);
// 析构函数
void _encoder(struct DOG_ENCODER* this);
/****************************************************************************************************************************/
/* 惯性传感器 */
typedef struct DOG_IMU{
	/* 陀螺仪参数 */	
	_bool_ X_reverse_flag;			// X轴 反转参考方向标志位
	_bool_ Y_reverse_flag;			// Y轴 反转参考方向标志位
	_bool_ Z_reverse_flag;			// Z轴 反转参考方向标志位（要保证右正左负）
	/* 去零飘 */
	_bool_ gyro_calibration_flag;	// 陀螺仪去零飘标志位
	_bool_ acc_calibration_flag;	// 加速度计去零飘标志位
	uint32 calibration_epoch;		// 去零飘轮次
	uint32 epoch;					// 轮次
	float gyro_x_calibration;		
	float gyro_y_calibration;
	float gyro_z_calibration;
	float gyro_x_max;
	float gyro_x_min;
	float gyro_y_max;
	float gyro_y_min;
	float gyro_z_max;
	float gyro_z_min;
	float acc_x_calibration;
	float acc_y_calibration;
	float acc_z_calibration;
	float acc_x_max;
	float acc_x_min;
	float acc_y_max;
	float acc_y_min;
	float acc_z_max;
	float acc_z_min;
	
	/* 读取值 */
	float gyro_x;
	float gyro_y;
	float gyro_z;
	float acc_x;
	float acc_y;
	float acc_z;

	/* 成员函数 */
	void (*gyro_get)(struct DOG_IMU* this);	// 陀螺仪值获取
	void (*acc_get)(struct DOG_IMU* this);	// 加速度计值获取
}DOG_IMU;

// 陀螺仪值获取
void gyro_get(struct DOG_IMU* this);
// 加速度计值获取
void acc_get(struct DOG_IMU* this);	

// 构造函数
void imu(struct DOG_IMU* this, _bool_ X_reverse_flag, _bool_ Y_reverse_flag, _bool_ Z_reverse_flag, uint32 calibration_epoch);
// 析构函数
void _imu(struct DOG_IMU* this);
/****************************************************************************************************************************/
/* 电流采样 */
typedef struct DOG_CURRENT{
	/* ADC参数 */
	adc_channel_enum adc_ch;			// ADC引脚
	adc_resolution_enum resolution;		// ADC分辨率
	float current_ratio;				// 电压-电流换算系数（电压/电流）
	_bool_ current_reverse_flag;	    // 电流反转标志位
	/* 去零飘 */
	_bool_ current_calibration_flag;	// 电流去零飘标志位

	uint32 calibration_epoch;			// 去零飘轮次
	uint32 epoch;						// 轮次
	float current_calibration;		// 去零飘值
	/* 读取值 */
	float current;						// 电流

	float (*current_get)(struct DOG_CURRENT* this);	// 电流获取
}DOG_CURRENT;

// 电流获取
float current_get(struct DOG_CURRENT* this);

// 构造函数
void current(struct DOG_CURRENT* this, adc_channel_enum adc_ch, adc_resolution_enum resolution, float current_ratio, uint32 calibration_epoch,_bool_ current_reverse_flag);
// 析构函数
void _current(struct DOG_CURRENT* this);
/****************************************************************************************************************************/
/* 电压采样 */
typedef struct DOG_VOLTAGE{
	/* ADC参数 */
	adc_channel_enum adc_ch;			// ADC引脚
	adc_resolution_enum resolution;		// ADC分辨率
	/* 读取值 */
	float voltage;
	
	float (*voltage_get)(struct DOG_VOLTAGE* this);	// 电流获取
}DOG_VOLTAGE;

// 电压获取
float voltage_get(struct DOG_VOLTAGE* this);

// 构造函数
void voltage(struct DOG_VOLTAGE* this, adc_channel_enum adc_ch, adc_resolution_enum resolution);
// 析构函数
void _voltage(struct DOG_VOLTAGE* this);
/****************************************************************************************************************************/

#endif