function [k,theta] = isci_theta(b,B)
% V odvisnosti od koncne tocke T2(b,B) doloci theta*, 
% ki je resitev enacbe 1-cos?+B/b(?-sin?)=0.
% Predpostavimo, da T1=(0,0).
% Funkcija vrne se konstanto k, ki doloca brahistohrono.

g = @(t) 1-cos(t)+B/b*(t-sin(t));
theta = fzero(g,pi);
k = sqrt(2*b/(theta-sin(theta)));
end