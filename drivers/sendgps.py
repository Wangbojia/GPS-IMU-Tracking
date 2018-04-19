import lcm
import time
import serial
import utm

import sys
sys.path.append('/home/jia/my_robot/lcmtypes')
from gps_msg import gps

lc = lcm.LCM()
ser = serial.Serial('/dev/ttyUSB0', 4800, timeout = 1)
msg = gps()
while 1:    
  line = ser.readline()
  line = line.split(',')
  if line[0] == '$GPGGA':
    msg.utc_time = float(line[1])
    msg.lat = float(line[2])/100
    #msg.latindex = str(line[3])
    msg.lon = float(line[4])/100
    #msg.lonindex = str(line[5])
    msg.alt = float(line[9])
    utms = utm.from_latlon(float(msg.lat),float(msg.lon))
    msg.utm_x = float(utms[0])
    msg.utm_y = float(utms[1])

  lc.publish("gps_talker", msg.encode())
