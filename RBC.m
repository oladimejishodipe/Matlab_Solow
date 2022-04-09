%RBC_Model: Dynamics of technological shocks
%This Model for the spread of a disease is only
%dependent on the state variable I

%% Set Parameter
a=0.33
b=0.7
r=0.9 %% 
ty=101
tmax=100; % NUmber of Weeks 
dt=1; % Size of time steps in week ( Since want to get dI
        % we would cross multiply to other side
         plotchoice = 1; %
%% Initialise Vectors
t=1:dt:tmax; % time vector
tm=1:dt:ty;
Nt = length (t); % 
k= zeros(1, Nt);   % 
y= zeros(1, Nt); % 
c=zeros(1, Nt);  % 
%%X=rand(1,1000); % 1000 random number betweeen 0-1
y(1)=(1-a)*(rand-0.5)    %std(X); % Using (One-time shock) the standard deviation of the rand as shock
y(2)= (a+r)*y(1)+(1-a)*(rand-0.5) ; %%+ (1-a)*std(X) ; Here, I cut of the shock. 
c(1)= (1-a*b)*(y(1));
k(2)= a*b*(y(1));
%% Calculations : 
for it =1:Nt-1
y(it+2)= (a+r)*(y(it+1)) - a*r*(y(it)) + (1-a)*(rand-0.5) ; %% + (1-a)*std(X) - I cut of the shock here;
k(it+2) = a*b*y(it+1);
c(it+1)= (1-a*b)*(y(it+1));
end
plot(t, c, 'b' ,'LineWidth',1);
%% Plots
 switch plotchoice
    case 1
    plot(tm, y, 'b' ,'LineWidth',1); hold on;
   %% plot(tm, k, 'b' ,'LineWidth',1);
        grid on
        grid minor
        xlabel ('period')
        ylabel ('Out,Cap & Con - gap')
        title ('RBC')
 end
