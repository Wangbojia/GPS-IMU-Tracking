goodx = (magn_x-xoffset)/alpha;
goody = (magn_y-yoffset)/alpha;
% plot(ts,rad2deg (atan2(-goody,goodx)))
dis = (atan2(-goody,goodx))*180/pi-50;
for i=1:44619
    if dis(1,i)<-180
       dis(1,i)=dis(1,i)+360;
    end
end
plot(ts,dis)
hold on
plot(ts,yaw)
hold on
plot(ts,yaw111)
xlabel('time')
ylabel('yaw angle')
legend('yaw by mag','yaw direct','yaw by gyro')