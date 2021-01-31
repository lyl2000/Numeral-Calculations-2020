% ตฺ5ีย ตฺ1ฬโ
f = @(t,y)(1 + y ^ 2);
a = 0; b = 1.55; N = 50; alpha = 0;
[t,w] = EulerMethod(a,b,N,alpha,f);
scatter(t, w, 'r');
hold on;
[t,w] = TrapezoidalPredictorCorrector(a,b,N,alpha,f);
scatter(t, w, 'b');
hold on;
[t,w] = RungeKuttaOrder4(a,b,N,alpha,f);
scatter(t, w, 'g');
hold on;
s = @(t)(tan(t));
t = a:(b-a)/(N*100):b;
w = s(t);
plot(t, w);
legend('Euler Method', 'Trapezoidal Predictor-Corrector', 'Runge-Kutta Order 4', 'y(x)', 'Location','northwest');