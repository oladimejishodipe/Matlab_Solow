%Solow_Model
%This Model for the spread of a disease is only
%dependent on the state variable I

%% Set Parameter
a= 0.55;          %  Capital Intensity
b=0.56;           %  MPC
z=1-b;           % MPS 
n=0.03;             % Labor Growth 
g=0.03;              % Technolical Growth 
d=0.1;               % Depreciation
h=10;
L0 =1; % Initial Labor Force
K0 =1; % Initial Capital
A0=4;        % Total Factor Productivity
% Effective Capital Labor Ratio
        % Initial Income
  % Initial Steady State Investment
tmax=50 ; % NUmber of Weeks 
dt=1; % Size of time steps in week ( Since want to get dI
        % we would cross multiply to other side
   plotchoice = 1; % 1=S, 2=I, 3=R 4= All
%% Initialise Vectors
t=1:dt:tmax; % time vector
Nt = length (t); % number of time steps
L= zeros(1, Nt);  % Labor vector
            % Capital vector
A= zeros(1, Nt);            % Tachnology vector 

K= zeros(1, Nt); 
Y= zeros(1, Nt);   % Icome Vector
C= zeros(1, Nt); % Consumption Vector
I= zeros(1, Nt); % Actual Saving /Investemnt

Ik=zeros(1, Nt);  % Steady State Investment 
k= zeros(1, Nt);   % Icome Vector
y= zeros(1, Nt); % Consumption Vector
i= zeros(1, Nt); % Actual Saving /Investemnt 
c=zeros(1, Nt);  % Steady State Investment 
ik=zeros(1, Nt);  % Steady State Investment
L(1)= L0; 
K(1)= K0;
A(1)=A0;   % set initial infectio value
Y(1)= h*(K(1)*(L(1)*A(1)))^a;
I(1)=z*Y(1);  % set initial infectio value
C(1)= b*Y(1);
Ik(1)=(n+g+d)*K(1); 
ik(1)=(n+g+d)*k(1); % set initial infectio value
%% Calculations 
for it =1:Nt-1
L(it+1)= (1+n)*L(it); 
A(it+1)=(1+g)*A(it); 
K(it+1)= (1-d)*K(it) +  I(it) ;
Y(it+1)= h*(K(it+1)*L(it+1)*A(it+1))^a;
I(it+1)=z*Y(it+1);  
C(it+1)= b*Y(it+1);

k(it+1)= K(it+1)/(L(it+1)*A(it+1));
y(it+1)= h*(k(it+1))^a;
i(it+1)= z*y(it+1);  
c(it+1)= b*y(it+1);
ik(it+1)= (n+g+d)*k(it+1);
end
save output1  k i c ik y
%% Plots
switch plotchoice
    case 1
    plot(k, i, '-rv' ,'LineWidth',1); hold on;
 plot(k, i, '-bd' ,'LineWidth',1);
 plot(k, i, '-mv' ,'LineWidth',1); 
 plot(k, ik,'-black','LineWidth',2); hold off
        grid on
        grid minor
        legend('location','northwest', 'alpha=0.5', 'alpha=0.6', 'alpha=0.7')
        xlabel ('Capital Stock')
        ylabel ('Steady State I, Actual I, Cons, Income')
        title ('Steady State I, Actual I, Cons')     
end
%%

        % How to do the different simulation: Run the file, on the 
        %workspace change the variable, run it again, do the same. 
        %then you can present all the result in one case with above code
        %to do the sublot. copy each of the variales like k1, c1 i1, y1... to one file
       % say output1. but bow the name you are putting in the variable will output. do it for all all them. The build the subplot as above
       % suplot ( 3,2,4) it means you want three rows, 2 column and you are plottin
        %the the position of the variable in the matrix.
