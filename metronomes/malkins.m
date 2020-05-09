function [sol,Q,t] = malkins(ip,tm,h,delta,beta,mu,theta0)

a1=@(X) (1/(1-(beta*cos(X(1))*cos(X(1)))  ) );

Fq=@(t,X) [ X(2);
           

            a1(X)*( -(1+delta)*sin(X(1)) - mu*(( ((X(1)/theta0))^2) - 1)*X(2) -(beta/2)*(sin(2*X(1)))*(X(2)^2)) ;
            
            a1(X)*( (1+delta)*cos(X(1)) + mu*( (2*X(1))/(theta0^2))*X(2) +(beta)*(cos(2*X(1)))*(X(2)^2))*X(4) ;
            
            -X(3)+a1(X)*( + mu*(( ((X(1)/theta0))^2) - 1) +(beta)*(sin(2*X(1)))*(X(2)))*X(4) 
            ];           
           

i1=[1;1];
norm=i1'*ip;
i1=i1/norm;
ic=[ip;i1];
[Y,t]=RK3_Malkins(Fq,ic,tm,h);
sol=Y(1:2,:);
Q=Y(3:4,:);

end

