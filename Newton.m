function [iter,x] = Newton(f,g,p0,tol,N)
% ţ�ٷ�
iter = 1;
x = zeros(N, 1);
while iter <= N
    x(iter) = p0 - f(p0) / g(p0);
    if abs(x(iter) - p0) < tol
        plot(1:iter, x(1:iter));
        xlabel("��������");
        ylabel("��");
        x = x(iter);
        return;  % STOP
    end
    p0 = x(iter);
    iter = iter + 1;
end
disp("the method failed after N iterations");
end