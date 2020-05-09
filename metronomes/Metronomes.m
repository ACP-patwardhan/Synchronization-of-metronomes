% Metronome equations and parameters
%X=[theta1,omega1,theta2,omega2]
beta=0.011;
delta=0;
theta0=0.39;
mu=0.01;
k1=(1-beta)/(1-2*beta);
k2=(beta)/(1-2*beta);
G=@(t,X) [X(2);
          -k1*( (1+delta)*X(1) + mu*( (((X(1))/(theta0))^2) - 1 )*X(2) ) - k2*X(1)*X(2)*X(2) - k2*( (1+delta)*X(3) + mu*((((X(3)/theta0)^2))- 1)*X(4) ) - k2*X(3)*X(4)*X(4); 
           X(4);
          -k1*( (1+delta)*X(3) + mu*( (((X(3))/(theta0))^2) - 1 )*X(4) ) - k2*X(3)*X(4)*X(4) - k2*( (1+delta)*X(1) + mu*((((X(1)/theta0)^2))- 1)*X(2) ) - k2*X(1)*X(2)*X(2)
          ];
% solving the differential equation using RK3 
% defining the time of simulation tm and the stepsize

tm=1500;
h=0.01;
[y,t]=RK3(G,[0.25;-0.5;-0.2;0.4],tm,h);

%y is the 4 X (tm/h) array of solution
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
ylabel('theta1 in blue theta2 in red')
xlabel({'t','(theta1=0.25;omega1=-0.5;theta2=-0.2;omega2=0.4)'})


[T,c]=TP(y(1:2,:));
lc1=LimitCycle(y(1:2,:),c);
lc2=LimitCycle(y(3:4,:),c);
figure(5)
plot(lc1(1,:),lc1(2,:))
hold on 
plot(lc2(1,:),lc2(2,:))
title('limit cycle')
ylabel('theta2')
xlabel('omega2')





% [t_prc,prc]= PRC(lc(:,1),2,G,T,h);
% [lc_1,t_lc1]=RK3(G,lc(:,1),4*T,h);
% figure(3)
% plot(t_lc1,lc_1(1,:),'b')
% hold on
% plot(t_prc,prc(1,:),'r')
% title('phase response curve;purturbation applied in red') 
% ylabel('x')
% xlabel('t')
% 
% 
% [sol,q,t]=malkins(lc(:,1),4*T,0.01);
% Q=q(:,end:-1:3*(T/h)+1);
% SOL=sol(:,end:-1:3*(T/h)+1);
% % plot(SOL(2,:),SOL(1,:),'g')
% % title('limit cycle after malkins')
% figure(4)
% plot(t(1:T/h),Q)
% hold on
% plot(t(1:T/h),Q)
% title('Qx vs t in blue; Qy vs t in red')
% xlabel('t')
% 
% figure(5)
% plot (-Q(2,:),Q(1,:))
% title('Qy vs Qx')
% 
% %coupling function for 2 oscillators
% figure(6)
% [H,t]=coupling(T,h,-Q,SOL);
% plot(t,-H)
% grid on
% 
% hold on 
% G=H(end:-1:1)-H;
% plot(t,-G,'r')
% title('Gij(X)in red and Hij in blue for Andronov-Hopf Oscillator ')
% xlabel('X')