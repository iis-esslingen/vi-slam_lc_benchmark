#!/bin/bash

mkdir -p /workspace/catkin_ws/src

if [ ! -d "/workspace/catkin_ws/src/SVO-Pro" ]; then
    cd /workspace/catkin_ws/src
    echo "Cloning SVO-Pro repository..."
    git clone https://github.com/iis-esslingen/SVO-Pro.git
    git checkout vi-bench

    catkin config --init --mkdirs --extend /opt/ros/noetic --cmake-args -DCMAKE_BUILD_TYPE=Release -DEIGEN3_INCLUDE_DIR=/usr/include/eigen3

    cd /workspace/catkin_ws/src/SVO-Pro/rpg_svo_pro_open/svo_online_loopclosing/vocabularies && ./download_voc.sh
else
    echo "SVO-Pro repository already exists."
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
