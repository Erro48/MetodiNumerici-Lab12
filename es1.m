% pagina virtuale esercitazione https://virtuale.unibo.it/mod/folder/view.php?id=899825
clc
clear all

% Nodi di interpolazione
L = [-55:10:65];
T = [3.7 3.7 3.52 3.27 3.2 3.15 3.15 3.25 3.47 3.52 3.65 3.67 3.52];

% Costruziamo il vettore xv in cui valutare il polinomio interpolante
xv = linspace(min(L), max(L), 200);
[yv, a] = interpNewton(L, T, xv);

figure
plot(L, T, 'r*', xv, yv, 'b')

L1 = 42;
L2 = -L1;
[pvalL1] = pvalHornerNewton(a, L, L1);
[pvalL2] = pvalHornerNewton(a, L, L2);

hold on
plot(L1, pvalL1, 'go', L2, pvalL2, 'mo')
legend('Nodi', 'Polinomio', 'L1=42', 'L2=-42', 'Location', 'southwest')


