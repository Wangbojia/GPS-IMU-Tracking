yaw1=cumtrapz(ts,gyro_modified);
yaw11=rad2deg(yaw1);
yaw111=[];
        
yaw111 = mod(yaw11+176.249,360);
for i=1:44619
    if yaw111(1,i)>180
        yaw111(1,i)=yaw111(1,i)-360;
    end
end
plot(ts,yaw111)
title('yaw by gyro_modified')
xlabel('time')
ylabel('yaw/angle')
% hold on
% yaw2=cumtrapz(ts,gyro_modified);
% plot(ts,yaw2)

unwrap