import lcm
import time
import serial

import sys
sys.path.append('/home/jia/my_robot/lcmtypes')

from imu_msg import imu

lc = lcm.LCM()
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout = 1)
msg = imu()
while 1:    
  line = ser.readline()
  line = line.split(',')
  if line[0] == '$VNYMR':
    msg.yaw = float(line[1])
    msg.pitch = float(line[2])
    msg.roll = float(line[3])
    msg.magn_x = float(line[4])
    msg.magn_y = float(line[5])
    msg.magn_z = float(line[6])
    msg.accl_x = float(line[7])
    msg.accl_y = float(line[8])
    msg.accl_z = float(line[9])
    msg.gyro_x = float(line[10])
    msg.gyro_y = float(line[11])
    line2 = line[12].split('*')
    msg.gyro_z = float(line2[0])
  lc.publish("imu_talker", msg.encode())
