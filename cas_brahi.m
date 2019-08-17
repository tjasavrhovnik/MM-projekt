function [t_b,t_p] = cas_brahi(T1,T2)
% Izracuna cas potovanja po brahistohroni in
% po premici med danima tockama.
g = 9.8;
b = T2(1) - T1(1);
B = T2(2) - T1(2);

% izracuna cas potovanja po brahistohroni
% med danima tockama
[k,theta0] = isci_theta(b,B);
t_b = k/sqrt(2*g)*theta0;

% izracuna cas potovanja po premici
% med danima tockama
t_p = sqrt(2*(b^2+B^2)/(-g*B));

end