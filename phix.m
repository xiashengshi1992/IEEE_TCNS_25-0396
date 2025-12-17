function dx=phix(x)
%ep=1/18;
ep=0.001;
xmin=[0 0 0 0 0];
xmax=[80 70 70 70 80];
a1=[0.04 0.03 0.035 0.03 0.04];
a2=[2 3 4 4 2.5];

dx=zeros(5,1);
      for i=1:5
         if(x(i)<xmin(i))
             dx(i)=2*a1(i)*x(i)+a2(i)-1/ep;
         elseif(x(i)>xmax(i))
             dx(i)=2*a1(i)*x(i)+a2(i)+1/ep;             
         else
             dx(i)=2*a1(i)*x(i)+a2(i);
         end
          
      end
end