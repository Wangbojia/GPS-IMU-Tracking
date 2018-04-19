#/usr/bin/env bash
sudo chmod 666 /dev/ttyUSB0
export CLASSPATH=$PWD

lcm-logger --auto-split-hours=0.5 -s ./data/lcm-log-%F-%T &
lcm-logger -s ./log/lcm-log-%F-%T &
lcm-spy & 


kill %1 %2 %3 # %4 %5 %6 %7 %8 %9
