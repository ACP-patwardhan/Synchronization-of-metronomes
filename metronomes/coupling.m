function [H,t] = coupling(T,h,Q,g,lc1)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
format long g
H=[];
N=T/h;


for i=1:N
    t(i)=i*h;
    
    for j=1:N
        f(j)=(Q(2,j))*(lc1(2,i)-g(2,j));
    end
    H(i)=(1/T)*trap_D(f,N,h);
end
end

