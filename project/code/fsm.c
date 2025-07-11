#include "common.h"
#include "data.h"

/* 状态机 */
void fsm(void){
	static float max_sum_weight_normalization_yaw = 0;			// 最大归一化加权和航向角
	static float box_fxxk_finsh_distance = 0;		// 推离箱子时的路程
	static int8 box_dir = 0;	// 箱子推离方向
	
	// 二值化
	dog_cv.threshold(&dog_cv, mt9v03x_image);
	// 边线提取
	dog_path.side_extract(&dog_path, dog_cv.image_OTSU);
	// 边线点类型判断
	dog_path.side_point_kind_judge(&dog_path);
	// 最长白列
	dog_path.longest_white_col(&dog_path, dog_cv.image_OTSU, control_point[0]);
	// 路径线提取
	dog_path.path_extract(&dog_path, dog_cv.image_OTSU);
	// 赛道状态判断
	path_state = path_state_judge(dog_cv.image_OTSU);
	
	/************************************* 状态切换 *************************************/
	switch(path_state){
		// 左圆环入环
		case L_circle_in:{ 
			/* 标志位 */
			circle_euler_angle_solve.solve_flag = True;	// 开启圆环欧拉角解算
			/* 运动设置 */
			control_kind = CircleAngle2Inv2Speed; 	// 设置控制类型
			move_solve_kind = XY_SPEED_SOLVE;		// 设置解算类型
			x_speed_target = 0;
			speed_slow_change(circle_y_speed_target, False);
			circle_rotation_yaw_target = -circle_angle_target[0];
			// 判断是否转到指定角度
			if(circle_rotate_finsh_flag == True)
			{
				/* 标志位 */
				circle_euler_angle_solve.solve_flag = False;		// 关闭圆环欧拉角解算
				circle_in_distance = displacement_solve.distance;	// 获取入环处相对于起始点的路程
				circle_rotate_finsh_flag = False;					// 初始化圆环转动完成标志位
				/* 停车 */
				control_kind = Speed; 		// 设置控制类型
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 状态切换 */
				path_state = L_circle;
				break;
			}
			break; 
		}
		// 左圆环出环
		case L_circle_out:{ 
			/* 标志位 */
			circle_euler_angle_solve.solve_flag = True;	// 开启圆环欧拉角解算
			/* 运动设置 */
			control_kind = CircleAngle2Inv2Speed; 	// 设置控制类型
			move_solve_kind = XY_SPEED_SOLVE;		// 设置解算类型
			x_speed_target = 0;
			speed_slow_change(circle_y_speed_target, False);
			circle_rotation_yaw_target = -circle_angle_target[1];
			// 判断是否转到指定角度
			if(circle_rotate_finsh_flag == True)
			{
				/* 标志位 */
				circle_euler_angle_solve.solve_flag = False;		// 关闭圆环欧拉角解算
				circle_out_distance = displacement_solve.distance;	// 获取出环处相对于起始点的路程
				circle_rotate_finsh_flag = False;					// 初始化圆环转动完成标志位
				/* 停车 */
				control_kind = Speed; 		// 设置控制类型
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 状态切换 */
				path_state = common_path;
				break;
			}
			break; 
		}
		// 右圆环入环
		case R_circle_in:{ 
			/* 标志位 */
			circle_euler_angle_solve.solve_flag = True;	// 开启圆环欧拉角解算
			/* 运动设置 */
			control_kind = CircleAngle2Inv2Speed; 	// 设置控制类型
			move_solve_kind = XY_SPEED_SOLVE;		// 设置解算类型
			x_speed_target = 0;
			speed_slow_change(circle_y_speed_target, False);
			circle_rotation_yaw_target = circle_angle_target[0];
			// 判断是否转到指定角度
			if(circle_rotate_finsh_flag == True)
			{
				/* 标志位 */
				circle_euler_angle_solve.solve_flag = False;		// 关闭圆环欧拉角解算
				circle_in_distance = displacement_solve.distance;	// 获取入环处相对于起始点的路程
				circle_rotate_finsh_flag = False;					// 初始化圆环转动完成标志位
				/* 停车 */
				control_kind = Speed; 		// 设置控制类型
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 状态切换 */
				path_state = R_circle;
				break;
			}
			break; 
		}
		// 右圆环出环
		case R_circle_out:{ 
			/* 标志位 */
			circle_euler_angle_solve.solve_flag = True;	// 开启圆环欧拉角解算
			/* 运动设置 */
			control_kind = CircleAngle2Inv2Speed; 	// 设置控制类型
			move_solve_kind = XY_SPEED_SOLVE;		// 设置解算类型
			x_speed_target = 0;
			speed_slow_change(circle_y_speed_target, False);
			circle_rotation_yaw_target = circle_angle_target[1];
			// 判断是否转到指定角度
			if(circle_rotate_finsh_flag == True)
			{
				/* 标志位 */
				circle_euler_angle_solve.solve_flag = False;		// 关闭圆环欧拉角解算
				circle_out_distance = displacement_solve.distance;	// 获取出环处相对于起始点的路程
				circle_rotate_finsh_flag = False;					// 初始化圆环转动完成标志位
				/* 停车 */
				control_kind = Speed; 		// 设置控制类型
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 状态切换 */
				path_state = common_path;
				break;
			}
			break; 
		}
		// 斑马线
		case zebra_path:{
			if(fabsf(displacement_solve.distance-zebra_stop_distance) >= 50){
				/* 停车 */
				control_kind = Speed; 		// 设置控制类型
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 显示识别结果列表页面 */
				menu_detection_list();
				break;
			}
			break;
		}
		// 箱子一次定位
		case box_first_track:{
			/* 运动设置 */
			control_kind = XY2Inv2Speed;	// 设置控制模式
			angular_speed_target = 0;
			if(box_XY_finsh_flag == True){
				/* 标志位 */
				box_XY_finsh_flag = False;
				/* 停车 */
				control_kind = Speed;		// 设置控制模式
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 初始化识别结果 */
				detection_result.tool_detection_finsh_flag = False;
				detection_result.num_detection_finsh_flag = False;
//				detection_result.tool_detection_finsh_flag = True;
//				detection_result.num_detection_finsh_flag = True;
				/* 状态切换 */
				path_state = box_calibration;	// 进入箱子矫正状态
				break;
			}
			break;
		}
		// 箱子矫正
		case box_calibration:{
			static float max_sum_weight_normalization = 0;				// 最大归一化加权和
			// 在没接收到数据前一直发送开始识别串口（防止AI摄像头没收到）
			if( (ai_camera_1_enable_flag == True && ai_camera_2_enable_flag == True && detection_result.tool_detection_finsh_flag == False && detection_result.num_detection_finsh_flag == False) ||
				(ai_camera_1_enable_flag == True && ai_camera_2_enable_flag == False && detection_result.tool_detection_finsh_flag == False && detection_result.num_detection_finsh_flag == False) ||
				(ai_camera_1_enable_flag == False && ai_camera_2_enable_flag == True && detection_result.num_detection_finsh_flag == False && detection_result.tool_detection_finsh_flag == False)){
				/* 发送开始识别串口 */
				uint8 detection_start[5] = {0x4f, 0x16, 0x08, 0x76, 0x76};
//				system_delay_ms(50);
				uart_write_buffer(AI_CAMERA_1_UART_INDEX, detection_start, sizeof(detection_start));
				#ifndef AI_CAMERA_MERGE
				uart_write_buffer(AI_CAMERA_2_UART_INDEX, detection_start, sizeof(detection_start));
				#endif
			}
			// 查询式等待两个摄像头识别完成
			if(	(ai_camera_1_enable_flag == True && ai_camera_2_enable_flag == True && detection_result.tool_detection_finsh_flag == True && detection_result.num_detection_finsh_flag == True) ||
				(ai_camera_1_enable_flag == True && ai_camera_2_enable_flag == False && detection_result.tool_detection_finsh_flag == True && detection_result.num_detection_finsh_flag == False) ||
				(ai_camera_1_enable_flag == False && ai_camera_2_enable_flag == True && detection_result.num_detection_finsh_flag == True && detection_result.tool_detection_finsh_flag == False) ||
				(ai_camera_1_enable_flag == False && ai_camera_2_enable_flag == False)){
				/* 运动设置 */
				control_kind = Inv2Speed; 			// 设置控制类型
				move_solve_kind = XY_SPEED_SOLVE;	// 设置解算类型
				// 开启箱子欧拉角解算
				box_euler_angle_solve.solve_flag = True;
				// 设置目标速度（dir：1：左推；dir：-1：右推）
				if((detection_result.tool >= 0X01 && detection_result.tool <= 0X08) || ((detection_result.num&0X01) == 0 && detection_result.tool == 0X10)) box_dir = -1;	
				else if((detection_result.tool >= 0X09 && detection_result.tool <= 0X0F) || ((detection_result.num&0X01) == 1 && detection_result.tool == 0X10)) box_dir = 1;
				else box_dir = 1;
				// 防止两个摄像头都失能时，数据乱变（我也不知道为啥数据会乱跳）
				if(ai_camera_1_enable_flag == False && ai_camera_2_enable_flag == False)
					box_dir = 1;
				x_speed_target = box_dir*box_x_speed_target;
				y_speed_target = 0;
				angular_speed_target = -box_dir*box_x_speed_target*box_x_angular_speed_rate;
				// 计算对称度
				symmetry_rectificate(dog_cv.image_OTSU);
				// 找最大归一化加权和与其对应航向角（取加权和对应的角度较大的那个）
				// 满足不正对赛道
				if(frame_white_num_normalization[0] >= frame_white_num_normalization_limit && frame_white_num_normalization[1] >= frame_white_num_normalization_limit && sum_weight_normalization >= sum_weight_normalization_limit[1]){					
					if(sum_weight_normalization >= max_sum_weight_normalization){	// 加权和大于之前的
						max_sum_weight_normalization = sum_weight_normalization;
						max_sum_weight_normalization_yaw = box_euler_angle_solve.yaw;
					}
				}
				// 判断是否矫正完成
				if(sum_weight_normalization >= sum_weight_normalization_limit[0] && frame_white_num_normalization[0] >= frame_white_num_normalization_limit && frame_white_num_normalization[1] >= frame_white_num_normalization_limit)
				{
					/* 标志位 */
					box_euler_angle_solve.solve_flag = False;	// 关闭箱子欧拉角解算
					/* 清空中间量 */ 
					max_sum_weight_normalization_yaw = 0;		// 最大归一化加权和对应的航向角
					max_sum_weight_normalization = 0;			// 最大归一化加权和
					/* 停车 */
					control_kind = Speed;			// 设置控制模式
					wheel_speed_target[0] = 0;
					wheel_speed_target[1] = 0;
					wheel_speed_target[2] = 0;
					/* 状态切换 */
					path_state = box_second_track;	// 进入箱子二次定位状态
					/* 存储识别结果 */
					detection_result_list[detection_result_num] = detection_result;
					detection_result_num++;
					break;
				}
				// 转动超过180°没达到阈值，就进入逆矫正状态
				if(fabsf(box_euler_angle_solve.yaw) > 180)
				{
					/* 清空中间量 */ 
					max_sum_weight_normalization = 0;		// 最大归一化加权和
					/* 运动设置 */
					control_kind = Inv2Speed; 				// 设置控制类型
					move_solve_kind = XY_SPEED_SOLVE;		// 设置解算类型
					x_speed_target = -box_dir*box_x_speed_target;
					y_speed_target = 0;
					angular_speed_target = box_dir*box_x_speed_target*box_x_angular_speed_rate;
					/* 状态切换 */
					path_state = box_inv_calibration;		// 进入箱子逆矫正状态
					/* 存储识别结果 */
					detection_result_list[detection_result_num] = detection_result;
					detection_result_num++;
					break;
				}
			}
			break;
		}
		// 箱子逆矫正
		case box_inv_calibration:{
			// 防止有时候为0的情况就默认转90度
			if(max_sum_weight_normalization_yaw == 0){
				max_sum_weight_normalization_yaw = 90;
			}
			if(fabsf(box_euler_angle_solve.yaw) <= fabsf(max_sum_weight_normalization_yaw))
			{
				box_euler_angle_solve.solve_flag = False;	// 关闭箱子欧拉角解算
				/* 清空中间量 */ 
				max_sum_weight_normalization_yaw = 0;	// 最大归一化加权和对应的航向角
				/* 停车 */
				control_kind = Speed;			// 设置控制模式
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 1;
				wheel_speed_target[2] = 2;
				/* 状态切换 */
				path_state = box_second_track;	// 进入箱子二次定位状态
				/* 标志位 */
				box_X_finsh_flag = False;		// 箱子X定位完成标志位
				break;
			}
			break;
		}
		// 箱子二次定位
		case box_second_track:{
			/* 运动设置 */
			control_kind = X2Inv2Speed;
			angular_speed_target = 0;
			if(box_X_finsh_flag == True){
				/* 停车 */
				control_kind = Speed;		// 设置控制模式
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				path_state = box_fxxk;		// 进入箱子推离状态
				
				y_speed_target = 0;			// 设置推箱子缓启动速度
				break;
			}
			break;
		}
		// 箱子推离状态
		case box_fxxk:{	// 为防止启动瞬间偏转，因此加入陀螺仪抑制
			static uint8 num = 0;
			/* 标志位设置 */
			static _bool_ is_in_track = False;	// 是否在赛道标志位
			rotate_euler_angle_solve.solve_flag = True;	// 开启旋转欧拉角解算
			/* 设置箱子X方向定位 */
			float detection_box_center_err = detection_box_center_x-AI_CAMERA_0_IMAGE_WIDTH/2; 
			float X_Kp[4] = { BOX_X_PID[0][0], BOX_X_PID[1][0], BOX_X_PID[2][0], BOX_X_PID[3][0] };
			float X_Ki[4] = { BOX_X_PID[0][1], BOX_X_PID[1][1], BOX_X_PID[2][1], BOX_X_PID[3][1] };
			float X_Kd[4] = { BOX_X_PID[0][2], BOX_X_PID[1][2], BOX_X_PID[2][2], BOX_X_PID[3][2] };
			float X_i_limit[4] = { BOX_X_PID[0][3], BOX_X_PID[1][3], BOX_X_PID[2][3], BOX_X_PID[3][3] };
			float X_output_limit[4] = { BOX_X_PID[0][4], BOX_X_PID[1][4], BOX_X_PID[2][4], BOX_X_PID[3][4] };
			
			/* 运动设置 */
			control_kind = Angle2Inv2Speed;		// 设置控制模式
			move_solve_kind = XY_SPEED_SOLVE;	// 设置解算类型
			box_x_pid.fuzzy_pid(&box_x_pid, &detection_box_center_err, X_Kp, X_Ki, X_Kd, X_i_limit, X_output_limit, 1);
			x_speed_target = box_x_pid.positional_pid(&box_x_pid, 0, -detection_box_center_err);
			speed_slow_change(box_fxxk_y_speed_target, True);		// 设置推箱子目标速度   
			angle_rotation_yaw_target = 0;							// 设置目标旋转角度
			/* 判断是否在赛道内 */
			if(gray_sensor.voltage < 0.3 && num < 22)
				num++;
			if(num > 20)
				is_in_track = True;
			if(is_in_track == True && gray_sensor.voltage > 0.6)
			{
				/* 停车 */
				control_kind = Speed;		// 设置控制模式
				wheel_speed_target[0] = 0;
				wheel_speed_target[1] = 0;
				wheel_speed_target[2] = 0;
				/* 变量设置 */
				is_in_track = False;	
				num = 0;
				/* 标志位设置 */
				box_fxxk_finsh_distance = displacement_solve.distance;	// 记录推离箱子时的路程
				rotate_euler_angle_solve.solve_flag = False;	// 关闭箱子欧拉角解算
				/* 状态切换 */
				path_state = path_back;	// 进入 回赛道 状态
				break;
			}
			break;
		}
		// 回赛道状态
		case path_back:{
			if(fabsf(displacement_solve.distance-box_fxxk_finsh_distance) >= 30){
				/* 标志位设置 */
				rotate_euler_angle_solve.solve_flag = True;	// 开启旋转欧拉角解算
				
				/* 运动设置 */
				control_kind = Angle2Inv2Speed;		// 设置控制模式
				move_solve_kind = XY_SPEED_SOLVE;	// 设置解算类型
				x_speed_target = 0;
				y_speed_target = 0;
				angle_rotation_yaw_target = box_dir*90;
				
				if(angle_rotate_finsh_flag == True){
					rotate_euler_angle_solve.solve_flag = False;	// 关闭箱子欧拉角解算
					angle_rotate_finsh_flag = False;				// 初始化旋转完成标志位
					/* 停车 */
					control_kind = Speed;		// 设置控制模式
					wheel_speed_target[0] = 0;
					wheel_speed_target[1] = 0;
					wheel_speed_target[2] = 0;
					
					y_speed_target = 0;			// 设置循线缓启动速度
					/* 变量设置 */
					last_box_distance = displacement_solve.distance;	// 记录当前箱子相对于起始点的路程
					dog_path.mid_x = MT9V03X_W/2;						// 设置循线起始中点（一定要有这个，不然会原地掉头）
					// 最长白列
					dog_path.longest_white_col(&dog_path, dog_cv.image_OTSU, control_point[0]);
					// 路径线提取
					dog_path.path_extract(&dog_path, dog_cv.image_OTSU);
					/* 状态切换 */
					path_state = last_path_state;
					break;
				}
				break;
			}
			/* 运动设置 */
			control_kind = Inv2Speed;		// 设置控制模式
			x_speed_target = 0;
			y_speed_target = -box_fxxk_y_speed_target;
			angular_speed_target = -PATH_PID[0][5]*imu660ra.gyro_z;	// 注意极性
			angle_rotate_finsh_flag = False;				// 初始化旋转完成标志位
			break;
		}
		default: break;
	}
	/***********************************************************************************/
	
	// 循线控制
	if(path_state == common_path || path_state == L_circle || path_state == R_circle || path_state == zebra_path){
		// 圆环
		if(path_state == L_circle || path_state == R_circle){
			// 循线误差计算
//			path_err = dog_path.path[control_point[1]][0]-MT9V03X_W/2;	
			path_err = dog_path.longest_white_col_x-MT9V03X_W/2;
			path_pid_calc();
//			angular_speed_target*x_speed_rate;
			if(displacement_solve.y_speed >= circle_y_speed_target_limit)
				x_speed_target = angular_speed_target*x_speed_rate;
			else
				x_speed_target = 0;
			speed_slow_change(circle_y_speed_target, True);	// 缓变速
		}
		// 普通赛道/斑马线
		else{
			// 循线误差计算
			path_err = dog_path.longest_white_col_x-MT9V03X_W/2;
			path_pid_calc();
//			angular_speed_target*x_speed_rate;
			if(displacement_solve.y_speed >= path_y_speed_target_limit)
				x_speed_target = angular_speed_target*x_speed_rate;
			else
				x_speed_target = 0;
			speed_slow_change(path_y_speed_target, True);	// 缓变速
		}
	}
}

/* 赛道状态判断 */
static _path_state_ path_state_judge(uint8 input[MT9V03X_H][MT9V03X_W]){
	static uint8 box_track_num;	// 箱子定位不满足条件的次数
	_path_state_ path_state_return = common_path;
	
	// 保证从箱子一次定位状态退出后能够切换回原状态
	if(path_state == box_first_track)
		path_state_return = last_path_state;
	
	// 圆环判断
	if(circle_enable_flag == True){
		uint16 circle_check[2] = {0};	// 圆环
		uint16 L_side_X_delta_max = 0;	// 左边线X最大差值
		uint16 R_side_X_delta_max = 0;	// 右边线X最大差值

		// 圆环检测线
		// 左边线
		for(uint16 X = dog_path.mid_x;X >= 0;X--)
		{
			if(input[circle_check_y-1][X] == 0)    // 黑色
			{
				// 存储白色点
				circle_check[0] = X+1;
				break;
			}
			if(X == 0)
			{
				// 存储白色点
				circle_check[0] = 0;
				break;
			}
		}
		// 右边线
		for(int X = dog_path.mid_x;X <= MT9V03X_W-1;X++)
		{
			if(input[circle_check_y-1][X] == 0)    // 黑色
			{
				// 存储白色点
				circle_check[1] = X-1;
				break;
			}
			if(X == MT9V03X_W-1)
			{
				// 存储白色点
				circle_check[1] = MT9V03X_W-1;
				break;
			}
		}

		// 左右边线最大差值计算
		for(int num = 1;num < path_start-path_end;num++)
		{
			// 右
			if(abs((dog_path.path[num+1][0]+dog_path.path_width[num+1]/2)-(dog_path.path[num][0]+dog_path.path_width[num]/2)) >= R_side_X_delta_max)
			{
				R_side_X_delta_max = abs((dog_path.path[num+1][0]+dog_path.path_width[num+1]/2)-(dog_path.path[num][0]+dog_path.path_width[num]/2));
			}
			// 左
			if(abs((dog_path.path[num+1][0]-dog_path.path_width[num+1]/2)-(dog_path.path[num][0]-dog_path.path_width[num]/2)) >= L_side_X_delta_max)
			{
				L_side_X_delta_max = abs((dog_path.path[num+1][0]-dog_path.path_width[num+1]/2)-(dog_path.path[num][0]-dog_path.path_width[num]/2));
			}
		}
		
		// 右圆环入环
		// 1.赛道已经在图像边界；2.入环对侧边线弯点小于一定阈值；3.入环对侧边线在图像边缘的数量/总数量小于一定阈值（防止十字误判）；4.入环对侧的相邻边线X坐标差值小于一定阈值（防止十字误判）；5.入环侧的相邻边线X坐标差值大于一定阈值（防止十字误判）
		if(circle_check[1] == MT9V03X_W-1 && dog_path.L_bend_point_num <= 3 && ((float)dog_path.L_frame_point_num/(float)dog_path.L_side_point_num) <= 0.15 &&  L_side_X_delta_max <= side_x_delta_range[0] && R_side_X_delta_max >= side_x_delta_range[1] && path_state == common_path)
		{
			if(displacement_solve.distance-circle_out_distance >= circle_in_distance_limit){	// 出环后超过1.5m可再次入环
				path_state_return = R_circle_in;
			}
		}
		// 右圆环出环
		else if(circle_check[1] == MT9V03X_W-1 && path_state == R_circle)
		{
			if(displacement_solve.distance-circle_in_distance >= circle_out_distance_limit){	// 入环后超过1m可再次出环
				path_state_return = R_circle_out;
			}
		}
		// 左圆环入环
		// 1.赛道已经在图像边界；2.入环对侧边线弯点小于一定阈值；3.入环对侧边线在图像边缘的数量/总数量小于一定阈值（防止十字误判）；4.入环对侧的相邻边线X坐标差值小于一定阈值（防止十字误判）；5.入环侧的相邻边线X坐标差值大于一定阈值（防止十字误判）
		else if(circle_check[0] == 0 && dog_path.R_bend_point_num <= 3 && ((float)dog_path.R_frame_point_num/(float)dog_path.R_side_point_num) <= 0.15 && R_side_X_delta_max <= side_x_delta_range[0] && L_side_X_delta_max >= side_x_delta_range[1] && path_state == common_path)
		{
			if(displacement_solve.distance-circle_out_distance >= circle_in_distance_limit){	// 出环后超过1.5m可再次入环
				path_state_return = L_circle_in;
			}
		}
		// 左圆环出环
		else if(circle_check[0] == 0 && path_state == L_circle)
		{
			if(displacement_solve.distance-circle_in_distance >= circle_out_distance_limit){	// 入环后超过1m可再次出环
				path_state_return = L_circle_out;
			}
		}
		
	}
	// 斑马线判断
	if(zebra_enable_flag == True && path_state == common_path){
		zebra_path_timer.ticking_flag = True;
		uint16 black_white_point_num = 0;	// 黑白跳变点数量
		if(zebra_path_timer.time >= 5000)
		{
			for(int X = 0+25;X < MT9V03X_W-1-25;X++)
			{
				if((dog_cv.image_OTSU[MT9V03X_H-10][X] == 255 && dog_cv.image_OTSU[MT9V03X_H-10][X+1] == 0) || (dog_cv.image_OTSU[MT9V03X_H-10][X] == 0 && dog_cv.image_OTSU[MT9V03X_H-10][X+1] == 255))
				{
					black_white_point_num++;
				}
			}
			if(black_white_point_num >= 12)
			{
				path_state_return = zebra_path;
				zebra_stop_distance = displacement_solve.distance;
			}
		}
	}
	// 箱子状态判断
	// 箱子一次定位（宽度超过阈值且中心坐标在范围内时进入定位状态 或 高度超过阈值时进入状态 防止箱子在图像边缘导致无法进入定位状态从而掠过箱子）
	if(ai_camera_0_enable_flag == True && ((detection_box_width >= detection_box_width_limit && abs(detection_box_center_x-AI_CAMERA_0_IMAGE_WIDTH/2) <= detection_box_center_x_limit) || detection_box_height >= detection_box_height_limit) && (displacement_solve.distance-last_box_distance) >= 80){
		// 识别框宽度或高度超过阈值，进入箱子定位状态
		path_state_return = box_first_track;
		box_track_num = 0;
		// 只需要进入箱子一次定位状态就行，后续状态只需要保持，状态切换由上个状态结束完成
	}
	// 上一次状态是箱子一次定位，且此次不是箱子一次定位时，不满足条件次数增加
	if(path_state == box_first_track && path_state_return != box_first_track){
		box_track_num++;
	}
	if(path_state != box_first_track){
		box_track_num = 0;
	}
		

	// 赛道状态保持
	switch(path_state){
		case R_circle_in:{ path_state_return = R_circle_in; break; }
		case L_circle_in:{ path_state_return = L_circle_in; break; }
		case R_circle:{ if(path_state_return != R_circle_out && path_state_return != box_first_track)path_state_return = R_circle; break; }	// 由于保持 R_circle 状态会导致无法切换成 R_circle_out等 状态，因此需要加上限制
		case L_circle:{ if(path_state_return != L_circle_out && path_state_return != box_first_track)path_state_return = L_circle; break; }	// 由于保持 L_circle 状态会导致无法切换成 L_circle_out等 状态，因此需要加上限制
		case R_circle_out:{ path_state_return = R_circle_out; break; }
		case L_circle_out:{ path_state_return = L_circle_out; break; }
		case zebra_path:{ path_state_return = zebra_path; break; }						// 保持 zebra_path 状态，直到路程超过阈值即停车，切换至 zebra_path_stop 状态
		case box_first_track:{ if(path_state_return == box_first_track || box_track_num <= 1)path_state_return = box_first_track; break; }			// 保持 box_first_track 状态（前提：判断不是common_path/R_circle/L_circle，以此保证可以在中途拿走箱子后还能继续循线或不满足条件的次数在阈值内，则保持箱子一次定位状态）
		case box_calibration:{ path_state_return = box_calibration; break; }			// 保持 box_calibration 状态
		case box_inv_calibration:{ path_state_return = box_inv_calibration; break; }	// 保持 box_inv_calibration 状态
		case box_second_track:{ path_state_return = box_second_track; break; }			// 保持 box_second_track 状态
		case box_fxxk:{ path_state_return = box_fxxk; break; }							// 保持 box_fxxk 状态				
		case path_back:{ path_state_return = path_back; break; }						// 保持 path_back 状态
		default: break;
	}
	// 记录箱子状态前最后一次赛道状态
	if(path_state == common_path || path_state == R_circle || path_state == L_circle){
		last_path_state = path_state;
	}
	
	return path_state_return;
}

/* 对称法矫正初始化 */
void symmetry_rectificate_init(void)
{
	sum_weight = 0;
	for(int X = MT9V03X_W/2;X >= 0;X--)
	{
		for(int Y = symmetry_rectificate_end_y;Y < symmetry_rectificate_start_y;Y++)
		{
			if(MT9V03X_W/2-X >= 0 && MT9V03X_W/2-X < MT9V03X_W/8)	
				sum_weight += rectificate_weight[0];
			else if(MT9V03X_W/2-X >= MT9V03X_W/8 && MT9V03X_W/2-X < 2*MT9V03X_W/8)	
				sum_weight += rectificate_weight[1];
			else if(MT9V03X_W/2-X >= 2*MT9V03X_W/8 && MT9V03X_W/2-X < 3*MT9V03X_W/8)	
				sum_weight += rectificate_weight[2];
			else 
				sum_weight += rectificate_weight[3];			
		}
	}
}

/* 对称法矫正 */
void symmetry_rectificate(uint8 input[MT9V03X_H][MT9V03X_W])
{
	// 对称法矫正权重和
	uint32 sum_weight_rectificate = 0;
	// 左右图像边框白色点数量
	int16 L_white_num = 0;
	int16 R_white_num = 0;
	
	for(int X = MT9V03X_W/2;X >= 0;X--)
	{
		for(int Y = symmetry_rectificate_end_y;Y < symmetry_rectificate_start_y;Y++)
		{
			if(input[Y][X] == input[Y][MT9V03X_W-1-X])
			{
				if(MT9V03X_W/2-X >= 0 && MT9V03X_W/2-X < MT9V03X_W/8)	
					sum_weight_rectificate += rectificate_weight[0];
				else if(MT9V03X_W/2-X >= MT9V03X_W/8 && MT9V03X_W/2-X < 2*MT9V03X_W/8)	
					sum_weight_rectificate += rectificate_weight[1];
				else if(MT9V03X_W/2-X >= 2*MT9V03X_W/8 && MT9V03X_W/2-X < 3*MT9V03X_W/8)	
					sum_weight_rectificate += rectificate_weight[2];
				else 
					sum_weight_rectificate += rectificate_weight[3];			
			}
		}
	}
	for(int Y = symmetry_rectificate_end_y;Y < symmetry_rectificate_start_y;Y++)
	{
		if(input[Y][frame_offset] == 255)
			L_white_num++;
		if(input[Y][MT9V03X_W-1-frame_offset] == 255)
			R_white_num++;
	}
	sum_weight_normalization = (float)sum_weight_rectificate/(float)sum_weight;
	frame_white_num_normalization[0] = (float)L_white_num/(float)(symmetry_rectificate_start_y-symmetry_rectificate_end_y+1);
	frame_white_num_normalization[1] = (float)R_white_num/(float)(symmetry_rectificate_start_y-symmetry_rectificate_end_y+1);
}