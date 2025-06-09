
<h1 align="center">
  Visual‐Inertial SLAM for Unstructured Outdoor Robotics: Benchmarking the Benefits and Computational Costs of Loop Closing

  [![arXiv](https://img.shields.io/badge/arXiv-2408.01716-b31b1b.svg?style=plastic)](https://arxiv.org/abs/2408.01716)
  
</h1>

## Updates

- [x] Upload data.
- [x] Release ORB-SLAM3, HFNet-SLAM, VINS-Fusion, OpenVINS+HLoc, SVO Pro, and AirSLAM docker containers. 
- [ ] Add OpenVINS+VINS-Fusion, OpenVINS+Maplab and Kimera.
- [ ] Release evaluation pipeline.

## Getting Started
The only required software is [Docker](https://www.docker.com/). Each SLAM method comes with its own Docker container, making setup straightforward. We recommend using VSCode with the Docker extension for an enhanced development experience. Additionally, we provide a Docker container with tools for evaluation.

When running the Dockerfiles, the first step is to navigate to the directory where the dataset is stored, as it will be mounted inside the Docker container.

Tested on 22.04 with CUDA 11.7, using NVIDIA A6000.

## Data
The data is a subset of the [ROVER dataset](https://iis-esslingen.github.io/rover/) and can be found [here](https://fdm.hs-esslingen.de/schmidt2025visual/).

## SLAM Methods
Each method is available as a Docker container. When running the Dockerfiles, the first step is to enter the directory where the dataset is stored, as it will be mounted inside the Docker container.


<details><summary>ORB-SLAM3</summary>

We are using [our fork](https://github.com/iis-esslingen/ORB-SLAM3) of the [ORB-SLAM3 ROS Wrapper](https://github.com/thien94/orb_slam3_ros) implementation. 

To launch the application:

```bash
roslaunch orb_slam3_ros <launch_file> \
    do_bag:=<do_bag> bag:=<bag> \
    do_save_traj:=<do_save_traj> \
    traj_file_name:=<traj_file_name> \
    do_lc:=<enable_loop_closing> \
    do_save_resource:=<do_save_traj> \
    resource_file_name:=<traj_file_name> 
```

#### Parameters:

- `launch_file`: Specifies the launch file to use. Choices include:
    - `rover_mono-inertial_t265_internal.launch`: To launch monocular mode.
    - `rover_stereo-inertial_t265_internal.launch`: To launch RGBD mode.

- `do_bag`: *(Optional)* Specifies whether to replay a bag. Set to either:
    - `true`: To replay a bag.
    - `false`: To not replay a bag.

- `bag`: *(Optional)* Specifies the path to the rosbag file.

- `do_save_traj`: *(Optional)* Specifies whether to save a predicted trajectory. Set to either:
    - `true`: To save the trajectory.
    - `false`: To not save the trajectory.

- `traj_file_name`: *(Optional)* Specifies the file path where the estimated trajectory should be saved.

- `do_lc`: *(Optional)* Specifies whether to enable loop closing. Set to either:
    - `true`: To enable loop closing.
    - `false`: To disable loop closing.
 
- `do_save_resource`: *(Optional)* Specifies whether to monitor the resource usage. Set to either:
    - `true`: To save the trajectory.
    - `false`: To not save the trajectory.

- `resource_file_name`: *(Optional)* Specifies the file path where the resource usage file should be saved.
 
</details>

<details><summary>OpenVINS+HLoc</summary>

We are using [our fork](https://github.com/iis-esslingen/OpenVINS) of the official [OpenVINS](https://github.com/rpng/open_vins) implementation. 

To launch the application:

```bash
roslaunch ov_msckf rover_stereo-inertial_t265_internal.launch \
    do_bag:=<do_bag> bag:=<bag> \
    do_save_traj:=<do_save_traj> \
    traj_file_name:=<traj_file_name> \
    do_save_resource:=<do_save_traj> \
    resource_file_name:=<traj_file_name> 
```

#### Parameters:

- `do_bag`: *(Optional)* Specifies whether to replay a bag. Set to either:
    - `true`: To replay a bag.
    - `false`: To not replay a bag.

- `bag`: *(Optional)* Specifies the path to the rosbag file.

- `do_save_traj`: *(Optional)* Specifies whether to save a predicted trajectory. Set to either:
    - `true`: To save the trajectory.
    - `false`: To not save the trajectory.

- `traj_file_name`: *(Optional)* Specifies the file path where the estimated trajectory should be saved.

- `do_save_resource`: *(Optional)* Specifies whether to monitor the resource usage. Set to either:
  - `true`: To save the trajectory.
  - `false`: To not save the trajectory.

- `resource_file_name`: *(Optional)* Specifies the file path where the resource usage file should be saved.

</details>

<details><summary>VINS-Fusion</summary>

We are using [our fork](https://github.com/iis-esslingen/VINS-Fusion) of the official [VINS-Fusion](https://github.com/HKUST-Aerial-Robotics/VINS-Fusion) implementation. 

To launch the application:

```bash
roslaunch vins rover_stereo-inertial_t265_internal.launch \
    do_bag:=<do_bag> bag:=<bag> \
    do_save_traj:=<do_save_traj> \
    traj_file_name:=<traj_file_name> \
    do_lc:=<enable_loop_closing> \
    do_save_resource:=<do_save_traj> \
    resource_file_name:=<traj_file_name> 
```

#### Parameters:

- `do_bag`: *(Optional)* Specifies whether to replay a bag. Set to either:
    - `true`: To replay a bag.
    - `false`: To not replay a bag.

- `bag`: *(Optional)* Specifies the path to the rosbag file.

- `do_save_traj`: *(Optional)* Specifies whether to save a predicted trajectory. Set to either:
    - `true`: To save the trajectory.
    - `false`: To not save the trajectory.

- `traj_file_name`: *(Optional)* Specifies the file path where the estimated trajectory should be saved.

- `do_lc`: *(Optional)* Specifies whether to enable loop closing. Set to either:
    - `true`: To enable loop closing.
    - `false`: To disable loop closing.
 
- `do_save_resource`: *(Optional)* Specifies whether to monitor the resource usage. Set to either:
  - `true`: To save the resource usage.
  - `false`: To not save the resource usage.

- `resource_file_name`: *(Optional)* Specifies the file path where the resource usage file should be saved.

</details>

<details><summary>SVO-Pro</summary>

We are using [our fork](https://github.com/iis-esslingen/SVO-Pro) of the official [SVO-Pro](https://github.com/uzh-rpg/rpg_svo_pro_open) implementation. 

To launch the application:

```bash
roslaunch svo_ros rover_stereo-inertial_t265_internal.launch \
    do_bag:=<do_bag> bag:=<bag> \
    do_save_traj:=<do_save_traj> \
    traj_file_name:=<traj_file_name> \
    do_lc:=<enable_loop_closing> \
    do_save_resource:=<do_save_traj> \
    resource_file_name:=<traj_file_name> 
```

#### Parameters:

- `do_bag`: *(Optional)* Specifies whether to replay a bag. Set to either:
    - `true`: To replay a bag.
    - `false`: To not replay a bag.

- `bag`: *(Optional)* Specifies the path to the rosbag file.

- `do_save_traj`: *(Optional)* Specifies whether to save a predicted trajectory. Set to either:
    - `true`: To save the trajectory.
    - `false`: To not save the trajectory.

- `traj_file_name`: *(Optional)* Specifies the file path where the estimated trajectory should be saved.

- `do_lc`: *(Optional)* Specifies whether to enable loop closing. Set to either:
    - `true`: To enable loop closing.
    - `false`: To disable loop closing.
 
- `do_save_resource`: *(Optional)* Specifies whether to monitor the resource usage. Set to either:
  - `true`: To save the resource usage.
  - `false`: To not save the resource usage.

- `resource_file_name`: *(Optional)* Specifies the file path where the resource usage file should be saved.

</details>

<details><summary>HFNet-SLAM</summary>
Coming soon.
</details>

<details><summary>AirSLAM</summary>
Coming soon.
</details>

## Evaluation
Coming soon.

## Citing
If you find our work useful, please consider citing:
```bibtex
@article{schmidt2025visual,
  title={Visual-Inertial SLAM for Unstructured Outdoor Environments: Benchmarking the Benefits and Computational Costs of Loop Closing},
  author={Schmidt, Fabian and Blessing, Constantin and Enzweiler, Markus and Valada, Abhinav},
  journal={Journal of Field Robotics},
  year={2025},
  publisher={Wiley Online Library}
}


```
and the dataset used:
```bibtex
@article{schmidt2024rover,
  title={ROVER: A Multi-Season Dataset for Visual SLAM}, 
  author={Fabian Schmidt and Constantin Blessing and Markus Enzweiler and Abhinav Valada},
  year={2024},
  eprint={2412.02506},
  archivePrefix={arXiv},
  primaryClass={cs.RO},
  url={https://arxiv.org/abs/2412.02506}, 
}
```
