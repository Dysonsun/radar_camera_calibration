#ifndef _RACA_CALIBRATE_CORE_EDITOR_H_
#define _RACA_CALIBRATE_CORE_EDITOR_H_


#include <array>
#include <iostream>
#include <regex>
#include <opencv2/opencv.hpp>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <vector>


namespace radar_camera_calibration{
    class RacaCali {
    public:
        RacaCali( std::vector<double> _point_data, Eigen::Matrix<double, 3, 3> & _camera_intrinsic, int cols , int rows);

//        void _init();
        std::vector<cv::Point> calibrate(float offset_x, float offset_y, float offset_z, float pitch_x, float yaw_y, float roll_z );

    private:
        float pd;
        std::vector<double> point_data;          // 毫米波原始数据: std:vector容器格式
        Eigen::Matrix<double,Eigen::Dynamic,Eigen::Dynamic,Eigen::RowMajor> point_data_matrix; // 毫米波原始数据：eigen矩阵格式

        Eigen::Matrix<double, 3, 3> camera_intrinsic;          // 相机内参
//        Eigen::Matrix<double, 3, 3> rotation_x;                // 相机坐标系:x轴旋转
//        Eigen::Matrix<double, 3, 3> rotation_y;                // 相机坐标系:y轴旋转
//        Eigen::Matrix<double, 3, 3> rotation_z;                // 相机坐标系:z轴旋转
        Eigen::Matrix<double, 3, 3> rotation_Ridar_2_camera;   // 毫米波雷达转相机坐标系 坐标轴方向变换
        Eigen::Matrix<double, 3, 1> translation_matrix;
        std::vector<cv::Point> pixel_data;
        int pixel_cols;
        int pixel_rows;

    };
}


//void 

#endif
