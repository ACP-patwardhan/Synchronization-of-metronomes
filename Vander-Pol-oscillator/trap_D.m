function [I] = trap_D(F,N,h)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
I=-(F(1)+F(N))/2;
for i=1:N
    I=I+F(i);
end
I=I*h;
end

