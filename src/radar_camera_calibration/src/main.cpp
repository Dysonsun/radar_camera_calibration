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
#include "radar_camera_calibration/raca_calibrate_core.hpp"

#include <array>
#include <iostream>
#include <regex>
#include <string>

#include <std_msgs/String.h>
#include <opencv2/opencv.hpp>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <vector>

#include <string> 
#include <fstream> 

using namespace Eigen;
using namespace std;
using namespace cv;
using namespace  radar_camera_calibration;

vector<double> point_data;                      // 毫米波原始数据: std:vector容器格式
cv::Mat  dst_img;                               // 毫米波雷达数据显示在图像上
cv::Mat  piture_img;                            // 相机原始数据
ofstream calibrate_data_save;                   // 校准数据存储
RacaCali * raca_cali = NULL;
/*
    滑动条回调函数
*/
void onChange(int value,void* param)
{

    // cv::Mat srcddd = (*(cv::Mat*)param).clone();
    // 获取相机数据
    dst_img = piture_img.clone();
    
    /* 获取校准数据 */
    float k_wave_offset_x = (-40 - 40.0) / (0-8000.0);
    float b_wave_offset_x = -40.0 - k_wave_offset_x * 0;
    
    float k_wave_offset_y = (-40 - 40.0) / (0-8000.0);
    float b_wave_offset_y = -40.0 - k_wave_offset_y * 0;
    
    float k_wave_offset_z = (-40 - 40.0) / (0-8000.0);
    float b_wave_offset_z = -40.0 - k_wave_offset_z * 0;


    float k_pitch_x = (-180.0-180.0)/(0-3600.0);
    float b_pitch_x = -180.0 - k_pitch_x*0;

    float k_yaw_y = (-180.0-180.0)/(0-3600.0);
    float b_yaw_y = -180.0 - k_yaw_y*0;
    
    float k_roll_z = (-180.0-180.0)/(0-3600.0);
    float b_roll_z = -180.0 - k_roll_z*0;
    
    float offset_x = (float)cv::getTrackbarPos("offset_x/(-40m - 40)m","radar");
    offset_x = k_wave_offset_x * offset_x + b_wave_offset_x;
    
    float offset_y = (float)cv::getTrackbarPos("offset_y/(-40m - 40)m","radar");
    offset_y = k_wave_offset_y * offset_y + b_wave_offset_y;
    
    float offset_z = (float)cv::getTrackbarPos("offset_z/(-40m - 40)m","radar");
    offset_z = k_wave_offset_z * offset_z + b_wave_offset_z;
 

    float pitch_x = (float)cv::getTrackbarPos("pitch_x/(-180° - 180°)","radar");
    pitch_x = k_pitch_x * pitch_x + b_pitch_x;

    float yaw_y = (float)cv::getTrackbarPos("yaw_y/(-180° - 180°)","radar");
    yaw_y = k_yaw_y * yaw_y + b_yaw_y;
    
    float roll_z = (float)cv::getTrackbarPos("roll_z/(-180° - 180°)","radar");
    roll_z = k_roll_z * roll_z + b_roll_z;

    // 在图片上显示校准数据
    char info[256];
    sprintf(info,"offset_x:%.4f",offset_x);
    cv::putText(dst_img,info,cv::Point(0,20),cv::FONT_HERSHEY_SIMPLEX,0.8,cv::Scalar(0,255,0),2);

    sprintf(info,"offset_x:%.4f",offset_y);
    cv::putText(dst_img,info,cv::Point(0,45),cv::FONT_HERSHEY_SIMPLEX,0.8,cv::Scalar(0,255,0),2);

    sprintf(info,"offset_z:%.4f",offset_z);
    cv::putText(dst_img,info,cv::Point(0,70),cv::FONT_HERSHEY_SIMPLEX,0.8,cv::Scalar(0,255,0),2);

    sprintf(info,"pitch_x:%.1f",pitch_x);
    cv::putText(dst_img,info,cv::Point(0,95),cv::FONT_HERSHEY_SIMPLEX,0.8,cv::Scalar(0,255,0),2);

    sprintf(info,"yaw_y:%.1f",yaw_y);
    cv::putText(dst_img,info,cv::Point(0,120),cv::FONT_HERSHEY_SIMPLEX,0.8,cv::Scalar(0,255,0),2);

    sprintf(info,"roll_z:%.1f",roll_z);
    cv::putText(dst_img,info,cv::Point(0,145),cv::FONT_HERSHEY_SIMPLEX,0.8,cv::Scalar(0,255,0),2);
    // 存储校准数据
    calibrate_data_save << fixed << setprecision(8) << \
        offset_x << "," << offset_y << ","<< offset_z << "," << \
        pitch_x << "," << yaw_y << ","<< roll_z << "," << endl; 
    // 打印校准数据
    std::cout   <<  "------"    << endl;
    std::cout   <<  "offset_x:" <<  offset_x  << endl;
    std::cout   <<  "offset_y:" <<  offset_y  << endl;
    std::cout   <<  "offset_z:" <<  offset_z  << endl;
    std::cout   <<  "pitch_x:"  <<  pitch_x   << endl;
    std::cout   <<  "yaw_y:"    <<  yaw_y     << endl;
    std::cout   <<  "roll_z:"   <<  roll_z    << endl;
    // 进行校准     
    std::vector<cv::Point> dst = raca_cali->calibrate( offset_x,  offset_y,  offset_z,  pitch_x,  yaw_y,  roll_z );
    
     // 画中心线
    //line(dst_img, cv::Point(0, (int)dst_img.rows/2 ), cv::Point( dst_img.cols, (int)dst_img.rows/2), Scalar(0, 0, 255), 10);
    //line(dst_img, cv::Point( (int)dst_img.cols/2,0), cv::Point((int)dst_img.cols/2,dst_img.rows), Scalar(255, 0, 0), 10);

    // 在相机中绘制毫米波雷达数据
    for(int i=0; i < dst.size(); i++){
        cv::Point p = dst[i];
        if(p.x >= 0 && p.x <= dst_img.cols && p.y >= 0 && p.y <= dst_img.rows)
            circle(dst_img, p, 5, Scalar(0, 255, 0), -1, 8);
    }
    
    imshow("radar_image", dst_img);
}

int main(const int argc, const char* argv[])
{

    // 创建可视化窗口
    cv::namedWindow("radar_image",CV_WINDOW_NORMAL);
	cv::namedWindow("radar",CV_WINDOW_NORMAL);
    calibrate_data_save.open("./calibrated_sensor.json",  ios::trunc | ios::out );
    // 读取相机数据
    piture_img = imread("/home/sundong/bit_ivrc/test/src/radar_camera_calibration/data/camera/1.jpg");
    // 读取毫米波数据
    fs::path sampleFilePath = "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/data/radar/1.pcd";
    auto radarObjects = readRadarFile(sampleFilePath);
    // 获取x,y方向最大和最小数据（x,y毫米波雷达坐标系）
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
            
        //cout<<  (*radarObjects).objects[i].pose.x << ","<<  (*radarObjects).objects[i].pose.y << ","<<  (*radarObjects).objects[i].pose.z <<endl;
      
      
        point_data.push_back((*radarObjects).objects[i].pose.x);
        point_data.push_back((*radarObjects).objects[i].pose.y);
        point_data.push_back((*radarObjects).objects[i].pose.z);
    }
    // 显示毫米波雷达坐标系:毫米波数据
    cv::Mat img = Mat(900, 1600, CV_32FC3, cv::Scalar(255, 255,255));  //创建一副图像
    double x_scale, y_scale;
    x_scale = img.cols/( maxx - minx + 20);
    y_scale = img.rows/( maxy - miny + 20);
    for(int i=0; i< (*radarObjects).objects.size(); i++)
    {
        int posex =  ( (*radarObjects).objects[i].pose.x - minx + 10 ) * x_scale;
        int posey = img.rows - ( (*radarObjects).objects[i].pose.y - miny + 10 ) * y_scale;
 
        circle(img, Point(posex, posey), 10, Scalar(255, 0, 0), -1, 8);
    }
  
    
    //创建滑动条
    int waveX = 4000;
    // 毫米传感器在摄像机坐标系下的坐标为X_{offset}、Y_{offset}、Z_{offset}; [-10～10] --> [0～4000]
    cv::createTrackbar("offset_x/(-40m - 40)m","radar",&waveX,8000,onChange,&img); // 右方向
    cv::createTrackbar("offset_y/(-40m - 40)m","radar",&waveX,8000,onChange,&img); // 向下
    cv::createTrackbar("offset_z/(-40m - 40)m","radar",&waveX,8000,onChange,&img); // 前方

    waveX = 1800;
    cv::createTrackbar("pitch_x/(-180° - 180°)","radar",&waveX,3600,onChange,&img);
    cv::createTrackbar("yaw_y/(-180° - 180°)","radar",&waveX,3600,onChange,&img);
    cv::createTrackbar("roll_z/(-180° - 180°)","radar",&waveX,3600,onChange,&img);
    
    // 写入相机内参数据
    Matrix<double, 3, 3> camera_intrinsic;          // 相机内参
    camera_intrinsic<< 1266.417203046554, 0.0, 816.2670197447984, \
                        0.0, 1266.417203046554, 491.50706579294757, \
                        0.0, 0.0, 1.0;
    cout << "camera_intrinsic:" << endl << camera_intrinsic << endl;
   
    // 声明定义校准变量
    raca_cali  = new RacaCali(point_data, camera_intrinsic, img.cols , img.rows);
 
    // 毫米波数据可视化
    imshow("radar", img);
    cv::waitKey(0);

 return 0;
}

