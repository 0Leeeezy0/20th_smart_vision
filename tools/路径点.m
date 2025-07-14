% 读取CSV文件
data = readtable('C:\Users\18750\Desktop\vofa+5.csv');  % 替换为你的文件路径
x = data.I0;
y = data.I1;
imu = data.I2;  % 航向角（角度制）

% 绘制点云图
figure;
scatter(x, y, 40, 'filled', 'MarkerFaceColor', [0.2 0.6 0.9], 'MarkerEdgeColor', 'k');
% hold on;  % 保持图形，继续绘制箭头
% 
% % 为每个点绘制航向箭头
% arrow_length = 0.5;  % 箭头长度（根据数据范围调整）
% for i = 1:length(x)
%     % 将角度转换为弧度，并计算方向分量
%     theta_rad = deg2rad(imu(i));
%     u = arrow_length * sin(theta_rad);  % Y方向分量
%     v = arrow_length * cos(theta_rad);  % X方向分量
% 
%     % 使用quiver绘制箭头
%     quiver(x(i), y(i), u, v, 0, 'LineWidth', 1.5, 'Color', 'r', 'MaxHeadSize', 0.5);
% end

% 图形修饰
xlabel('X坐标');
ylabel('Y坐标');
title('二维点云图与航向箭头（IMU角度）');
grid on;
axis equal;  % 等比例坐标轴
hold off;

% 保存图像（可选）
saveas(gcf, 'point_cloud_with_imu_arrows.png');