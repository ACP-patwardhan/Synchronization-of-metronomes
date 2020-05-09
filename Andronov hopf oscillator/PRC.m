function [ t_prc,prc ] = PRC( ip,pert,F,TP,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ic=ip+pert;
[prc,t_prc]=RK3(F,ic,5*TP,h);
end

