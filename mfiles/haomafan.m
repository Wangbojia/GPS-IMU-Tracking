% xdata = magn_x' ;
% ydata = magn_y' ;
% XY( : ,1)=xdata;
% XY( : ,2)=ydata;
% AA=EllipseDirectFit(XY);
% % syms x y A B C D E F %作图
% % % f =A* x.^2+B* x.*y+C* y.^2+D*x+ Ey+F;
% % f =A* x^2+B* x*y+C* y^2+D*x+ E*y+F;
% % f = subs( f , [ A B C D E F] , AA' );
% % f = simplify(f);
% % clf , ezplot(f,[-5 0 5 10])
% % ezplot(f,[-5 0 5 10])
% % hold on ;
% % scatter( xdata ,ydata,1)
% % title('椭圆拟合')
% % fitellipse

% ezplot('-0.8075*x^2-0.1416*x*y-0.5324*y^2-0.0137*x-0.2096*y+0.0204 = 0')
% axis([-0.5, 0.5, -1, 0.5])
% 
% title('mag_correction')
% xlabel('mx')
% ylabel('my')

xo=-AA(1,1)/(2*AA(4,1));
yo=-AA(3,1)/(2*AA(5,1));
xm=magn_x+xo;
ym=magn_y+yo;
% for i=1:44619
%     if 0.03<magn_x(1,i)^2+(magn_y(1,i)+0.2)^2<0.05
%         xm(1,i)=magn_x(1,i);
%         ym(1,i)=magn_y(1,i);
%         disp(xm(1,i));
%     end
% end
scatter(xm,ym,1)        
% mgx=magn_x+xo;
% mgy=magn_y-yo;
% plot((magn_x-0.008),(magn_y+0.2))