% 参数设置
targetSpeed = 10;          % 目标速度
initialSpeed = 0;          % 初始速度
smoothFactor = 0.2;        % 平滑因子 (0 < smoothFactor < 1)
simTime = 5;               % 仿真时间 (秒)
dt = 0.01;                 % 时间步长 (秒)
time = 0:dt:simTime;       % 时间向量

% 初始化
currentSpeed = initialSpeed * ones(size(time));

% 指数平滑计算
for i = 2:length(time)
    currentSpeed(i) = currentSpeed(i-1) + smoothFactor * (targetSpeed - currentSpeed(i-1));
end

% 绘图
figure;
plot(time, currentSpeed, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed');
title('Exponential Smoothing (1st Order)');
grid on;
hold on;
yline(targetSpeed, '--r', 'Target Speed');
legend('Actual Speed', 'Target Speed');