% Program narise kubicni polinom skozi tocke T1, T2, T3.

% Izberemo koordinate tock na krivulji, npr.:
x1 = 1;
y1 = 5;
x2 = 7;
y2 = 2;

% gravitacijski pospesek
g = 9.8;

% Izberemo parameter a.
% a = doloci_polinom(x1,y1,x2,y2);
a = -0.05;

% Izracunamo ostale koeficiente polinoma preko a.
b = @(a) -3/2*a*(x2-x1);
c = @(a) (y2-y1)/(x2-x1) + 1/2*a*(x2-x1)^2;
d = 0;

% Polinom, kjer so tocke prestavljene, da je T1=(0,0).
p = @(x) a.*x.^3+b(a).*x.^2+c(a).*x+d;

% Transliran polinom skozi T1, T2, T3 iz podatkov (ta nas zanima).
r = @(x) a.*(x-x1).^3+b(a).*(x-x1).^2+c(a).*(x-x1)+d+y1;
r(x1); % preverimo, da so vrednosti res y1 oz. y2
r(x2);

% Narisemo oba polinoma, na drugo sliko pa iskani polinom in brahistohrono:
hold on
t = linspace(0,x2,100);
plot(t,p(t), '--')
plot(t,r(t))
hold off

figure

hold on
s = linspace(x1,x2,100);
plot(s,r(s))
risi_brah([x1 y1],[x2 y2])
hold off

% Cas potovanja izracunamo za polinom p (saj je v celoti pod x-osjo),
% sicer pa sta casa potovanja enaka.
dp = @(x) 3*a.*x.^2+2*b(a).*x+c(a);
f = @(x) sqrt((1+dp(x).^2)./(-2*g.*p(x)));
t_polinom = integral(f,0,x2-x1)

% Cas potovanja po brahistohroni in premici skozi T1 in T2.
[t_brahistohrona,t_premica] = cas_brahi([x1 y1],[x2 y2])