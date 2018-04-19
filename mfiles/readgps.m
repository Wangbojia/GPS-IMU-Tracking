% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath '/usr/local/share/java/lcm.jar'
javaaddpath '/home/jia/my_robot/lcmtypes/gps.jar'

log_file = lcm.logging.Log('/home/jia/my_robot/lab3data/better_log','r'); 

utmx = [];
utmy = [];
i=1;
while true
 try
   ev = log_file.readNext();

   if strcmp(ev.channel, 'gps_talker') 
      gps = gps_msg.gps(ev.data);
      alt = gps.alt;
      lon = gps.lon;
      lat = gps.lat;
      utmx(i) = gps.utm_x-3.22*10^5;
      utmy(i) = gps.utm_y-4.7115*10^6;
      timestamp = gps.utc_time;  
      disp(gps.utm_x);
      i = i+1;
   end
  catch err  
     break;
  end
end
plot(utmx,utmy)

xlabel('utmx')
ylabel('utmy')

legend('gpsplot')