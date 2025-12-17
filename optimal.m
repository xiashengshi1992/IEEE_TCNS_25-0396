 
global  Gama  d   L    aa bb cc ny   bl bu delta kappa ey ye q ti tt bb1
 
ny=6;   
delta=0.8;
kappa=1;
ey=zeros(ny,1);
q=ey;
ye=ey;  
ti=zeros(ny,1);
tt=zeros(ny,1); 
 
L=[1/2 0 0 0 0 -1/2;-1/3 2/3 0 -1/3 0 0;0 -1/2 1/2 0 0 0;0 0 -1/2 1/2 0 0;0 -1/3 0 -1/3 2/3 0;0 0 0 0 -1/2 1/2];  
bb1=0*[0.0002,0.0003,0.0001,0.0002,0.0004,0.0005];
aa=[2;1;0.5;1.5;1;1.5];
bb=[119;70;60;135;400;150];
cc=[32;26;45;37;40;35];
ai=0;
bi=0;
for i=1:ny
    ai=ai+0.5*bb(i)/aa(i);
    bi=bi+0.5/aa(i);
end
na=(ai+600)/bi;
for i=1:ny
    0.5*(na-bb(i))/aa(i);
end
Gama=2*diag(bb);
 
bl=[10;0;0;0;0;15];
bu=[35;30;50;30;20;30];
 
x0=rand(ny,1); 
for i=1:ny
   x0(i)=bl(i)+rand*(bu(i)-bl(i)); 
end
d=[145;0;0;0;0;0];
y0=zeros(ny,1); 
z0=zeros(ny,1); 

c0=zeros(ny,1);
v0=zeros(ny*ny,1);
m0=0*ones(ny,1); 

options = odeset('RelTol',1e-6);
t0=150;
[t,x,y,v,z,c,m]=runge_kutta2(@gx,x0,y0,v0,z0,c0,m0,0.001,0,t0);
 nn=size(y);
 nx=nn(2);
 x(:,nx)
 e2=zeros(1,nx);
de=[30;20;40;25;15;15];

for i=1:nx
    ee=0;
    for j=1:ny
       ee=ee+0.5*(x(j,i)-de(j))^2; 
    end
  e2(i)=ee;
    
end
figure(5)
plot(t,e5,'r--',t,e2,'k-.','linewidth',1)
 axis([0 max(t) min(min(min(e5),min(e2)))-0.5 max(max(max(e5),max(e2)))]);
 xlabel('t(s)')
 ylabel('Error \ite')
 legend('Fully connected network','Net in Fig. 1')
 set(gca,'Fontname','times new roman')
 set(gca,'FontSize',14); 
xx=1:nx;
figure(1)
  plot(t,x(1,:),'r',t,x(2,:),'b-.',t,x(3,:),'g--',t,x(4,:),':r','linewidth',1)
  axis([0 max(t) min(min(x))-3 max(max(x))]);
 hold on 
  plot(t,x(5,:),'-s',"MarkerIndices",[1 2 3 4 5 10 20 2000 8000 12000 20000 30000 40000 50000 70000 100000 200000 300000],'linewidth',1)
  plot(t,x(6,:),'-*',"MarkerIndices",[1 2 3 4 5 10 20 2000 8000 12000 20000 30000 40000 50000 70000 100000 200000 300000],'linewidth',1)
  
  xlabel('\it{t}\rm(s)')
 ylabel('Decision variable \itx_i')
 h1=legend('\itx_1','\itx_2','\itx_3','\itx_4','\itx_5','\itx_6','NumColumns',2);
 set(h1,'Orientation','horizon')
 set(gca,'Fontname','times new roman')
 set(gca,'FontSize',9);
 hold off
 
% figure(2)
%  plot(t,z(1,:),'r',t,z(2,:),'b',t,z(3,:),'g',t,z(4,:),'-.r',t,z(5,:),'-.b',t,z(6,:),'-.g')
%   axis([0 max(t) min(min(z)) max(max(z))]);
%  xlabel('t/s')
%  ylabel('resource variable z_i')
%  legend('agent 1','agent 2','agent 3','agent 4','agent 5','agent 6')
% 
%  figure(3)
%    plot(t,c(1,:),'r',t,c(2,:),'b-.',t,c(3,:),'g--',t,c(4,:),':r','linewidth',1)
%   axis([0 max(t) min(min(c)) max(max(c))]);
%  hold on 
%   plot(t,c(5,:),'-s',"MarkerIndices",[1 2 3 4 5 10 20 2000 8000 12000 20000 30000 40000 50000 70000 100000 200000 300000],'linewidth',1)
%   plot(t,c(6,:),'-*',"MarkerIndices",[1 2 3 4 5 10 20 2000 8000 12000 20000 30000 40000 50000 70000 100000 200000 300000],'linewidth',1)
%   
%   xlabel('\it{t}\rm(s)')
%  ylabel('Dual variable \it\eta_i')
%  h1=legend('\it\eta_1','\it\eta_2','\it\eta_3','\it\eta_4','\it\eta_5','\it\eta_6','NumColumns',2);
%  set(h1,'Orientation','horizon')
%  set(gca,'Fontname','times new roman')
%  set(gca,'FontSize',9);
%  hold off
% figure(4)
%   plot(t,y(1,:),'r',t,y(2,:),'b-.',t,y(3,:),'g--',t,y(4,:),':r','linewidth',1)
%   axis([0 max(t) min(min(y)) max(max(y))+2]);
%  hold on 
%   plot(t,y(5,:),'-s',"MarkerIndices",[1 2 3 4 5 10 20 2000 8000 12000 20000 30000 40000 50000 70000 100000 200000 300000],'linewidth',1)
%   plot(t,y(6,:),'-*',"MarkerIndices",[1 2 3 4 5 10 20 2000 8000 12000 20000 30000 40000 50000 70000 100000 200000 300000],'linewidth',1)
%   
%   xlabel('\it{t}\rm(s)')
%  ylabel('Dual variable \it\lambda_i')
%  h1=legend('\it\lambda_1','\it\lambda_2','\it\lambda_3','\it\lambda_4','\it\lambda_5','\it\lambda_6','NumColumns',2);
%  set(h1,'Orientation','horizon')
%  set(gca,'Fontname','times new roman')
%  set(gca,'FontSize',9);
%  hold off

%  figure(5)
%  plot(t,v(1,:),'r',t,v(2,:),'b',t,v(3,:),'g',t,v(4,:),'-.r',t,v(5,:),'-.b',t,v(6,:),'-.g')
%   axis([0 max(t) min(min(v)) max(max(v))]);
%  xlabel('t/s')
%  ylabel('variable v_i')
%  legend('agent 1','agent 2','agent 3','agent 4','agent 5','agent 6')

%  figure(6)
%  plot(t,sum(x),'r',t,sum(diag(bb1)*x.^2)+sum(d),'m-.','linewidth',1)
%    axis([0 max(t) 0 220]);
%    xlabel('\it{t}\rm(s)')
%  ylabel('Total output')
%  h1=legend('$\sum_{i=1}^nx_i$','$\sum_{i=1}^n(B_ix_i^2+d_i)$','Interpreter', 'latex','NumColumns',1);
%  set(h1,'Orientation','horizon')
%  set(gca,'Fontname','times new roman')
%  set(gca,'FontSize',9);
%  hold off
 x0=x(:,nx);
 %x0=[20;20;40;25;15;25];
 %x0=[23.5;35;50;31;43.72;31.81];
 g=0;
 g=0.001*x0(1)^4-0.1*x0(1)^3+3.699*x0(1)^2-59.96*x0(1)+479.6+x0(2)^2-40*x0(2)+460+x0(3)^2-80*x0(3)+1689;
 g=g+x0(4)^2-50*x0(4)+670+x0(5)^2-30*x0(5)+286+0.002*x0(6)^4-0.16*x0(6)^3+4.6980*x0(6)^2-59.9*x0(6)+380;
% for i=1:ny
%    g=g+a1(i)*x0(i)^2+a1(i)*abs(x0(i)-a3(i)); 
% end
g
%%        options = odeset('RelTol',1e-6,'AbsTol',1e0*[1e-7 1e-7 1e-7 1e-7],'Events',@Foot_Impact,'Refine',refine);
 %%  [t,x,te,xe,ie] = ode45(@CompassBipedalRobotModel,[t_initial t_initial+1],x1,options);
