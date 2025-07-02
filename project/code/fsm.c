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
	
	
}

/* 赛道状态判断 */
_path_state_ path_state_judge(uint8 input[MT9V03X_H][MT9V03X_W]){
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
		
	}
	// 斑马线判断
	if(zebra_enable_flag == True){
		
	}
}