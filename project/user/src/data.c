#include "data.h"

/* 类定义 */	
struct DOG_MOTOR motor_1;					// 电机1
struct DOG_MOTOR motor_2;					// 电机2
struct DOG_MOTOR motor_3;					// 电机3
struct DOG_ENCODER encoder_1;				// 编码器1
struct DOG_ENCODER encoder_2;				// 编码器2
struct DOG_ENCODER encoder_3;				// 编码器3
struct DOG_PID motor_1_pid;					// 电机PID1
struct DOG_PID motor_2_pid;					// 电机PID2
struct DOG_PID motor_3_pid;					// 电机PID3
struct DOG_PID path_pid;					// 路径PID
struct DOG_PID path_gyroz_pid;				// 路径陀螺仪PID
struct DOG_PID rotate_pid;					// 旋转PID
struct DOG_PID box_x_pid;					// 箱子X PID
struct DOG_PID box_y_pid;					// 箱子Y PID
struct DOG_VOFA wireless_vofa;				// 无线串口VOFA
struct DOG_IMU imu660ra;					// IMU660RA陀螺仪
struct DOG_SOLVE euler_angle_solve;			// 欧拉角解算
struct DOG_SOLVE rotate_euler_angle_solve;	// 旋转欧拉角解算
struct DOG_SOLVE chassis_solve;				// 底盘解算
struct DOG_SOLVE displacement_solve;		// 位移解算
struct DOG_CV dog_cv;						// 计算机视觉
struct DOG_PATH dog_path;					// 循迹

/* 使能标志位 */
_bool_ circle_enable_flag = True;		// 圆环 使能标志位
_bool_ zebra_enable_flag = True;		// 斑马线 使能标志位
_bool_ ai_camera_1_enable_flag = True;	// AI相机1 使能标志位
_bool_ ai_camera_2_enable_flag = True;	// AI相机2 使能标志位
_bool_ ai_camera_3_enable_flag = True;	// AI相机3 使能标志位

/* 完成标志位 */
_bool_ rotate_finsh_flag = False;		// 旋转完成标志位

/* 全局变量 */
/* 赛道提取 */
int16 path_err;							// 路径误差
uint16 path_start = 95;					// 路径线起始高度
uint16 path_end = 30;					// 路径线结束高度
uint16 side_extract_start_y = 80;		// 边线提取起始高度
uint16 side_extract_end_y = 20;			// 边线提取结束高度
uint16 prediction_point = 30;			// 预测点高度：其横坐标将作为下一帧的搜线起点
uint16 control_point[2] = {70 ,50};		// 控制点高度（0：最长白列；1：路径线提取）
/* 圆环 */
uint16 circle_check_y = 60;				// 圆环检测线高度
uint16 side_x_delta_range[2] = {3, 15};	// 边线X差值阈值范围（小，大）
/* 斑马线 */
uint16 zebra_check_y = 1;				// 斑马线检测线高度
/* 赛道其他 */
_path_state_ path_state = common_path;	// 赛道状态
/* 控制 */
_control_kind_ control_kind;				// 控制类型
float wheel_speed_target[3] = {0, 0, 0};	// 轮子目标速度
float motor_pwm_duty[3] = {0, 0, 0};		// 电机PWM占空比
_move_solve_kind_ move_solve_kind;			// 运动解算类型
float linear_speed_target;					// 目标线速度
float translation_yaw_target;				// 目标平动角度
float x_speed_target;						// 目标x速度
float y_speed_target;						// 目标y速度
float angular_speed_target;					// 目标旋转速度
float x_speed_rate = 2.2;					// x速度比例（目标x速度/目标旋转速度）
float rotation_yaw_target;					// 目标旋转角度（角度环）
float data_1;								// 运动学逆解算参数1（线速度/X速度）
float data_2;								// 运动学逆解算参数2（航向角/Y速度）
/* 箱子 */
uint16 detection_box_width;					// 识别框宽度
uint16 detection_box_width_limit = 20;		// 识别框宽度阈值（大于此阈值才可以进入箱子追踪模式）
uint16 detection_box_width_target = 80;		// 目标识别框宽度
int16 detection_box_center_x;				// 识别框中心横坐标
uint16 detection_box_center_x_limit = 65;	// 识别框中心横坐标阈值（在阈值范围内才可以进入箱子追踪模式）

/*    PID参数     			Kp     Ki     Kd     积分限幅     输出限幅     陀螺仪Kd*/
// 电机
float MOTOR_1_PID[5] = 	  { 8.8,   6.1,   0.98,  500,         9000 };
float MOTOR_2_PID[5] =    { 8.8,   6.1,   0.98,  500,         9000 };
float MOTOR_3_PID[5] =    { 8.8,   6.1,   0.98,  500,         9000 };
// 电流
float I_1_PID[5] = 		  { 0,     0,     0,     500,         9000 };
float I_2_PID[5] = 		  { 0,     0,     0,     500,         9000 };
float I_3_PID[5] = 		  { 0,     0,     0,     500,         9000 };
// 循线
float PATH_RANGE[2][3] = {{ 4.0,   25.0,  45.0 },		// 循迹误差区间
						  { 10.0,  50.0,  80.0 }};		// 角速度区间
float PATH_PID[4][6] =   {{ 0.390, 0,     2.2,   2,           45,          0.23},
						  { 0.450, 0,     2.1,   2,           45,          0.22},
						  { 0.550, 0,     1.9,   2,           45,          0.21},
						  { 0.600, 0,     1.8,   2,           45,          0.18}};
// 旋转
float ROTATE_RANGE[3] =   { 15.0,  60.0,  120.0 };		// 角度环误差区间						  
float ROTATE_PID[4][5] = {{ 0.33,  0,     0.04,  2,           35 },
//						  { 0.39,  0,     0.05,  2,           45 },
						  { 0.42,  0,     0.06,  2,           55 },
//						  { 0.46,  0,     0.08,  2,           65 },
						  { 0.60,  0,     0.08,  2,           75 },
//						  { 0.80,  0,     0.08,  2,		      85 },
						  { 1.1,   0,     0.08,  2,		      90 }};
//						  { 1.5,   0,     0.08,  2,		      150 }};								  
// BOX X
float BOX_X_PID[5] = 	  { 0.45,  0,     0.07,  2,           35};						  
// BOX Y
float BOX_Y_PID[5] = 	  { 0.45,  0,     0.07,  2,           35};
 
/* KARMAN滤波器参数		   	Q     R     Q越小越平滑   R越小越接近(收敛越快)*/
float MOTOR_1_KARMAN[2] = { 0.01, 0.1};
float MOTOR_2_KARMAN[2] = { 0.01, 0.1};
float MOTOR_3_KARMAN[2] = { 0.01, 0.1};
float I_KARMAN[2] = 	  { 0.01, 0.1};

/* 模糊PID 规则表 */
_fuzzy_subset_ fuzzy_rules[8][8] = {{PM,		PM,		   PM,	      PB,		 PM,	    PM,	       PM,	      PID_NONE},
									{PS,		PM,		   PB,		  PS,		 PB,		PM,	       PS,		  PID_NONE},
									{PS,		PB,		   PM,	      PS,		 PM,	    PB,		   PS,		  PID_NONE},
									{PB,		PM,		   PS,		  ZERO,		 PS,		PM,	       PB,		  PID_NONE},
									{PS,		PB,		   PM,	      PS,		 PM,	    PB,		   PS,		  PID_NONE},
									{PS,		PM,		   PB,		  PS,		 PB,		PM,	       PS,		  PID_NONE},
									{PM,		PM,		   PM,		  PB,		 PM,	    PM,	       PM,	      PID_NONE},
									{PID_NONE,  PID_NONE,  PID_NONE,  PID_NONE,	 PID_NONE,  PID_NONE,  PID_NONE,  PID_NONE}};