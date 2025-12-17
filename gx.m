function [dx,dy,dv,dz,dc,dm]=gx(t,x,y,v,z,c,m)
global  L d  ny bl bu 
 
  alpha=1;
  beta=10;
  gamma=100;
  mu=0.5;
    dy=zeros(ny,1);
    dz=zeros(ny,1);
    dc=zeros(ny,1);
    dd=zeros(ny,1);
    dd(1)=0.004*x(1)^3-0.3*x(1)^2+3.699*2*x(1)-59.96; 
    dd(2)=2*x(2)-40;
    dd(3)=2*x(3)-80;
    dd(4)=2*x(4)-50;
    dd(5)=2*x(5)-30;
    dd(6)=0.008*x(6)^3-0.48*x(6)^2+4.698*2*x(6)-59.9;
    
    yy=zeros(ny,1);  
    for i=1:ny
       yy(i)=ones(1,ny)*v((ny*(i-1)+1):(ny*(i-1)+ny))/ny; 
    end
    dx=x-dd-beta*yy-m;
    for i=1:ny
       dx(i)=max(bl(i),min(bu(i),dx(i))); 
    end
    dx=-x+dx;  
    dm=yy-L*m;  
    
  
    phi=zeros(ny*ny,1);
    ei=zeros(ny*ny,1);
    for i=1:ny
          ei(ny*(i-1)+i)=v(ny*(i-1)+i)-x(i)+d(i); 
    end
    phi=kron(L,eye(ny))*v+ei;
    dv=zeros(ny*ny,1);
    for i=1:ny*ny
       dv(i)=-alpha*abs(phi(i))^mu*sign(phi(i))-gamma*sign(ei(i));
    end
     
end