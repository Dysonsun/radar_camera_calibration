/*************************************************************************
    > File Name: main.cpp
    > Author: hegaozhi
    > Mail: hzg@szlanyou.com 
    > Created Time: 2021年02月26日 星期五 15时55分46秒
 ************************************************************************/

#include "radar_camera_calibration/DatasetTypes.hpp"
#include "radar_camera_calibration/utils.hpp"

#include "radar_camera_calibration/RadarDirectoryConverter.hpp"
#include "radar_camera_calibration/RadarDirectoryConverterPointCloud.hpp"

#include <array>
#include <iostream>
#include <regex>
#include <string>

#include <std_msgs/String.h>
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;
using namespace  radar_camera_calibration;
int main(const int argc, const char* argv[])
{
    fs::path sampleFilePath = "/home/hegaozhi/hegaozhi/tools/calibrate/data/lidar_radar_camera/radar/1.pcd";

    auto radarObjects = readRadarFile(sampleFilePath);
    auto msgPointCloud = readRidarFilePointCloud(sampleFilePath);
    
    double minx=99999,miny=99999,maxx=-9999,maxy=-9999;
    for(int i=0; i< (*radarObjects).objects.size(); i++)
    {
        if((*radarObjects).objects[i].pose.x > maxx)
            maxx = (*radarObjects).objects[i].pose.x;
            
        if((*radarObjects).objects[i].pose.x < minx)
            minx = (*radarObjects).objects[i].pose.x;
        
        
        if((*radarObjects).objects[i].pose.y > maxy)
            maxy = (*radarObjects).objects[i].pose.y;
            
        if((*radarObjects).objects[i].pose.y < miny)
            miny = (*radarObjects).objects[i].pose.y;
            
      cout<<  (*radarObjects).objects[i].pose.x << ","<<  (*radarObjects).objects[i].pose.y << ","<<  (*radarObjects).objects[i].pose.z <<endl;
    }
   
    cout<< maxx << "," << minx <<","<<maxy<<","<< miny << endl;
    
    cv::Mat img(700, 700, CV_32FC3, cv::Scalar(255, 255,255));  //创建一副图像
    double x_scale, y_scale;
    x_scale = img.rows/( maxx - minx + 20);
    y_scale = img.cols/( maxy - miny + 20);
    for(int i=0; i< (*radarObjects).objects.size(); i++)
    {
        int posex =  ( (*radarObjects).objects[i].pose.x - minx + 10 ) * x_scale;
        int posey = img.rows - ( (*radarObjects).objects[i].pose.y - miny + 10 ) * y_scale;
 
        circle(img, Point(posex, posey), 10, Scalar(255, 0, 0), -1, 8);
    }
    // CV_WINDOW_NORMAL CV_WINDOW_AUTOSIZE
    namedWindow("radar", CV_WINDOW_AUTOSIZE);
    imshow("radar", img);
    cv::waitKey(0);

 return 0;
}

