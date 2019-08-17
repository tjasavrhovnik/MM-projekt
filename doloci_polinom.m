function A = doloci_polinom(x1,y1,x2,y2)
% Program doloci parametre kubicnega polinoma
% skozi tocke T1=(x1,y1), T2=(x2,y2), T3=T1+1/2(T2-T1),
% po katerem kroglica potuje najhitreje. (x1<x2, y1>y2)
% p(x)=ax^3+bx^2+cx+d

% gravitacijski pospesek
g = 9.8;

% Tocke prestavimo tako, da je T1=(0,0),
% T2=(x2-x1,y2-y1), T3=1/2*T2.

% Izrazimo koeficiente polinoma (3 tocke - en prost parameter).
b = @(a) -3/2*a*(x2-x1);
c = @(a) (y2-y1)/(x2-x1) + 1/2*a*(x2-x1)^2;
d = 0;

% polinom in odvod
p = @(x,a) a.*x^3 + b.*x^2 + c.*x + d;
dp = @(x,a) 3*a.*x^2 + 2*b.*x + c;


% Cas potovanja po krivulji podaja funkcija T(a).
% Integriramo funkcijo f (2 spremenljivki),
% f = @(x,a) sqrt((1+dp.^2)./(-2*g.*p)),
% po x-u v mejah od 0 do x2-x1.

% 1. nacin
% f = @(a) (@(x) sqrt.((1+dp.^2)./(-2*g.*p)));
%
% syms x a
% T = @(a) int(f, x, 0, x2-x1);

% 2. nacin
syms x a
f = sqrt((1+dp.^2)./(-2*g.*p));
T = @(a) int(f,x,0,x2-x1);


% Minimiziramo cas potovanja
A = fminsearch(T, 0);