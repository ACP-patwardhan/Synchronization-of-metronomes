function [T,count] = TP( y )
format long g
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
count = 1;                
tol = 0.005;               
timePeriod = 0;
tsize=length(y);
comparex = y(1,tsize); 
comparey = y(2,tsize); 
distcurr = 0;        
  

for i = 1:1:tsize-1
    count = count+1;
    distcurr = sqrt((comparex-y(1,tsize-i))^2+(comparey-y(2,tsize-i))^2);
    if(distcurr>=tol)               
        count = count+1;
   % elseif(distcurr>distprev)      
    %    count = count+1;        
    else
        timePeriod = count*tol;
        break;
    end
end
timePeriod = count*tol;
T=timePeriod;
end



