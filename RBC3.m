%RBC_Model: Dynamics of technological shocks
%This Model for the spread of a disease is only
%dependent on the state variable I

%% Set Parameter
a=0.33
b=0.7
r=0.9 %% Allowing technology shock persistence
ty=51
tmax=50; % NUmber of Weeks 
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
ko= 2;
y(1)=rand*(ko)^a; % Using (One-time shock) the standard deviation of the rand as shock
c(1)= (1-a*b)*(y(1));
k(1)= a*b*y(1)
y(2)=rand*(k(1)^a); % Using (One-time shock) the standard deviation of the rand as shock
c(2)= (1-a*b)*(y(2));

%% Calculations : 
for it =1:Nt-1
y(it+1)= (k((it))^a)*rand 
k(it+1) = a*b*y(it);
c(it+1)= (1-a*b)*(y(it+1));
end
plot(t, c, 'b' ,'LineWidth',1);
%% Plots
 switch plotchoice
    case 1
    plot(t, y, 'b' ,'LineWidth',1); hold on;
    plot(t, k, 'r' ,'LineWidth',1);
     plot(t, c, 'm' ,'LineWidth',1);
        grid on
        grid minor
        xlabel ('period')
        ylabel ('Out,Cap & Con - gap')
        title ('RBC')
 end
