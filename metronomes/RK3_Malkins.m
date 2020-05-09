function [Y,t ] = RK3_Malkins( F,Yi,tm,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=length(Yi);
m=ceil(tm/h);
Y(:,1)=Yi;
t=[0];
for i=2:m
    t(i)=t(i-1)+h;
    K1=F(t(i-1),Y(:,i-1));
    K2=F(t(i-1)+(h/3),Y(:,i-1)+(h/3)*K1);
    K3=F(t(i-1)+(2*h/3),Y(:,i-1)+(2*h/3)*K2);
    Y(:,i)=Y(:,i-1)+(h/4)*(K1+3*K3);
    norm=Y(3:4,i)'*Y(1:2,i);
    Y(:,i)=Y(:,i)/norm;
end

end