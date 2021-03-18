cmake_minimum_required(VERSION 3.5) # C++17 support was added in CMake 3.8

project(radar_camera_calibration)

set(CMAKE_CXX_STANDARD 11)
#set(CMAKE_CXX_STANDARD 14)

set(CMAKE_BUILD_TYPE Release) # Debug, Release, RelWithDebInfo

find_package(Boost  COMPONENTS filesystem thread REQUIRED) # Ubuntu 16.04
#find_package(Boost 1.65.0 COMPONENTS filesystem thread REQUIRED) # Ubuntu 18.04

find_package(catkin
             REQUIRED
             rosbag
             sensor_msgs
             cv_bridge
             pcl_conversions
             pcl_msgs
             message_generation
             geometry_msgs
             std_msgs
             nav_msgs
			 eigen_conversions
             tf)

find_package(OpenCV REQUIRED)

add_message_files(FILES RadarObjects.msg RadarObject.msg)
generate_messages(DEPENDENCIES
                  std_msgs
                  geometry_msgs
                  tf
                  nav_msgs)

catkin_package(INCLUDE_DIRS
               include
               DEPENDS
               OpenCV
               ) #eigen

include_directories(SYSTEM
                    ${catkin_INCLUDE_DIRS}
                    ${Boost_INCLUDE_DIRS}
                    ${OpenCV_INCLUDE_DIRS})
include_directories(include)

find_package(PCL REQUIRED COMPONENTS common io)


 add_library(raca_calibrate_core SHARED src/raca_calibrate_core.cpp)
 target_include_directories(raca_calibrate_core PRIVATE  ${catkin_INCLUDE_DIRS})
 target_link_libraries(raca_calibrate_core
         ${catkin_LIBRARIES}
         ${EIGEN3_LIBRARIES}
         ${OpenCV_LIBRARIES}
         ${PCL_COMMON_LIBRARY}
         ${PCL_IO_LIBRARY})
        






set(SRCS
    src/RadarDirectoryConverter.cpp
    src/RadarDirectoryConverterPointCloud.cpp
    src/FileProgress.cpp
    src/utils.cpp)

add_executable(radar_view ${SRCS} src/radar_view.cpp)
target_compile_options(radar_view
                       PRIVATE
                               -Wall
                               -Wextra
                               -pedantic
                               )

target_compile_definitions(radar_view PRIVATE "-DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}")
add_dependencies(radar_view ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(radar_view
                      ${OpenCV_LIBRARIES}
                      ${PCL_COMMON_LIBRARY}
                      ${PCL_IO_LIBRARY}
                      ${catkin_LIBRARIES})



add_executable(${PROJECT_NAME} ${SRCS} src/main.cpp)
target_compile_options(${PROJECT_NAME}
                       PRIVATE
                               -Wall
                               -Wextra
                               -pedantic
                               )

target_compile_definitions(${PROJECT_NAME} PRIVATE "-DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}")
add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME}
                       raca_calibrate_core
                      ${OpenCV_LIBRARIES}
                      ${PCL_COMMON_LIBRARY}
                      ${PCL_IO_LIBRARY}
                      ${catkin_LIBRARIES})

install(TARGETS
			${PROJECT_NAME}
			radar_view
			 raca_calibrate_core
			ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
			LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
			RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
                      

