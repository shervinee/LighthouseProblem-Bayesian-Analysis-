function logProb = ourLog(x, y, Data)
% we try to implement the function we have found in question 3 to find the 
%log posterior 
summ = 0;
    for i = 1:length(Data)
        summ = log((y^2)+(Data(i)-x)^2);
    end 
logProb =log(64*y)-summ;
end 