#!/bin/bash

mkdir -p /workspace/catkin_ws/src

if [ ! -d "/workspace/catkin_ws/src/ORB-SLAM3" ]; then
    cd /workspace/catkin_ws/src
    echo "Cloning ORB-SLAM3 repository..."
    git clone https://github.com/iis-esslingen/ORB-SLAM3.git
    git checkout vi-bench
else
    echo "ORB-SLAM3 repository already exists."
fi

if [ ! -d "/workspace/catkin_ws/src/cpu_monitor" ]; then
    cd /workspace/catkin_ws/src

    echo "Cloning cpu_monitor repository..."
    cd /workspace/catkin_ws/src
    git clone https://github.com/iis-esslingen/cpu_monitor.git
else
    echo "cpu_monitor repository already exists."
fi

cd /workspace/catkin_ws
source /opt/ros/noetic/setup.bash

echo "Building the catkin workspace..."
catkin build
