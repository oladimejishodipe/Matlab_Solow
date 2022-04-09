
clc, clear
%% Unkmown
syms r w_f w_p n_p n_f y_f y k I g c y_p T m A_bar B_bar D_bar F_bar K_bar M_bar

% Parameters
alpha_f = 0.6;
alpha_p = 0.5;
delta = 0.0083;
eta = 1;
g_c = 0.02;
gamma = 0.2;
psi = 1;
beta = 0.95;
g_k = 0.02;
g_u = 0.4;
theta_c = 2;
theta_n = 2;
theta_m = 10;
tau_f = 0.2;
tau_k = 0.3;
R = 1;

% Define equation
eq1= r == (1/(1-tau_k))*((1/beta) - 1 + delta);
eq2 = A_bar == (2*(1-alpha_p)*w_f)/((1-alpha_f)*w_p);
eq3 = B_bar == gamma*A_bar*((1-alpha_f)*tau_f + alpha_f*tau_k);
eq4 = D_bar == (1-gamma)*R;
eq5 = F_bar == (3*(1-alpha_p)/w_p)*(w_p*(eta*(1+g_c)))^(1/theta_c);
eq6 = K_bar == (w_p*(eta*(1+g_c)))^(1/theta_c);
eq7 = M_bar == (delta*alpha_f*A_bar)/r;
eq8 = w_f == (1-alpha_f)*(r/alpha_f)^(alpha_f/(alpha_f - 1));
eq9 = w_p == (1-tau_f)*(1-alpha_f)*(r/alpha_f)^(alpha_f/(alpha_f - 1));
eq10 = n_p == ((1-alpha_p)/w_p)*y_p;
eq11 = n_f == ((1-alpha_f)/w_f)*y_f;
eq12 = y_f == A_bar*y_p;
eq13 = y == (1 + A_bar)*y_p;
eq14 = k == (alpha_f/r)*A_bar*y_p;
eq15 = I == M_bar*y_p;
eq16 = g == B_bar*y_p + D_bar;
eq17 = c == K_bar - F_bar*y_p;
eq18 = y_p == (K_bar + D_bar)/(1 + A_bar + F_bar - M_bar - B_bar);
eq19 = T == g_u*g - g_c*c - g_k*k;
eq20 = m == ((r*c^(-theta_c))/(beta*psi*(1+g_c)*(1+r)))^(-(1/theta_m));

% File name we save the solution with. It can be any name.
TomLaw = solve(eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10, eq11, eq12, eq13, eq14, eq15, eq16, eq17, eq18, eq19, eq20);

% The values are stored 
r_value = double(TomLaw.r)
A_bar_value = double(TomLaw.A_bar)
B_bar_value = double(TomLaw.B_bar)
D_bar_value = double(TomLaw.D_bar)
F_bar_value = double(TomLaw.F_bar)
K_bar_value = double(TomLaw.K_bar)
M_bar_value = double(TomLaw.M_bar)
w_f_value = double(TomLaw.w_f)
w_p_value = double(TomLaw.w_p)
n_f_value = double(TomLaw.n_f)
n_p_value = double(TomLaw.n_p)
y_f_value = double(TomLaw.y_f)
y_p_value = double(TomLaw.y_p)
y_value = double(TomLaw.y)
k_value = double(TomLaw.k)
I_value = double(TomLaw.I)
g_value = double(TomLaw.g)
c_value = double(TomLaw.c)
T_value = double(TomLaw.T)
m_value = double(TomLaw.m)







