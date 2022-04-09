%RCK_Model
%This Model for the spread of a disease is only
%dependent on the state variable I

%% Set Parameter
n= 0.012;          %  Capital Intensity
g=0.012;           %  MPC
a=0.5;
w=2;
z=6;
K=700;
A=2;
L=10;
tmax=100; % NUmber of Weeks 
dt=1; % Size of time steps in week ( Since want to get dI
        % we would cross multiply to other side
         plotchoice = 1; % 1=S, 2=I, 3=R 4= All
%% Initialise Vectors
t=1:dt:tmax; % time vector
Nt = length (t); % number of time steps
k= zeros(1, Nt);   % Icome Vector
y= zeros(1, Nt); % Consumption Vector
i= zeros(1, Nt); % Actual Saving /Investemnt 
c=zeros(1, Nt);  % Steady State Investment 
k(1)=K/(A*L);
y(1)=(k(1))^a;
i(1)= (n+g)*k(1);
c(1)= y(1) - (n+g)*k(1);
%% Calculations 
for it =1:Nt-1
i(it+1)= (n+g)*k(it);
k(it+1) = k(it) + i(it+1);
y(it+1)= (k(it+1))^a;
c(it+1)= y(it+1)- i(it+1);
end
k1=((z+w*g)/a)^(1/(1-a));
save output1  k c y
%% Plots
 switch plotchoice
    case 1
     plot(k1, c, 'b' ,'LineWidth',4); hold on;
    %plot(k1, c, 'r' ,'LineWidth',1);
    %plot(k, c3, 'm' ,'LineWidth',1);
   % plot(k, c4, 'c' ,'LineWidth',1);
 %plot(k1, c4, 'ro' ,'LineWidth',1);
        grid on
        grid minor
        xlabel ('Capital Stock')
        ylabel (' Consumption')
        title ('RCK')
        
    switch plotchoice
    case 3
    plot(k, c1, 'b' ,'LineWidth',1); hold on;
    plot(k, c2, 'r' ,'LineWidth',1);
    plot(k, c3, 'm' ,'LineWidth',1);
    plot(k, c4, 'c' ,'LineWidth',1);
 plot(k1, c, 'bd' ,'LineWidth',1);
        grid on
        grid minor
        xlabel ('Capital Stock')
        ylabel (' Consumption')
        title ('RCK')
        
    
    case 2
    plot(k, y, '-bd' ,'LineWidth',1); hold on;
 plot(k, i, '-mv' ,'LineWidth',1);  hold off
        grid on
        grid minor
        xlabel ('Capital Stock')
        ylabel (' Consumption')
        title ('RCK')  
    end 
end
%%
