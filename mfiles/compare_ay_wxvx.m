zzz = gyro_z.*v_xm;
zzzz = zzz-accl_y;
figure(1)
plot(ts,zzz)
xlabel('time')
ylabel('w * v_x')
title('w * v_x - t')
figure(2)
plot(ts,accl_y)
xlabel('time')
ylabel('accl_y')
title('accl_y - t')

figure(3)
plot(ts,zzzz)
xlabel('time')
ylabel('difference')
title('accl_y - w * v_x')