function [Q,norm] = MalkinMet(F,t,lc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tsize=length(t);
step=0.1;
dtheta1=[step;0];
dom1=[0;step;];
Q(:,1)=lc(:,1);
for i=2:1:tsize
    L=[((F(t(i),lc(:,i)+dtheta1)-F(t(i),lc(:,i)))/(step)), ((F(t(i),lc(:,i)+dom1)-F(t(i),lc(:,i)))/(step))]' ;
    Q(:,i)=Q(:,i-1)+(t(i-1)-t(i))*(L*Q(:,i-1));
end
norm=Q(:,1)'*lc(:,1);
Q=Q/norm;
end

