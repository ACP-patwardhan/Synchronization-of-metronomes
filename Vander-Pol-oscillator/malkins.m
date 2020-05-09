function [sol,Q,t] = malkins(ip,tm,h)
format long g
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% F=@(t,X) [X(1)-X(1)^3-X(2);X(1);(1-3*(X(1)^2))*X(3)+X(4);-X(3)]; %for vanderpol oscillator
% 
F=@(t,X) [X(1)-X(2)-X(1)*((X(1)^2) + (X(2)^2));             %For andronov hopf oscillator
          X(1)+ X(2)-X(2)*((X(1)^2) + (X(2)^2));
         (1-(X(2)^2)-3*(X(1)^2))*X(3)-(1+2*X(1)*X(2))*X(4);
         (1-2*X(1)*X(2))*X(3)+(1-(X(1)^2)-3*(X(2)^2))*X(4)];
xi=ip(1);
yi=ip(2);
i1=[0;1/(xi+yi-yi*(xi^2)-yi^3)];    %for andronov hopf oscillator
% i1=[0;1/(xi)];%for vanderpol oscillator
ic=[ip;i1];
[Y,t]=RK3_Malkins(F,ic,tm,h);
sol=Y(1:2,:);
Q=Y(3:4,:);
end

