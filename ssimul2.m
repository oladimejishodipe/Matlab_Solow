
%{
**************************************************************************
 How to execute this code
 rename the file to be the function's name (issmul(A))
 Make the B to be [B]
 We could change randn("seed",sd) to rng(sd,'v4') - Is the new generator, seed is
 old
 Remove the endfunction 
 Make the function draw a vertical line to connect to the end
 We would be having two ends, one for the loop and one for the function
 Cut the parameters and paste in the command window

 We could achieve this simulation without using
                            "function" by just defining our paraters without
                            using matrix A. Using, function gives us the 
                           flebility of saving our output in matrix form
                           without going back and forth to save our output
**************************************************************************
                           %}

%***************************************************************************
function B = ssimul2(A) % A is matrix that contains all the pre-parameters 
                        % we want to use to simulate. What function does
                         % is define B as the output by using all the
                         % parameters in the A. A is the input.
                           
   T = A(1,1); % Set T to be first row and first column of matrix A (31)
   y0 = A(1,2); %Set y0 to be first row and second column of matrix A (1)
   a1 = A(1,3); %Set a1 to be first row and third column of matrix A (0.9 or 0.5 or -.5)
                %A is matrix with [31 1 0.9] for the  B1
                 %A is matrix with [31 1 0.5] for the  B2
                  %A is matrix with [31 1 -.5] for the  B3
                  %These inputs are what we will be using to simulate
   sd =.25;
   randn('seed',sd)  % The old randn("seed",sd) not allowed on the version of my matlab
   ysim=zeros(3,T+1); % Make a matrix of 3 rows and T+1 (32) column 
                       % This makes ysim 96 cells
   ysim(1,1)=0; % Set the first row and first column of ysim  to be 0
   ysim(2,1)=y0; % Set the second row and first column of ysim  to be y0 =1, from the input below
   ysim(3,1)=y0; % Set the third row and first column of ysim  to be y0 =1, from the input below
   for i = 1:T
     ysim(1,i+1)=i; % For first row, interate to number from i+1 to T = 32,
                       %first cell is not inclusive that is 0 already
     ysim(2,i+1)=a1*ysim(2,i) + .1*rand(1); % interate each cell in the second row with this function
                                               %This row include randomness
     
     ysim(3,i+1)=a1*ysim(3,i); % interate each cell in the second row with this function
                              % This row is the same as the second but without randomness
     
   end;

 B = ysim;
end


%{

T=31;
y0=1;
a1=.9;
B1 = ssimul2([T y0 a1]);

T=31;
y0=1;
a1=.5;
B2 = ssimul2([T y0 a1]);

T=31;
y0=1;
a1=-.5;
B3 = ssimul2([T y0 a1]);

T=31;
y0=1;
a1=1;
B4 = ssimul2([T y0 a1]);

T=31;
y0=1;
a1=1.2;
B5 = ssimul2([T y0 a1]);

T=31;
y0=1;
a1=-1.2;
B6 = ssimul2([T y0 a1]);

figure  
subplot(3,2,1) 
plot(B1(1:1,1:T),B1(2:2,1:T),B1(1:1,1:T),B1(3:3,1:T));
title('y(t) = 0.9y(t-1) + e(t)')
xlabel('Panel (a)')
ylabel('y(t)')
ylim([-0.4 1])
set (gca, 'YTick', -.4:.2:1)
set (gca, 'XTick', 0:5:30)


subplot(3,2,2)  
plot(B2(1:1,1:T),B2(2:2,1:T),B2(1:1,1:T),B2(3:3,1:T));
title('y(t) = 0.5y(t-1) + e(t)')
xlabel('Panel (b)')
ylabel('y(t)')
ylim([-0.25 1])
set (gca, 'YTick', -.4:.2:1)
set (gca, 'XTick', 0:5:30)


subplot(3,2,3)  
plot(B3(1:1,1:T),B3(2:2,1:T),B3(1:1,1:T),B3(3:3,1:T));
title('y(t) = -0.5y(t-1) + e(t)')
xlabel('Panel (c)')
ylabel('y(t)')
ylim([-0.75 1])
set (gca, 'YTick', -.5:.5:1)
set (gca, 'XTick', 0:5:30)

subplot(3,2,4)  
plot(B4(1:1,1:T),B4(2:2,1:T),B4(1:1,1:T),B3(3:3,1:T));
title('y(t) = y(t-1) + e(t)')
xlabel('Panel (d)')
ylabel('y(t)')
ylim([-0.75 1])
set (gca, 'YTick', -.5:.5:1)
set (gca, 'XTick', 0:5:30)

subplot(3,2,5)  
plot(B5(1:1,1:T),B5(2:2,1:T),B3(1:1,1:T),B5(3:3,1:T));
title('y(t) = 1.2y(t-1) + e(t)')
xlabel('Panel (e)')
ylabel('y(t)')
ylim([0 200])
set (gca, 'YTick', 0:25:200)
set (gca, 'XTick', 0:5:30)

subplot(3,2,6)  
plot(B6(1:1,1:T),B6(2:2,1:T),B3(1:1,1:T),B6(3:3,1:T));
title('y(t) = -1.2y(t-1) + e(t)')
xlabel('Panel (f)')
ylabel('y(t)')
ylim([-250 200])
set (gca, 'YTick', -250:50:200)
set (gca, 'XTick', 0:5:30)



%}
