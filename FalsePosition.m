function [iter,x] = FalsePosition(f,a,b,tol,N)
% ��λ��
iter = 2;
y0 = f(a);
y1 = f(b);
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
    y = f(x(iter));
    if y * y1 < 0
        a = b;
        y0 = y1;
    end
    b = x(iter);
    y1 = y;
    iter = iter + 1;
end
disp("Method failed after N iterations");
end