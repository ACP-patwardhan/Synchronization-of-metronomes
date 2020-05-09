function [T,count] = TP( y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
format long g
count = 1;                
tol = 0.005;               
timePeriod = 0;
tsize=length(y);
comparex = y(1,tsize); 
comparey = y(2,tsize); 
distcurr = 0;        
  

for i = 1:1:tsize-1
    
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
T=timePeriod;
end



