clc
clear all

n = input('Grado del polinomio interpolatore: ')

% Funzioni
% f = @(x) sin(x) - 2*sin(2*x); a = -pi;
% f = @(x) sinh(x); a = -2;
% f = @(x) abs(x); a = -1;
f = @(x) 1 ./ (1 + x.^2); a = -5;

b = -a;


xv = linspace(a, b, 200);   % punti in cui valutare il polinomio interpolatore

xeq = linspace(a, b, n+1);
yeq = f(xeq);

xCheb = zeros(1, n+1);
for i=1:n+1
    xCheb(i) = (a + b)/2 + (b - a)/2 * cos((2*i - 1)*pi/(2*(n + 1)));
end
yCheb = f(xCheb);
    
[poleq, coeffeq] = interpNewton(xeq, yeq, xv);
[polCheb, coeffCheb] = interpNewton(xCheb, yCheb, xv);

figure
plot(xeq, yeq, 'r*', xv, poleq, 'g-', xv, f(xv))
legend('x', 'pol eq', 'funzione')

figure
plot(xCheb, yCheb, 'r*', xv, polCheb, 'k-', xv, f(xv))
legend('x', 'pol Cheb', 'funzione')

erreq = f(xv) - poleq';
errCheb = f(xv) - polCheb';
figure
plot(xv, erreq, xv, errCheb)
legend('Err eq', 'Err Cheb')







