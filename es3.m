clc
clear all

a = -1;
b = -a;
xv = linspace(a, b, 200);
CL = zeros(1, 4);
i = 1;

for n = 5:5:20
   Le = zeros(1, 200);
   xe = linspace(a, b, n+1);
   
   for k = 1:n+1
       pe = pLagrange(xe, k);
       Le = Le + abs(polyval(pe, xv));
   end
   
   CL(i) = max(Le);
   i = i + 1;
end

figure
semilogy(5:5:20, CL)