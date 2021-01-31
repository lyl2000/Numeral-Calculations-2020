function [iter,p] = Bisection(f,a,b,tol,N)
% 二分法
    iter = 1;
    fa = f(a);
    p = zeros(N, 1);
    while iter <= N
        p(iter) = a + (b - a) / 2;
        fp = f(p(iter));
        if fp == 0 || (b - a) / 2 < tol
            plot(1:iter, p(1:iter));
            xlabel("迭代次数");
            ylabel("根");
            p = p(iter);
            return;  % STOP
        end
        if fa * fp > 0
            a = p(iter);fa = fp;
        else
            b = p(iter);
        end
        iter = iter + 1;
    end
    disp("Method failed after N iterations");
end