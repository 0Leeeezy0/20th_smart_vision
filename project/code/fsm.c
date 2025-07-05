#include "common.h"
#include "data.h"

/* 状态机 */
void fsm(void){
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
	// 状态切换
	switch(path_state){
		case L_circle_in:{ 
			circle_euler_angle_solve.solve_flag = True;
			// 设置控制类型
			control_kind = Inv2Speed; 
			// 设置解算类型
			move_solve_kind = XY_SPEED_SOLVE;
			// 设置目标速度
			x_speed_target = 0;
			y_speed_target = circle_y_speed_target;
			angular_speed_target = -circle_angular_speed_target;
			// 判断是否转到指定角度
			if(fabsf(circle_euler_angle_solve.yaw) >= circle_angle_target)
			{
				circle_euler_angle_solve.solve_flag = False;	// 关闭圆环欧拉角解算
				circle_in_timer.ticking_flag = True;			// 开启进环计时器
				// 设置转动完成后的目标速度
				x_speed_target = 0;
				y_speed_target = 0;
				angular_speed_target = 0;
				path_state = L_circle;
			}
			break; 
		}
		case L_circle_out:{ 
			circle_euler_angle_solve.solve_flag = True;
			// 设置控制类型
			control_kind = Inv2Speed; 
			// 设置解算类型
			move_solve_kind = XY_SPEED_SOLVE;
			// 设置目标速度
			x_speed_target = 0;
			y_speed_target = circle_y_speed_target;
			angular_speed_target = -circle_angular_speed_target;
			// 判断是否转到指定角度
			if(fabsf(circle_euler_angle_solve.yaw) >= circle_angle_target)
			{
				circle_euler_angle_solve.solve_flag = False;	// 关闭圆环欧拉角解算
				circle_out_timer.ticking_flag = True;			// 开启出环计时器
				// 设置转动完成后的目标速度
				x_speed_target = 0;
				y_speed_target = 0;
				angular_speed_target = 0;
				path_state = common_path;
			}
			break; 
		}
		case R_circle_in:{ 
			circle_euler_angle_solve.solve_flag = True;
			// 设置控制类型
			control_kind = Inv2Speed; 
			// 设置解算类型
			move_solve_kind = XY_SPEED_SOLVE;
			// 设置目标速度
			x_speed_target = 0;
			y_speed_target = circle_y_speed_target;
			angular_speed_target = circle_angular_speed_target;
			// 判断是否转到指定角度
			if(fabsf(circle_euler_angle_solve.yaw) >= circle_angle_target)
			{
				circle_euler_angle_solve.solve_flag = False;	// 关闭圆环欧拉角解算	
				circle_in_timer.ticking_flag = True;			// 开启进环计时器
				// 设置转动完成后的目标速度
				x_speed_target = 0;
				y_speed_target = 0;
				angular_speed_target = 0;
				path_state = R_circle;
			}
			break; 
		}
		case R_circle_out:{ 
			circle_euler_angle_solve.solve_flag = True;
			// 设置控制类型
			control_kind = Inv2Speed; 
			// 设置解算类型
			move_solve_kind = XY_SPEED_SOLVE;
			// 设置目标速度
			x_speed_target = 0;
			y_speed_target = circle_y_speed_target;
			angular_speed_target = circle_angular_speed_target;
			// 判断是否转到指定角度
			if(fabsf(circle_euler_angle_solve.yaw) >= circle_angle_target)
			{
				circle_euler_angle_solve.solve_flag = False;	// 关闭圆环欧拉角解算
				circle_out_timer.ticking_flag = True;			// 开启出环计时器
				// 设置转动完成后的目标速度
				x_speed_target = 0;
				y_speed_target = 0;
				angular_speed_target = 0;
				path_state = common_path;
			}
			break; 
		}
		default: break;
	}
	// 循线误差计算
	if(path_state == L_circle || path_state == R_circle)
		path_err = dog_path.path[control_point[1]][0]-MT9V03X_W/2;
	else
		path_err = dog_path.longest_white_col_x-MT9V03X_W/2;
	// 循线控制
	if(path_state == common_path || path_state == L_circle || path_state == R_circle || path_state == zebra_path){
		path_pid_calc();
		y_speed_target = path_y_speed_target;
	}
}

/* 赛道状态判断 */
static _path_state_ path_state_judge(uint8 input[MT9V03X_H][MT9V03X_W]){
	_path_state_ path_state_return = common_path;
	
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
			if(circle_out_timer.time >= 1000){	// 出环计时器计时超过 1s 可切换入环状态
				path_state_return = R_circle_in;
				circle_in_timer.ticking_flag = True;
				circle_out_timer.ticking_flag = False;
			}
		}
		// 右圆环出环
		else if(circle_check[1] == MT9V03X_W-1 && path_state == R_circle)
		{
			if(circle_in_timer.time >= 1000){	// 入环计时器计时超过 1s 可切换出环状态
				path_state_return = R_circle_out;
				circle_in_timer.ticking_flag = False;
				circle_out_timer.ticking_flag = True;
			}
		}
		// 左圆环入环
		// 1.赛道已经在图像边界；2.入环对侧边线弯点小于一定阈值；3.入环对侧边线在图像边缘的数量/总数量小于一定阈值（防止十字误判）；4.入环对侧的相邻边线X坐标差值小于一定阈值（防止十字误判）；5.入环侧的相邻边线X坐标差值大于一定阈值（防止十字误判）
		else if(circle_check[0] == 0 && dog_path.R_bend_point_num <= 3 && ((float)dog_path.R_frame_point_num/(float)dog_path.R_side_point_num) <= 0.15 && R_side_X_delta_max <= side_x_delta_range[0] && L_side_X_delta_max >= side_x_delta_range[1] && path_state == common_path)
		{
			if(circle_out_timer.time >= 1000){	// 出环计时器计时超过 1s 可切换入环状态
				path_state_return = L_circle_in;
				circle_in_timer.ticking_flag = True;
				circle_out_timer.ticking_flag = False;
			}
		}
		// 左圆环出环
		else if(circle_check[0] == 0 && path_state == L_circle)
		{
			if(circle_in_timer.time >= 1000){	// 入环计时器计时超过 1s 可切换出环状态
				path_state_return = L_circle_out;
				circle_in_timer.ticking_flag = False;
				circle_out_timer.ticking_flag = True;
			}
		}
		
	}
	// 斑马线判断
	if(zebra_enable_flag == True){
		uint16 black_white_point_num = 0;	// 黑白跳变点数量
		if(zebra_path_timer.time >= 5000)
		{
			for(int X = 0;X < MT9V03X_W-1;X++)
			{
				if((dog_cv.image_OTSU[MT9V03X_H-10][X] == 255 && dog_cv.image_OTSU[MT9V03X_H-10][X+1] == 0) || (dog_cv.image_OTSU[MT9V03X_H-10][X] == 0 && dog_cv.image_OTSU[MT9V03X_H-10][X+1] == 255))
				{
					black_white_point_num++;
				}
			}
			if(black_white_point_num >= 10)
			{
				path_state_return = zebra_path;
			}
		}
	}
	// 赛道状态保持
	switch(path_state){
		case R_circle_in:{ path_state_return = R_circle_in; break; }
		case L_circle_in:{ path_state_return = L_circle_in; break; }
		case R_circle:{ if(path_state_return != R_circle_out)path_state_return = R_circle; break; }	// 由于保持 R_circle 状态会导致无法切换成 R_circle_out 状态，因此需要加上限制
		case L_circle:{ if(path_state_return != L_circle_out)path_state_return = L_circle; break; }	// 由于保持 L_circle 状态会导致无法切换成 L_circle_out 状态，因此需要加上限制
		case R_circle_out:{ path_state_return = R_circle_out; break; }
		case L_circle_out:{ path_state_return = L_circle_out; break; }
	}
	return path_state_return;
}