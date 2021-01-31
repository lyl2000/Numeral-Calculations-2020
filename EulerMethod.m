function [t,w] = EulerMethod(a,b,N,alpha,f)
% ≈∑¿≠œ‘∏Ò Ω
h = (b - a) / N;
t = zeros(N+1, 1);
w = zeros(N+1, 1);
t(1) = a; w(1) = alpha;
for iter = 1:N
    w(iter+1) = w(iter) + h * f(t(iter), w(iter));
    t(iter+1) = a + iter * h;
end
end