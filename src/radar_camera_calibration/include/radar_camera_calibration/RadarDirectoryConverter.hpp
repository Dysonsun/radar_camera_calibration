#pragma once

#include "radar_camera_calibration/RadarObjects.h"
#include "radar_camera_calibration/PclRadarObject.hpp"
#include "radar_camera_calibration/Filesystem.hpp"

namespace radar_camera_calibration {

boost::optional<radar_camera_calibration::RadarObjects> readRadarFile(const fs::path& filePath);

}
