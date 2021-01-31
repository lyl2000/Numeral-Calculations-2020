function [t,w] = TrapezoidalPredictorCorrector(a,b,N,alpha,f)
% 梯形预估修正格式
h = (b - a) / N;
t = zeros(N+1, 1);
w = zeros(N+1, 1);
t(1) = a; w(1) = alpha;
for iter = 1:N
    t(iter+1) = a + iter * h;
    w(iter+1) = w(iter) + h/2*(f(t(iter),w(iter))+f(t(iter+1),w(iter)+h*f(t(iter),w(iter))));
end
end