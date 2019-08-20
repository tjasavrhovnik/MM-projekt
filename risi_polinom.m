% Uporabnik graficno izbere dve tocki v koordinatnem sistemu.
% Program doloci koeficiente kubicnega polinoma skozi izhodisce,
% ki minimizira cas potovanja kroglice.
% Nato doloci polinom skozi tocke T1, T2, T3 iz podatkov.
% Narise oba polinoma.
% Izracuna cas potovanja po iskanem polinomu, ter za primerjavo
% cas potovanja po premici in brahistohroni. Narise graf polinoma
% in brahistohrono.

% Graficni vnos tock na krivulji:
[x,y] = ginput(2);
% Koordinate pomnozimo z 10, saj ginput izbira na [0,1]. Izpisemo
% izbrani tocki T1 in T2.
x1 = x(1)*10; 
y1 = y(1)*10;
x2 = x(2)*10;
y2 = y(2)*10;
T1 = [x1,y1]
T2 = [x2, y2]

% gravitacijski pospesek
g = 9.8;

% Dolocimo parameter a.
a = doloci_polinom(x1,y1,x2,y2);

% Izracunamo ostale koeficiente polinoma (skozi izhodisce) preko a.
b = @(a) -3/2*a*(x2-x1);
c = @(a) (y2-y1)/(x2-x1) + 1/2*a*(x2-x1)^2;
d = 0;

% Polinom, kjer so tocke prestavljene, da je T1=(0,0).
p = @(x) a.*x.^3+b(a).*x.^2+c(a).*x+d;

% Transliran polinom skozi T1, T2, T3 iz podatkov (ta nas zanima).
r = @(x) a.*(x-x1).^3+b(a).*(x-x1).^2+c(a).*(x-x1)+d+y1;
r(x1); % preverimo, da so vrednosti res y1 oz. y2
r(x2);

% SLIKE
% Na prvi sliki sta polinoma skozi izhodisce in polinom skozi T1, T2, T3, 
% ter oznacene tocke, ki polinoma dolocajo.
hold on
t = linspace(0,x2,100);
plot(0, 0, 'x', 'color','k')
plot(x2-x1, y2-y1, 'x', 'color','k')
plot((x2-x1)/2, (y2-y1)/2, 'x', 'color','k')
plot(x1, y1, 'x', 'color','k')
plot(x2, y2, 'x', 'color','k')
plot((x1+x2)/2, (y1+y2)/2, 'x', 'color','k')
plot(t,p(t), '--')
plot(t,r(t))
grid on
hold off

figure

% Na drugi sliki sta iskan polinom, brahistohrona in tocke T1, T2, T3.
hold on
s = linspace(x1,x2,100);
plot(x1, y1, 'x', 'color','k')
plot(x2, y2, 'x', 'color','k')
plot((x1+x2)/2, (y1+y2)/2, 'x', 'color','k')
plot(s,r(s), 'r')
risi_brahi([x1 y1],[x2 y2])
hold off

% CAS POTOVANJA
% Cas potovanja izracunamo za polinom p (saj je v celoti pod x-osjo),
% sicer pa sta casa potovanj po obeh polinomih enaka.
dp = @(x) 3*a.*x.^2+2*b(a).*x+c(a);
f = @(x) sqrt((1+dp(x).^2)./(-2*g.*p(x)));
t_polinom = integral(f,0,x2-x1)

% Cas potovanja po brahistohroni in premici skozi T1 in T2.
[t_brahistohrona,t_premica] = cas_brahi([x1 y1],[x2 y2])