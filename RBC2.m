%RBC_Model: Dynamics of technological shocks
%This Model for the spread of a disease is only
%dependent on the state variable I

%% Set Parameter
a=0.33
r=0.9 %% Allowing technology shock persistence
ty=10
tmax=10; % NUmber of Weeks 
dt=1; % Size of time steps in week ( Since want to get dI
        % we would cross multiply to other side
         plotchoice = 1; %
%% Initialise Vectors
t=1:dt:tmax; % time vector
tm=1:dt:ty;
Nt = length (t); % number of time steps
k= zeros(1, Nt);   % Icome Vector
y= zeros(1, Nt); % Consumption Vector
c=zeros(1, Nt);  % Steady State Investment 
X=rand(1,1000); % 1000 random number betweeen 0-1
y(1)=(1-a)*std(X); % Using (Shock hit every two period) the standard deviation of the rand as shock %%+ (1-a)*std(X) ; Here, I cut of the shock. 
c(1)= (1-a*r)*(y(1));
k(2)= a*r*(y(1));
y(2)= (a+r)*(y(1))
y(3)= (a+r)*(y(2)) - a*r*(y(1)) + (1-a)*rand;
y(4)= (a+r)*(y(3)) - a*r*(y(2))
y(5)= (a+r)*(y(4)) - a*r*(y(3)) 
y(6)= (a+r)*(y(5)) - a*r*(y(4)) + (1-a)*rand;
y(7)= (a+r)*(y(6)) - a*r*(y(5)) 
y(8)= (a+r)*(y(7)) - a*r*(y(6))
y(9)= (a+r)*(y(8)) - a*r*(y(7)) + (1-a)*rand;
y(10)= (a+r)*(y(9)) - a*r*(y(8)) 
%% Plots
 switch plotchoice
    case 1
    plot(tm, y, 'b' ,'LineWidth',1); hold on;
    %%plot(tm, k, 'b' ,'LineWidth',1);
        grid on
        grid minor
        xlabel ('period')
        ylabel ('Out,Cap & Con - gap')
        title ('RBC')
 end
