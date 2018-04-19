x = ts;

figure(2)
y2 = accl_x;
v_x = cumtrapz(x,y2);
%linear fit to get error propotional to t
pp = polyfit(x,v_x,1); 
ff = polyval(pp,x);
v_xm = v_x-ff;
%the revised v_x is v_xm
plot(ts,v_xm)
xlabel('time')
ylabel('velocity_x')
legend('v_x-t')
 
figure(3)
y3 = v_x-ff;
disp_x = cumtrapz(x,y3);
plot(x,disp_x)
xlabel('time')
ylabel('disp_x')
legend('disp_x-t')

figure(4)
y4 = accl_y;
v_y = cumtrapz(x,y4);
%linear fit to get error propotional to t
pp2 = polyfit(x,v_y,1); 
ff2 = polyval(pp2,x);
%the revised v_y is v_y-ff2
plot(ts,v_y-ff2)
xlabel('time')
ylabel('velocity_y')
legend('v_y-t')

figure(5)
y5 = v_y-ff2;
disp_y = cumtrapz(x,y5);
plot(x,disp_y)
xlabel('time')
ylabel('disp_y')
legend('disp_y-t')

figure(6)
plot(disp_x,disp_y)
xlabel('disp_x')
ylabel('disp_y')
legend('track displacement')