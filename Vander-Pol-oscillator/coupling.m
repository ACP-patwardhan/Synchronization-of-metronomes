function [H,t] = coupling(T,h,Q,g)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
H=[];
N=T/h;

for i=1:N
    t(i)=i*h;
    
    for j=1:N
        
        f(j)=(Q(1,j))*(g(1,j)-g(1,mod((j+i),N)+1));
    end
    H(i)=(1/T)*trap_D(f,N,h);
end
end

