function risi_brahi(T1,T2)
% RISI_BRAH narise brahistohrono med tockama T1 in T2.
% Pri tem parameter theta lezi na intervalu [0,theta0],
% kjer je theta0 dobljena s funkcijo isci_theta.

% najprej prestavimo, da je T1(0,0)
b = T2(1)-T1(1);
B = T2(2)-T1(2);
[k,theta0] = isci_theta(b,B);

% theta0 doloca interval risanja, k obliko krivulje
theta = linspace(0,theta0,100);

% premaknemo brahistohrono v lego (T1, T2)
x = 1/2*k^2*(theta-sin(theta)) + T1(1);
y = -1/2*k^2*(1-cos(theta)) + T1(2);

% risanje
hold on
plot(x,y,'b');

grid on
axis equal

end