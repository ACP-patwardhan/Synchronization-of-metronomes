function [lc ] = LimitCycle( Y,C )
format long g
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n_lc=C;
lc=zeros(2,n_lc);
y_end=length(Y);
lc(:,n_lc:-1:1)=Y(:,y_end:-1:y_end-n_lc+1);

end

