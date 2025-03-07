#!/bin/bash

mkdir -p /workspace/catkin_ws/src

if [ ! -d "/workspace/catkin_ws/src/VINS-Fusion" ]; then
    cd /workspace/catkin_ws/src
    echo "Cloning VINS-Fusion repository..."
    git clone https://github.com/iis-esslingen/VINS-Fusion.git
    git checkout vi-bench
else
    echo "VINS-Fusion repository already exists."
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