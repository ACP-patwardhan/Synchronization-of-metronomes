format long g
% Metronome equations and parameters
%X=[theta1,omega1,theta2,omega2]
beta=0.0011;
delta=0.001;
theta0=0.39;
mu=0.01;


% Defining the parameters for simplifying the equations
a1=@(X) (1/(1-(beta*cos(X(1))*cos(X(1)))  ) );
a2=@(X) (1/(1-(beta*cos(X(3))*cos(X(3)))  ) );
b=@(X)  (beta*cos(X(1))*cos(X(3)));
c=@(X) (1/(1-(beta*cos(X(1))*cos(X(1))) - (beta*cos(X(3))*cos(X(3))) ) );

%the Differential Equations
G=@(t,X) [ X(2);
           

            a1(X)*( -(1+delta)*sin(X(1)) - mu*(( ((X(1)/theta0))^2) - 1)*X(2) -(beta/2)*(sin(2*X(1)))*(X(2)^2) )-a1(X)*(b(X)^2)*c(X)*(-(1+delta)*sin(X(1)) - mu*(( ((X(1)/theta0))^2) - 1)*X(2) -(beta/2)*(sin(2*X(1)))*(X(2)^2))-(c(X)/a2(X))*(beta*cos(X(1))*sin(X(3))*(X(4)^2))+b(X)*c(X)*(-(1+delta)*sin(X(3)) - mu*(( ((X(3)/theta0))^2) - 1)*X(4) -(beta/2)*(sin(2*X(3)))*(X(4)^2))-b(X)*c(X)*(beta*cos(X(1))*sin(X(3))*(X(4)^2));
           
           
           X(4);
           
           
           a2(X)*( -(1+delta)*sin(X(3)) - mu*(( ((X(3)/theta0))^2) - 1)*X(4) -(beta/2)*(sin(2*X(3)))*(X(4)^2) )-a2(X)*(b(X)^2)*c(X)*(-(1+delta)*sin(X(3)) - mu*(( ((X(3)/theta0))^2) - 1)*X(4) -(beta/2)*(sin(2*X(3)))*(X(4)^2))-(c(X)/a1(X))*(beta*cos(X(3))*sin(X(1))*(X(2)^2))+b(X)*c(X)*(-(1+delta)*sin(X(1)) - mu*(( ((X(1)/theta0))^2) - 1)*X(2) -(beta/2)*(sin(2*X(1)))*(X(2)^2))-b(X)*c(X)*(beta*cos(X(3))*sin(X(1))*(X(2)^2))
           ];
           


% solving the differential equation using RK3 
% defining the time of simulation tm and the stepsize

tm=1500;
h=0.01;
[y,t]=RK3(G,[0.25;-0.5;-0.2;0.4],tm,h);

% y is the 4 X (tm/h) array of solution
plot(y(1,:),y(2,:))
hold on
plot(y(3,:),y(4,:))
title('trajectory')
ylabel('y')
xlabel({'x','(theta1=0.25;omega1=-0.5;theta2=-0.2;omega2=0.4)'})

figure(2)
plot(t/10,y(1,:),'b')
hold on 
plot(t/10,y(3,:),'r')
title('theta vs t graph for two oscillators')
ylabel('theta1 in blue theta2 in red')
xlabel({'t','(theta1=0.25;omega1=-0.5;theta2=-0.2;omega2=0.4)'})
 
[T,c]=TP(y(3:4,:));
lc1=LimitCycle(y(1:2,:),c);
lc2=LimitCycle(y(3:4,:),c);
figure(3)
plot(lc1(1,:),lc1(2,:))
title('limit cycle of the metronome')
ylabel('theta1')
xlabel('omega1')

%Q calculations for Time period and others
Fq=@(t,X) [ X(2);
           

            a1(X)*( -(1+delta)*sin(X(1)) - mu*(( ((X(1)/theta0))^2) - 1)*X(2) -(beta/2)*(sin(2*X(1)))*(X(2)^2)) 
            ] ; 
          
[yq,tq]=RK3(Fq,[0.25;-0.5],tm,h);
[Tq,cq]=TP(yq(1:2,:));
lcq=LimitCycle(yq,cq);
figure(4)
plot(lcq(1,:),lcq(2,:))
title('limit cycle of the uncoupled oscilator')
ylabel('y')
xlabel({'x','(theta1=0.25;omega1=-0.5)'})
hq=Tq/cq;
Tq=((h/hq)*Tq);
[SOL,Q,t]=malkins(lcq(:,1),Tq,h,delta,beta,mu,theta0);
 figure(5)
 plot(SOL(1,:),SOL(2,:),'g')
 title('limit cycle after malkins')
 figure(6)
 plot(t,Q(1,:),'b')
 hold on
 plot(t,Q(2,:),'r')
 title('Qx vs t in blue; Qy vs t in red')
 xlabel({'t','(initial condition for Qx and Qy graph before normalization','Qx=1;Qy=1)'})
 figure(7)
 plot(Q(1,:),Q(2,:));
 title('Qx vs Qy in their phase space')
 ylabel('Qy')
 xlabel('Qx')
% 

%  coupling function for 2 oscillators
 figure(8)
 [H,t]=coupling(Tq,h,Q,SOL,lc1);
 plot(t,H)
 title('Hij(\chi) for metronomes on a moving base')
 xlabel('\chi')
 ylabel('Hij(\chi)')
 grid on
 
 figure(9)
 G=H(end:-1:1)-H;
 plot(t,G,'r')
 title('Gij(\chi)for metronomes coupled on a moving base ')
 xlabel('\chi')
 ylabel('Gij(\chi)')
 grid on