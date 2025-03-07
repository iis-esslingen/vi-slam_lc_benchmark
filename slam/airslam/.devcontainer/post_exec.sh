#!/bin/bash

mkdir -p /workspace/catkin_ws/src

if [ ! -d "/workspace/catkin_ws/src/AirSLAM" ]; then
    cd /workspace/catkin_ws/src
    echo "Cloning AirSLAM repository..."
    git clone https://github.com/sair-lab/AirSLAM.git
else
    echo "AirSLAM repository already exists."
fi

cd  /workspace/catkin_ws
catkin_make
source devel/setup.bash