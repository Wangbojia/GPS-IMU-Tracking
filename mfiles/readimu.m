javaaddpath '/usr/local/share/java/lcm.jar'
javaaddpath '/home/jia/my_robot/lcmtypes/imu.jar'


log_file = lcm.logging.Log('/home/jia/my_robot/lab3data/better_log','r');

i=1;

while true

 try

   ev = log_file.readNext();

   % channel name is in ev.channel

   if strcmp(ev.channel, 'imu_talker') %read data from channel 'imu_talker'


      imu = imu_msg.imu(ev.data); 

      % get data corresponding to imu structure

      yaw(1,i) = imu.yaw;
      pitch(1,i) = imu.pitch;
      roll(1,i) = imu.roll;
      magn_x(1,i) = imu.magn_x;
      magn_y(1,i) = imu.magn_y;
      magn_z(1,i) = imu.magn_z;    
      accl_x(1,i) = imu.accl_x;
      accl_y(1,i) = imu.accl_y;
      accl_z(1,i) = imu.accl_z;
      gyro_x(1,i) = imu.gyro_x;
      gyro_y(1,i) = imu.gyro_y;
      gyro_z(1,i) = imu.gyro_z;
      
      ts(1,i) = ev.utime/1e+6-1.51946*10^9+4.4*10^4; % (timestamp in microseconds since the epoch)
      time(1,i)=datetime(ev.utime/1e+6, 'ConvertFrom', 'posixtime'); %convert utime to real time
      disp(imu.accl_x);
      i=i+1;
    end

  catch err   % exception will be thrown when you hit end of file

     break;

  end

end

plot(time,yaw);
hold on
plot(time,pitch);
hold on
plot(time,roll);
legend('yaw','pitch','roll')

%histogram(accl_x)
%histfit(accl_x)
%histfit(accl_y)
%histfit(accl_z)
%histfit(gyro_x)
%histfit(gyro_y)
%histfit(gyro_z)