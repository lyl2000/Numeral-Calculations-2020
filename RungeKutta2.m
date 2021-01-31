function [w] = RungeKutta2(a,b,m,N,alpha,f)
% 微分方程组的Runge_Kutta方法
h = (b - a) / N;
t = a;
w = zeros(N+1, m);
for i = 1:m
    w(1, i) = alpha(i);  % 初值条件
end
for i = 1:N-1
    k1 = zeros(m, 1); k2 = zeros(m, 1); k3 = zeros(m, 1); k4 = zeros(m, 1);
    for j = 1:m
        k1(j) = h * f{j}(t, w(i, :)');
    end
    for j = 1:m
        k2(j) = h * f{j}(t+h/2, w(i, :)'+k1/2);
    end
    for j = 1:m
        k3(j) = h * f{j}(t+h/2, w(i, :)'+k2/2);
    end
    for j = 1:m
        k4(j) = h * f{j}(t+h, w(i, :)'+k3);
    end
    for j = 1:m
        w(i+1, j) = w(i, j) + (k1(j)+2*k2(j)+2*k3(j)+k4(j)) / 6;
    end
    t = t + h;
end
end