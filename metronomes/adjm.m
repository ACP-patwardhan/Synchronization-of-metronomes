function Q=adjm(F,t,lc,x0)
% finds solution to the Malkin's adjoint equation Q' = -DF^t Q
% at time-points t with t(end) being the period
% 'x0' is a point on the limit cycle with zero phase

dx = 0.000001; dy = 0.000001; % for evaluation of Jacobian
Q(:,1)=lc(:,1); % initial point;
Q(:,length(t))=Q(:,1); % initial point;
for i=length(t):-1:2 % backward integration
    L =F(t(i),lc(:,i))-F(t(i),lc(:,i))
    Q(i-1,:) = Q(i,:) + (t(i)-t(i-1))*(Q(i,:)*L);
end
Q = Q/(Q(1,:)*feval(F,0,x0)); % normalization