clear 
clc

%Bode Plot run before code to avoid error

figure(1)
bode( tf( [2,-1],[2,3] ) )

%%

syms s Vo Ca Rb Rc Cd;
A=[Ca*s 0 0 1 0 0 0; 
   0 1 0 0 Rb 0 0; 
   1 -1 0 0 0 Rc 0; 
   0 -Cd*s 0 0 0 1 0;
   0 0 -1 1 1 0 0; 
   0 0 0 0 -1 1 1; 
   0 0 0 1 0 1 0;]

b=[Ca*s*Vo; Vo; 0; 0; 0; 0; 0]; x=A\b

Ia = x(4)

tf = (-Ca + Ca*Cd*Rc*s) / (Cd-Ca+Ca*Cd*Rc*s) %Note tf = V1/Vo


%% 1c
syms R C 
Ca = C/2
Rb = R
Rc = R
Cd = 2*C

final = simplify( (-(C/2) + (C/2)*(2*C)*R*s) / ((2*C)-(C/2)+(C/2)*(2*C)*R*s) )

