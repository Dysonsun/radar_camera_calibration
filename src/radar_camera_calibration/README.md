[中文文档](doc/校准原理.pdf)
[在线参考文档](https://blog.csdn.net/hgz_gs/article/details/114288657)


radar_camera_calibration Package
===========================================

# 简介
通过滑动窗口方式对毫米波和摄像机进行联合标定。


## 软件包安装 
    安装ros，和eigen，pcl库
    sudo cp lib/libraca_calibrate_core.so  /usr/lib

### 编译

```sh
    mkdir build
    cd build
    catkin_make --source ..
```
    
### 校准程序运行与参数说明

```
source devel/setup.bash
./devel/lib/radar_camera_calibration/radar_camera_calibration
```
