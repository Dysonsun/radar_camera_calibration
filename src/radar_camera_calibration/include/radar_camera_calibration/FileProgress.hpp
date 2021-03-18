#pragma once 

#include <atomic>

namespace radar_camera_calibration {

class FileProgress {
    public:
        FileProgress();

        void addToProcess(uint32_t toProcess);

        void addToProcessed(uint32_t processed);

        float getProgressPercentage();

    public:
        std::atomic<uint32_t> processedFiles;
        std::atomic<uint32_t> toProcessFiles;
};

}
