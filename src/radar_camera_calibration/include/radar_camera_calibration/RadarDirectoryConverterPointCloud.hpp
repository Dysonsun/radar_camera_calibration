#pragma once

#include "radar_camera_calibration/Filesystem.hpp"
#include "sensor_msgs/PointCloud2.h"
#include <pcl_ros/point_cloud.h>
#include "radar_camera_calibration/PclRadarObject.hpp"

#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>


namespace radar_camera_calibration {

boost::optional<sensor_msgs::PointCloud2> readRidarFilePointCloud(const fs::path& filePath);

}
