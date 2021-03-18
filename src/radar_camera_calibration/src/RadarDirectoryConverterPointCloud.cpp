#include "radar_camera_calibration/RadarDirectoryConverterPointCloud.hpp"
#include "radar_camera_calibration/utils.hpp"
#include <exception>

using namespace sensor_msgs;
using namespace std;

namespace radar_camera_calibration {

boost::optional<sensor_msgs::PointCloud2>
readRidarFilePointCloud(const fs::path& filePath)
{
  
  const auto fileName = filePath.string();
  pcl::PointCloud<PclRadarObject>::Ptr cloud(
    new pcl::PointCloud<PclRadarObject>);

  if (pcl::io::loadPCDFile<PclRadarObject>(fileName, *cloud) ==
      -1) //* load the file
  {
    std::string error = "Could not read ";
    error += fileName;
    cout << error << endl;
    // PCL_ERROR(error);

    return boost::none;
  }
  
  sensor_msgs::PointCloud2 cloud2;
  pcl::toROSMsg(*cloud,cloud2); //point cloud msg -> ROS msg
  cloud2.header.frame_id = std::string("lidar");

  return boost::optional<sensor_msgs::PointCloud2>(cloud2);
}

}
