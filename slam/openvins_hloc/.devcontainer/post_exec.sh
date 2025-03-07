#!/bin/bash

mkdir -p /workspace/catkin_ws/src

if [ ! -d "/workspace/libtorch" ]; then
    wget https://download.pytorch.org/libtorch/cu116/libtorch-cxx11-abi-shared-with-deps-1.12.1%2Bcu116.zip
    unzip libtorch-cxx11-abi-shared-with-deps-1.12.1+cu116.zip -d /workspace
else
    echo "Libtorch already exists."
fi

if [ ! -d "/workspace/catkin_ws/src/OpenVINS" ]; then
    cd /workspace/catkin_ws/src

    echo "Cloning OpenVINS repository..."
    cd /workspace/catkin_ws/src
    git clone https://github.com/iis-esslingen/OpenVINS.git
    git checkout ov_hloc
else
    echo "OpenVINS repository already exists."
fi

if [ ! -d "/workspace/catkin_ws/src/ov_hloc" ]; then
    cd /workspace/catkin_ws/src

    echo "Cloning OV_HLOC repository..."
    cd /workspace/catkin_ws/src
    git clone https://github.com/iis-esslingen/ov_hloc.git

    mkdir -p /workspace/catkin_ws/src/ov_hloc/support_files/Networks/weights
    cd /workspace/catkin_ws/src/ov_hloc/support_files/Networks/weights
    curl -L -O https://github.com/magicleap/SuperGluePretrainedNetwork/raw/master/models/weights/superglue_indoor.pth
    curl -L -O https://github.com/magicleap/SuperGluePretrainedNetwork/raw/master/models/weights/superglue_outdoor.pth
    curl -L -O https://github.com/magicleap/SuperGluePretrainedNetwork/raw/master/models/weights/superpoint_v1.pth
else
    echo "OV_HLOC repository already exists."
fi

if [ ! -d "/workspace/catkin_ws/src/cpu_monitor" ]; then
    cd /workspace/catkin_ws/src

    echo "Cloning cpu_monitor repository..."
    cd /workspace/catkin_ws/src
    git clone https://github.com/iis-esslingen/cpu_monitor.git
else
    echo "cpu_monitor repository already exists."
fi

if [ ! -d "/workspace/catkin_ws/src/ov_hloc/support_files/models" ]; then
    mkdir -p /workspace/catkin_ws/src/ov_hloc/support_files/models
    cd /workspace/catkin_ws/src/ov_hloc/support_files
    python3 convert_model.py
else
    echo "cpu_monitor repository already exists."
fi

cd /workspace/catkin_ws
catkin build
source devel/setup.bash