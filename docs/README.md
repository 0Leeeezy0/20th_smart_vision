# <i>20届智能视觉组</i>
# <b>鹭岛躺赢狗队</b>

# <b>工程文件简述</b>
## <b>DOG库</b>
| 文件名 | 简述 |
|:-:|:-:|
| <b>code/DOG_cv.c(h)<b> | 机器视觉：图像处理 |
| <b>code/DOG_filter.c(h)<b> | 滤波器（卡尔曼、低通） |
| <b>code/DOG_menu.c(h)<b> | 菜单 |
| <b>code/DOG_motor.c(h)<b> | 电机 |
| <b>code/DOG_path.c(h)<b> | 循线（八邻域、最长白列、中线） |
| <b>code/DOG_pid.c(h)<b> | PID控制器 |
| <b>code/DOG_sensor.c(h)<b> | 传感器 |
| <b>code/DOG_solve.c(h)<b> | 解算（欧拉角、运动学正/逆解算） |
| <b>code/DOG_timer.c(h)<b> | 计时器 |
| <b>code/DOG_vofa.c(h)<b> | VOFA协议 |
| <b>code/DOG_data.h<b> | DOG库变量类型 |

## <b>USER库</b>
| 文件名 | 简述 |
|:-:|:-:|
| <b>code/ai.c(h)<b> | AI摄像头 |
| <b>code/control.c(h)<b> | 控制（角度环、方向环、速度环、箱子定位） |
| <b>code/fsm.c(h)<b> | 状态机 |
| <b>code/menu.c(h)<b> | 菜单 |

# <b>工程结构简述</b>
![工程结构](./工程结构.jpg) 
## 状态机简述
| 状态名 | 简述 | 切换关系 |
|:-:|:-:|:-:|
| <b>common_path(普通赛道)</b> | 普通赛道状态，直道/弯道循迹 | 无 |
| <b>L_circle_in(左圆环入环)/<b> | 左圆环入环状态，向左入环 | 满足入环条件，<b>common_path->L_circle_in</b>，完成入环后切换至<b>L_circle</b> |
| <b>L_circle(左圆环内)</b> | 左圆环内状态 | 无 |
| <b>L_circle_out(左圆环出环)</b> | 左圆环出环状态，向左出环 | 满足出环条件，<b>L_circle->L_circle_out</b>，完成出环后切换至<b>common_path</b> |
| <b>R_circle_in(左圆环入环)</b> | 右圆环入环状态，向右入环 | 满足入环条件，<b>common_path->R_circle_in</b>，完成入环后切换至<b>R_circle</b> |
| <b>R_circle(左圆环内)</b> |  右圆环内状态| 无 |
| <b>R_circle_out(左圆环出环)</b> | 右圆环出环状态，向右出环 | 满足出环条件，<b>R_circle->R_circle_out</b>，完成出环后切换至<b>common_path</b> |
| <b>zebra_path(斑马线赛道)</b> | 斑马线赛道状态 | 识别到斑马线后，<b>common_path->zebra_path</b>，记录当前位置相对于出发点路程 |
| <b>zebra_path_stop(斑马线赛道停车)</b> | 斑马线停车状态 | 当前位置相对于出发点路程-<b>zebra_path</b>记录的路程超过阈值，<b>zebra_path->zebra_path_stop</b>，停车 |
| <b>box_first_track(箱子一次定位)</b> | 箱子一次定位状态，第一次看到箱子后贴近箱子 | 识别到箱子后，若满足范围条件，<b>common_path->box_first_track</b>或<b>L/R_circle->box_first_track</b>并记录切换前的状态，否则返回切换前的状态 |
| <b>box_calibration(箱子矫正)</b> | 箱子矫正状态 | <b>box_first_track</b>定位完成后，<b>box_first_track->box_calibration</b>进行对称法矫正，对称度超过阈值则切换至<b>box_second_track</b>,若不满足则切换至<b>box_inv_calibration</b> |
| <b>box_inv_calibration(箱子逆矫正)</b> | 箱子逆矫正状态，反转 | 反转回<b>box_calibration</b>状态时记录的对称度最大处，转动完成后，切换至<b>box_second_track</b> |
| <b>box_second_track(箱子二次定位)</b> | 箱子二次定位状态，对正箱子 | 对正箱子，对正完成后切换至<b>box_fxxk</b> |
| <b>box_fxxk(推箱子)</b> | 推箱子状态，将箱子推出界 | 推离箱子，推离完成后，记录相对于出发点的路程，切换至<b>path_back</b> |
| <b>path_back(返回赛道)</b> | 返回赛道状态，向后倒车，旋转90度 | 倒车，当前位置相对于出发点路程-<b>box_fxxk</b>记录的路程超过阈值，停车，旋转90度正对赛道，切换至<b>box_first_track</b>中记录的切换前的状态 |

## 日志
| 日期 | 工作内容 |
| :---: | :--- |
| <i><b>2025.7.9 | 1.完成除菜单外所有功能开发<br>2.添加箱子定位时的旋转 |
| <i><b>2025.7.10 | 1.删除箱子定位时的旋转<br>2.重构完毕，菜单移植 |

# [<font color=#0b88bb>🐧要做一辈子嵌入式开发!!!!!🐧</font>](https://github.com/Geek-Egret)