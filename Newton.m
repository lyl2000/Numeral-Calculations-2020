function [iter,x] = Newton(f,g,p0,tol,N)
% 牛顿法
iter = 1;
x = zeros(N, 1);
while iter <= N
    x(iter) = p0 - f(p0) / g(p0);
    if abs(x(iter) - p0) < tol
        plot(1:iter, x(1:iter));
        xlabel("迭代次数");
        ylabel("根");
        x = x(iter);
        return;  % STOP
    end
    p0 = x(iter);
    iter = iter + 1;
end
disp("the method failed after N iterations");
end