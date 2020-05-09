function Q=adjoint(F,t,x0)
% finds solution to the Malkin's adjoint equation Q' = -DF^t Q
% at time-points t with t(end) being the period
% 'x0' is a point on the limit cycle with zero phase
tran=3; % the number of skipped cycles
dx = 0.000001; dy = 0.000001; % for evaluation of Jacobian
Q(1,:)=feval(F,0,x0)'; % initial point;
[t,x] = ode23s(F,t,x0); % find limit cycle
for k=1:tran
Q(length(t),:)=Q(1,:); % initial point;
for i=length(t):-1:2 % backward integration
L = [(feval(F,t(i),x(i,:)+[dx 0])-feval(F,t(i),x(i,:)))/dx,...
(feval(F,t(i),x(i,:)+[0 dy])-feval(F,t(i),x(i,:)))/dy];
Q(i-1,:) = Q(i,:) + (t(i)-t(i-1))*(Q(i,:)*L);
end
end
%Q = Q/(Q(1,:)*feval(F,0,x0)); % normalization
end