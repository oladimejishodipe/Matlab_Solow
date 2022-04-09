prod= xlsread('prod.xlsx');
out=prod(:,1);
cap=prod(:,2);
lab=prod(:,3);
ener=prod(:,4);
plot(out,cap, 'k'); grid on;
plot(prod(:,1),prod(:,2), 'k'); grid on;
lout=log(out);
lcap=log(cap);
llab=log(lab);
lener=log(ener);
b0= ones(length(out),1);

x= [b0, lcap, llab, lener];
y=lout
b1= x\y % Notice here we use backslash and the 
            % coefficient matrix comes first
            



%% Using Projection
x1= x';
x2= (x1*x)^-1
b2= (x2)*x1*lout % The betas

projmat=x*(x2)*x1; % The projection




%% Plotting the lines
yhat=x*b2
erhat= y-yhat  % Error term
x3=[x, erhat]
rho= corr(x3) %cross correlation of error term and xs
[rho, pval]= corr(x3) %cross correlation of error term and xs

%The pvalue not necessary
c= [b0, lcap]
c1=c\y

d= [b0,y]
d1= d\lcap

