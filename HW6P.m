%HW6P BAyesian analysis
%Question 1 
%we first insert the data given in an array 
Data = [4.73 0.45 -1.73 1.09 2.19 0.12 1.31 1.00 1.32 1.07 0.86 -0.49 -2.59 1.73 2.11 1.61 4.98 1.71 2.23 -57.20 0.96 1.25 -1.56, 2.45 1.19 2.17 -10.66 1.91 -4.16 1.92 0.10, 1.98 -2.51 5.55 -0.47 1.91 0.95 -0.78 -0.84 1.72 -0.01 1.48 2.70 1.21 4.41 -4.79 1.33 0.81 0.20 1.58 1.29 16.19 2.75 -2.38 -1.79 6.50 -18.53 0.72 0.94 3.64 1.94 -0.11 1.57 0.57];
%we plot the log of p based on Y0 to find the value for Y0 
Y0 = 0:0.1:4.5;
lnp = zeros(1,length(Y0));

for i=1:length(Y0)
    lnp(i) = ourLog(1.25,Y0(i),Data);
end 

figure;plot(Y0,lnp);
%for Question 5 
ourXforY = ourLog(1.25,0.68,Data);
hold on 
plot(0.68,ourXforY,'r*')
Xlocation = ourXforY
Ylocation = 0.6800

%Question 2 now we have too unknowns so we can have lnp as a matrix 
X0 = 0:0.1:4.5;
logp = zeros(length(X0),length(Y0));
for i= 1:length(Y0)%nested loop so we can access all the elements of matrix logp
    for j=1:length(X0)
        logp(i,j) = ourLog(X0(j),Y0(i),Data);
    end
end
figure;plot3(X0,Y0,logp);%a 3-D plot with X0 on x-axis Y0 on y-axis
                         %and our matrix of log p as the z-axis 
%for Question 5 
theMaxOnGraph = ourLog(0.0033,0.5775,Data);
hold on 
plot3(0.033,0.5775,theMaxOnGraph,'r*')  
locationX0 = 0.0033
locationY0 = 0.5775
locationlogP = theMaxOnGraph

%Question 3 
%using fminsearch and minus sign to get the maximum 
fun = @(Y0)-ourLog(1.25,Y0,Data);
guessY = 0.8;
maxOfY0 = fminsearch(fun,guessY)


%Question 4 
%same as we did for Question4 
P = [Y0 X0];%here we use an array instead of a single value and acess the 
            %X0 and Y0 with the array index 
fun2 =@(P)-ourLog(P(2),P(1),Data);
guessVal =[0.3 0.8];
maxOfFunc = fminsearch(fun2,guessVal)

%Question 5, added to question 1 and 2 
