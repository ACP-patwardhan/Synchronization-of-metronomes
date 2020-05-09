function [I] = trap(F,xi,xf,h)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
I=-(F(xi)+F(xf))/2;
N=(xf-xi)/h;
for i=0:N
    x=xi+i*h;
    I=I+F(x);
end

I=I*h;
end

