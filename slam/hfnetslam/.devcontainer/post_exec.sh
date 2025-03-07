#!/bin/bash


mkdir -p /workspace/catkin_ws/src


if [ ! -d "/workspace/catkin_ws/src/Pangolin" ]; then
    cd /workspace/catkin_ws/src

    git clone --branch v0.9.0 --depth 1 https://github.com/stevenlovegrove/Pangolin.git
    cd Pangolin
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    sudo make install
    sudo ldconfig
else
    echo "Pangolin repository already exists."
fi

if [ ! -d "/workspace/catkin_ws/src/HFNet_SLAM" ]; then
    cd /workspace/catkin_ws/src

    echo "Cloning HFNet_SLAM repository..."
    cd /workspace/catkin_ws/src
    git clone --recursive https://github.com/LiuLimingCode/HFNet_SLAM.git
    cd HFNet_SLAM
    ./build.sh
    ./build_ros.sh
else
    echo "HFNet_SLAM repository already exists."
fi