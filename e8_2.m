% µÚ8ÕÂ µÚ2Ìâ
x = [0, 1, 2, 4];
y = [2.010, 1.210, 0.740, 0.450];
scatter(x, y);
hold on;
lny = log(y);
alpha = (4*sum(x.*lny)-sum(x)*sum(lny)) / (4*sum(x.^2)-sum(x)^2);
beta = (sum(x.^2)*sum(lny)-sum(x.*lny)*sum(x)) / (4*sum(x.^2)-sum(x)^2);
a = exp(beta); b=-alpha;
plot(0:0.1:4, a*exp(-b*(0:0.1:4)));