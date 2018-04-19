%coordinate change
theta = deg2rad(yaw);
a_xe = accl_x.*sin(theta);
a_ye = accl_y.*cos(theta);
ae = a_xe+a_ye;

a_xn = accl_x.*cos(theta);
a_yn = accl_y.*sin(theta);
an = a_xn+a_yn;

% v_n=cumtrapz(ts, an)+40.4854;
% v_e=cumtrapz(ts, ae)-51.2974;

v_n=cumtrapz(ts, an);
v_e=cumtrapz(ts, ae);


%linear fit to get error propotional to t
figure(1)
para1 = polyfit(ts,v_n,1); 
linfit1 = polyval(para1,ts);
v_nm = v_n-linfit1;
plot(ts,v_nm)
xlabel('time')
ylabel('velocity')
title('v in NS')

figure(2)
para2 = polyfit(ts,v_e,1);
linfit2 = polyval(para2,ts);
v_em=v_e-linfit2;
plot(ts,v_em)
xlabel('time')
ylabel('velocity')
title('v in EW')

s_n=cumtrapz(ts,v_nm);
s_e=cumtrapz(ts,v_em);

figure(3)
plot(ts,s_n)
hold on
plot(ts,s_e)
title('displacement')
xlabel('time')
ylabel('displacement')
legend('dis_ns','dis_ew')

figure(4)
plot(s_e,s_n)
xlabel('dis-ew /m')
ylabel('dis-ns /m')