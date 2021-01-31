function [mu,x,k] = InversePowerMethod(n,A,x,tol,N)
% ·´ÃÝ·¨
mu = zeros(N, 1);
q = (x' * A * x) / (x' * x);
k = 1;
[v, p] = max(abs(x));
x = x ./ x(p);
while k <= N
    [L, U, y] = LUDecomposition(n, A - q * eye(n), x);
    mu(k) = y(p);
    [v, p] = max(abs(y));
    err = max(abs(x - y ./ y(p)));
    x = y ./ y(p);
    if err < tol
        plot(1:k, 1 ./ mu(1:k) + q);
        mu = 1 / mu(k) + q;
        return;  % STOP
    end
    k = k + 1;
end
if k > N
    plot(1:N, 1 ./ mu(1:N) + q);
    k = N; mu = 1 / mu(N) + q;
    disp(err)
    disp('Maximum number of iterations exceeded.Procedure InversePowerMethod completed unsuccessfully');
end
end