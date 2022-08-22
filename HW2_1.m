clear 
clc

%Bode Plot run before code to avoid error

figure(1)
bode( tf( [1,1,1],[1,3,1] ) )


%%

syms s Vo Ra Cb Cc Rd;
A=[1 0 0 Ra 0 0 0; 
   0 Cb*s 0 0 1 0 0; 
   Cc*s -Cc*s 0 0 0 1 0; 
   0 -1 0 0 0 0 Rd;
   0 0 -1 1 1 0 0; 
   0 0 0 0 -1 1 1; 
   0 0 0 1 0 1 0;]

b=[Vo; Cb*s*Vo; 0; 0; 0; 0; 0]; x=A\b

Ia = x(4)
Va = Ia*Ra
tf = 1 - ( Va / Vo ) %Note tf = V1/Vo
final = simplifyFraction(tf)

%% 1c
syms R C 
Ra = (2*R)
Cb = C
Cc = C
Rd = R/2

final

finalcircuit = (C*(R/2)*s + C*(R/2)*s + C*C*(2*R)*(R/2)*s^2 + 1)/(C*(2*R)*s + C*(R/2)*s + C*(R/2)*s + C*C*(2*R)*(R/2)*s^2 + 1)

