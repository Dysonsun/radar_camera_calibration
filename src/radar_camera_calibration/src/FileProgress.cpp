#include "radar_camera_calibration/FileProgress.hpp"
#include <iostream>

namespace radar_camera_calibration {

FileProgress::FileProgress()
  : processedFiles(0)
  , toProcessFiles(0)
{}

void
FileProgress::addToProcess(uint32_t toProcess)
{
  toProcessFiles += toProcess;
}

void
FileProgress::addToProcessed(uint32_t processed)
{
  processedFiles += processed;
}

float
FileProgress::getProgressPercentage()
{
  return ((double)processedFiles) / toProcessFiles;
}

}
