format long g
G=@(t,X) [X(1)-X(2)-X(1)*((X(1)^2) + (X(2)^2));X(1)+ X(2)-X(2)*((X(1)^2) + (X(2)^2))];
tm=50;
h=0.01;
[y,t]=RK3(G,[1;3],tm,h);
plot(y(1,:),y(2,:))
title('trajectory')
ylabel('y')
xlabel({'x','(initial condition x0=1,y0=3)'})

[T,c]=TP(y);
lc=LimitCycle(y,c);
figure(2)
plot(lc(1,:),lc(2,:))
title('limit cycle')
ylabel('y')
xlabel('x')


[t_prc,prc]= PRC(lc(:,1),2,G,T,h);
[lc_1,t_lc1]=RK3(G,lc(:,1),4*T,h);
figure(3)
plot(t_lc1,lc_1(1,:),'b')
hold on
plot(t_prc,prc(1,:),'r')
title('phase response curve;purturbation applied in red') 
ylabel('x')
xlabel({'t','Andronov Hopf Oscillator'})


[sol,q,t]=malkins(lc(:,1),4*T,0.01);
Q=q(:,end:-1:3*(T/h)+1);
SOL=sol(:,end:-1:3*(T/h)+1);
figure(4)
plot(t(1:T/h),Q(1,:))
hold on
plot(t(1:T/h),Q(2,:))
title('Qx vs t in blue; Qy vs t in red')
xlabel({'t','Andronov Hopf Oscillator'})

figure(5)
plot (Q(1,:),-Q(2,:),'r')
hold on
plot(SOL(1,:),SOL(2,:),'g')
title('Qy vs Qx')
ylabel('Qy')
xlabel({'Qx','Andronov Hopf Oscillator'})

%coupling function for 2 oscillators
figure(6)
[H,t]=coupling(T,h,Q,SOL);
plot(t,H)
grid on

hold on 
G=(H(end:-1:1)-H);
plot(t,G,'r')
title('Gij(X)in red and Hij in blue for Andronov-Hopf Oscillator ')
xlabel('X')