% µÚ8ÕÂ µÚ1Ìâ
x = [-2, -1, 0, 1, 2];
y = [0, 1, 2, 1, 0];
scatter(x, y);
hold on;
x1 = sum(x);%sigma x
x2 = sum(x.^2);%sigma x^2
x3 = sum(x.^3);%sigma x^3
x4 = sum(x.^4);%sigma x^4
y1 = sum(y);%sigma y
x2y1 = sum(x.^2.*y);%sigma x^2 * y
x1y1 = sum(x.*y);%sigma x * y
de = ((5*x2-x1^2)*(5*x4-x2^2)-(5*x3-x2*x1)*(5*x3-x1*x2));
a = ((5*x2y1-x2*y1)*(5*x2-x1^2)-(5*x1y1-x1*y1)*(5*x3-x2*x1)) / de;
b = ((5*x1y1-x1*y1)*(5*x4-x2^2)-(5*x2y1-x2*y1)*(5*x3-x1*x2)) / de;
c = (y1-a*x2-b*x1) / 5;
plot(-2:0.1:2, a*(-2:0.1:2).^2+b*(-2:0.1:2)+c);