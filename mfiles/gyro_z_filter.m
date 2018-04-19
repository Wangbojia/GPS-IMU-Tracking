[b,a]=butter(1,0.5);
gyro_modified = filter(b,a,gyro_z);
figure(1)
plot(ts,gyro_z);
hold on
plot(ts,gyro_modified)

legend('gyro_z','filtered gyro_z')
xlabel('time')
ylabel('gyro')