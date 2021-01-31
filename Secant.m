function [iter,x] = Secant(f,a,b,tol,N)
% ���߷�
iter = 2;
y0 = f(a); y1 = f(b);
x = zeros(N, 1);
while iter <= N
    x(iter) = b - y1 * (b - a) / (y1 - y0);
    if abs(x(iter) - b) < tol
        plot(1:iter, x(1:iter));
        xlabel("��������");
        ylabel("��");
        x = x(iter);
        return;  % STOP
    end
    a = b;
    y0 = y1;
    b = x(iter);
    y1 = f(x(iter));
    iter = iter + 1;
end
disp("the method failed after N iterations");
end

