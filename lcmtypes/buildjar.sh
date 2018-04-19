#!/bin/sh

# try to automatically determine where the LCM java file is
LCM_JAR=`pkg-config --variable=classpath lcm-java`
if [ $? != 0 ] ; then
    if [ -e /usr/local/share/java/lcm.jar ] ; then
        LCM_JAR=/usr/local/share/java/lcm.jar
    else
        if [ -e ../../lcm-java/lcm.jar ] ; then
            LCM_JAR=../../lcm-java/lcm.jar
        fi
    fi
fi

lcm-gen -j *.lcm

javac -cp $LCM_JAR gps_msg/*.java
javac -cp $LCM_JAR imu_msg/*.java

jar cf gps.jar gps_msg/*.class
jar cf imu.jar imu_msg/*.class
