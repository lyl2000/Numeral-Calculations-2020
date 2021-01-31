function [t,w] = RungeKuttaOrder4(a,b,N,alpha,f)
% 4½×Áú¸ñ¿âËş·½·¨
h = (b - a) / N;
t = zeros(N+1, 1);
w = zeros(N+1, 1);
t(1) = a; w(1) = alpha;
for iter = 1:N
    K1 = h * f(t(iter), w(iter));
    K2 = h * f(t(iter) + h/2, w(iter) + K1/2);
    K3 = h * f(t(iter) + h/2, w(iter) + K2/2);
    K4 = h * f(t(iter) + h, w(iter) + K3);
    w(iter+1) = w(iter) + (K1 + 2*K2 + 2*K3 + K4) / 6;
    t(iter+1) = a + iter * h;
end
end