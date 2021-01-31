function [t,w] = AdamsFourthOrderPredictorCorrector(a,b,N,alpha,f)
% Adams4½×Ô¤¹ÀÐÞÕý¸ñÊ½
t = zeros(N+1, 1);
w = zeros(N+1, 1);
h = (b - a) / N;
t(1) = a; w(1) = alpha;
for iter = 1:3
    K1 = h * f(t(iter), w(iter));
    K2 = h * f(t(iter) + h / 2, w(iter) + K1 / 2);
    K3 = h * f(t(iter) + h / 2, w(iter) + K2 / 2);
    K4 = h * f(t(iter) + h, w(iter) + K3);
    w(iter + 1) = w(iter) + (K1 + 2 * K2 + 2 * K3 + K4) / 6;
    t(iter + 1) = a + iter * h;
end
t0 = t(1); t1 = t(2); t2 = t(3); t3 = t(4);
w0 = w(1); w1 = w(2); w2 = w(3); w3 = w(4);
for iter = 4:N
    t(iter + 1) = a + iter * h;
    % predict
    w(iter + 1) = w3 + h * (55 * f(t3, w3) - 59 * f(t2, w2) + 37 * f(t1, w1) - 9 * f(t0, w0));
    % correct
    w(iter + 1) = w3 + h * (9 * f(t(iter+1), w(iter+1)) + 19 * f(t3, w3) - 5 * f(t2, w2) + f(t1, w1)) / 24;
    t0 = t1; t1 = t2; t2 = t3; t3 = t(iter + 1);
    w0 = w1; w1 = w2; w2 = w3; w3 = w(iter + 1);    
end
end