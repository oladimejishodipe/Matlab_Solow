pause;
%% Tomiwa and Lawrence Paper 

var C Nf Np Wf Wp r Y A G R Pi M K I T;

varexo ea eR psa;

%% parameter declaration 
parameters beta psi gamma sigma_a sigma_P sigma_R rho_P rho_a rho_R g_c eta delta alpha_p alpha_f g_k g_u theta_c theta_n theta_m tau_f tau_k a_ss r_ss wf_ss wp_ss np_ss nf_ss y_ss k_ss I_ss g_ss c_ss pi_ss t_ss m_ss R_ss;

%% set parameters to estimated values
beta = 0.95;
psi = 1;
gamma = 0.2;
sigma_a = 0.05;
sigma_R = 0.05;
g_c = 0.02;
eta = 1;
delta = 0.0083;
alpha_f = 0.6;
alpha_p = 0.5;
g_k = 0.02;
g_u = 0.4;
theta_c = 1;
theta_n = 2;
theta_m = 10;
a_ss = 1;
tau_f = 0.2;
tau_k = 0.3;
r_ss = 0.0870;
wf_ss = 7.7289;
wp_ss = 5.7911;
np_ss = 0.0632;
nf_ss = 0.1264;
y_ss = 3.0194;
k_ss = 15.7673;
I_ss = 0.1309;
g_ss = 0.9189;
c_ss = 1.9696;
pi_ss = 2;
t_ss = 0.0128;
m_ss = 1.4695;
R_ss = 1;
rho_a = 0.98;
rho_R = 0.95;
rho_P=0.3;

model(linear);
C = C(+1) - (beta/theta_c)*(1 - tau_k)*r_ss*r(+1);

Wp = theta_n*((eta*(1+g_c))/(((c_ss)^(-theta_c))*wp_ss))^(-(1/theta_n))*(Nf*nf_ss + Np*np_ss) + theta_c*C;

Wf = theta_n*((eta*(1+g_c))/(((c_ss)^(-theta_c))*wf_ss*(1-tau_k)))^(-(1/theta_n))*(Nf*nf_ss + Np*np_ss) + theta_c*C;

Wp = alpha_p*(K - Np);

Wf = A + alpha_f*(K - Nf);

r = A + (1 - alpha_f)*(Nf - K);

y_ss*Y = c_ss*C + I_ss*I + g_ss*G;

K(+1) = (1-delta)*K + (I_ss/k_ss)*I;

y_ss*Y = a_ss*(((1+g_k)*k_ss)^(alpha_f))*((nf_ss)^(1-alpha_f))*(A + alpha_f*K 
+ (1-alpha_f)*Nf) + ((g_k*k_ss)^(alpha_p))*((np_ss)^(1-alpha_p))*(alpha_p*K
 + (1-alpha_p)*Np);

g_ss*G = gamma*((wf_ss*nf_ss*tau_f)*(Wf + Nf) + (r_ss*k_ss*tau_k)*(r + K)) 
+ (1-gamma)*R_ss*R;

-theta_m*((m_ss)^(-theta_m))*M(+1) = (theta_c^theta_c)*(beta*theta_c*C(+1)
+ Pi*pi_ss - (1+pi_ss)*theta_c*C);

g_u*g_ss*G = g_c*c_ss*C + g_k*k_ss*K + t_ss*T;

Pi= rho_P*Pi(-1) + psa;

A = rho_a*A(-1) + ea;

R = rho_R*R(-1) + eR;

end;


steady;
resid;
check;

shocks;
var ea = sigma_a^2;
var eR = sigma_R^2;
var psa = sigma_P^2;


end;

stoch_simul(order=1,hp_filter=1600, irf=16, irf_plot_threshold=0) C Nf Np Wf Wp r Y A G R Pi M K I T;

































