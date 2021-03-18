
#include"radar_camera_calibration/raca_calibrate_core.hpp"

const double DEG_TO_ARC = 0.0174532925199433;
namespace radar_camera_calibration{
    RacaCali::RacaCali( std::vector<double> _point_data, Eigen::Matrix<double, 3, 3> & _camera_intrinsic, int cols , int rows)
        : point_data(_point_data),
          camera_intrinsic(_camera_intrinsic),
          pixel_cols(cols),
          pixel_rows(rows){
//        _init();
    }

    std::vector<cv::Point> RacaCali::calibrate(float offset_x, float offset_y, float offset_z, float pitch_x, float yaw_y, float roll_z ){
        pixel_data.clear();

        translation_matrix[0] = offset_x;
        translation_matrix[1] = offset_y;
        translation_matrix[2] = offset_z;

        Eigen::Vector3d euler_angle(roll_z * DEG_TO_ARC, pitch_x * DEG_TO_ARC, yaw_y * DEG_TO_ARC);
        rotation_Ridar_2_camera = Eigen::AngleAxisd(euler_angle[2], Eigen::Vector3d::UnitZ()) *
                                  Eigen::AngleAxisd(euler_angle[1], Eigen::Vector3d::UnitY()) *
                                  Eigen::AngleAxisd(euler_angle[0], Eigen::Vector3d::UnitX());

        for(int i = 0; i < point_data.size()/3; i++){
            Eigen::Vector3d point_radar(point_data[i*3], point_data[i*3+1], point_data[i*3+2]);
            Eigen::Vector3d point3d_image = camera_intrinsic * (rotation_Ridar_2_camera * point_radar + translation_matrix);

            cv::Point point2d_image;
            point2d_image.x = point3d_image[0] / point3d_image[2];
            point2d_image.y = point3d_image[1] / point3d_image[2];

            if(point2d_image.x > 0 && point2d_image.x < pixel_cols && point2d_image.y > 0 && point2d_image.y < pixel_rows){
                pixel_data.push_back(point2d_image);
            }


        }

        return pixel_data;


    }
}