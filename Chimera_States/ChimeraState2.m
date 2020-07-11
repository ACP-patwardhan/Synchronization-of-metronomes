timestep=0.01;
maxTime=3000;
[chime,N,count,time,omega]=chimeraSolver2(timestep,maxTime);

for a = 1:1:N
    figure(1)
    plot(time/omega,squeeze(chime(a,1,:)));
    hold on
end
hold off
title('\phi_i vs time');
ylabel('\phi_i')
xlabel('time')

for b = N+1:1:2*N
    figure(2)
    plot(time/omega,squeeze(chime(b,1,:)));
    hold on
end
title('\psi_i vs time');
ylabel('\psi_i')
xlabel('time')

for b = 2*N+1
    figure(3)
    plot(time/omega,squeeze(chime(b,1,:)));
    hold on
end
title('\Phi vs time');
ylabel('\Phi')
xlabel('time')

for b = 2*N+2
    figure(4)
    plot(time/omega,squeeze(chime(b,1,:)));
    hold on
end
title('\Psi vs time');
ylabel('\Psi')
xlabel('time')

av_sync_phi=zeros(count,1);
for i=1:count
    av_sync_phi(i)=sum(chime(1:N,1,i));
end
av_sync_phi=av_sync_phi/N;
av_sync_psi=zeros(count,1);
for i=1:count
    av_sync_psi(i)=sum(chime(N+1:2*N,1,i));
end
av_sync_psi=av_sync_psi/N;

Z1=zeros(N,count);
for i=1:count
    Z1(1:N,i)=chime(1:N,1,i)-av_sync_psi(i);
end
Z2=zeros(N,count);
for i=1:count
    Z2(1:N,i)=chime(N+1:2*N,1,i)-av_sync_psi(i);
end





count=length(Z1);
Z1=exp(1i*Z1);
Z_phi=zeros(1,count);
for i=1:count
    Z_phi(1,i)=sum(Z1(:,i));
end
Z_phi=Z_phi/N;

Z2=exp(1i*Z2);
Z_psi=zeros(1,count);
for i=1:count
    Z_psi(1,i)=sum(Z2(:,i));
end
Z_psi=Z_psi/N;
figure(5)
plot(time/omega,abs(Z_phi))
hold on
plot(time/omega,abs(Z_psi),'r')
title('|Z^p (t)|')
xlabel('time')
ylabel('|Z^p(t)|')
figure(6)
plot(Z_phi,'b')
hold on
plot(Z_psi,'r')
title('Z^p (t)')
xlabel('Re(Z^p(t))')
ylabel('Im(Z^p(t))')
% 
% T_window=maxTime/(2*timestep);
% omega_k_phi=zeros(N,1);
% for i=1:N
%     omega_k_phi(i,1)=chime(i,1,maxTime)-chime(i,1,T_window);
% end
% omega_k_phi=omega_k_phi./T_window;
% omega_k_phi=sort(omega_k_phi,'descend');
% omega_k_psi=zeros(N,1);
% for i=1:N
%     omega_k_psi(i,1)=chime(N+i,1,maxTime)-chime(N+i,1,T_window);
% end
% omega_k_psi=omega_k_psi./T_window;
% omega_sync=(sum(omega_k_psi))/N;
% plot(omega_k_phi/omega_sync,'rs')
% hold on
% plot(omega_k_psi/omega_sync,'bs')