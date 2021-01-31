% ตฺ5ีย ตฺ2ฬโ
mu = 1;  % [0.01, 0.1, 1]
f = {@(t, w)(w(2)), @(t, w)(mu*(1-w(1)*w(1))*w(2)-w(1))};
a = 0; b = 300; m = 2; N = 10000; alpha = [1, 0];
w = RungeKutta2(a,b,m,N,alpha,f);
plot(a:(b-a)/N:b, w(:, 1)');