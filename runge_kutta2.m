function [t,x,y,v,z,c,m]=runge_kutta2(ufunc,x0,y0,v0,z0,c0,m0,h,a0,b0)%参数表顺序依次是微分方程组的函数名称，初始值向量，步长，时间起点，时间终点（参数形式参考了ode45函数）
global ey ye L q kappa ti tt ny
n=floor((b0-a0)/h);%求步数 
t(1)=a0;%时间起点
x(:,1)=x0;  
z(:,1)=z0;
y(:,1)=y0;
v(:,1)=v0;
c(:,1)=c0;
m(:,1)=m0;
for ii=1:n
   
    t(ii+1)=t(ii)+h;
    
    [x1,y1,v1,z1,c1,m1]=ufunc(t(ii),x(:,ii),y(:,ii),v(:,ii),z(:,ii),c(:,ii),m(:,ii));
    [x2,y2,v2,z2,c2,m2]=ufunc(t(ii)+h/2,x(:,ii)+h*x1/2,y(:,ii)+h*y1/2,v(:,ii)+h*v1/2,z(:,ii)+h*z1/2,c(:,ii)+h*c1/2,m(:,ii)+h*m1/2);
    [x3,y3,v3,z3,c3,m3]=ufunc(t(ii)+h/2,x(:,ii)+h*x2/2,y(:,ii)+h*y2/2,v(:,ii)+h*v2/2,z(:,ii)+h*z2/2,c(:,ii)+h*c2/2,m(:,ii)+h*m2/2);
    [x4,y4,v4,z4,c4,m4]=ufunc(t(ii)+h,x(:,ii)+h*x3,y(:,ii)+h*y3,v(:,ii)+h*v3,z(:,ii)+h*z3,c(:,ii)+h*c3,m(:,ii)+h*m3);

     
    
  
      x(:,ii+1)=x(:,ii)+h*(x1+2*x2+2*x3+x4)/6;
      z(:,ii+1)=z(:,ii)+h*(z1+2*z2+2*z3+z4)/6;
      y(:,ii+1)=y(:,ii)+h*(y1+2*y2+2*y3+y4)/6;
      v(:,ii+1)=v(:,ii)+h*(v1+2*v2+2*v3+v4)/6;
      c(:,ii+1)=c(:,ii)+h*(c1+2*c2+2*c3+c4)/6;
      m(:,ii+1)=m(:,ii)+h*(m1+2*m2+2*m3+m4)/6;
     
     
      
end
end