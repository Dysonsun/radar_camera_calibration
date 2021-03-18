# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "radar_camera_calibration: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iradar_camera_calibration:/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Itf:/opt/ros/kinetic/share/tf/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(radar_camera_calibration_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" NAME_WE)
add_custom_target(_radar_camera_calibration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "radar_camera_calibration" "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" NAME_WE)
add_custom_target(_radar_camera_calibration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "radar_camera_calibration" "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" "radar_camera_calibration/RadarObject:std_msgs/Header:geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_camera_calibration
)
_generate_msg_cpp(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg"
  "${MSG_I_FLAGS}"
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_camera_calibration
)

### Generating Services

### Generating Module File
_generate_module_cpp(radar_camera_calibration
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_camera_calibration
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(radar_camera_calibration_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(radar_camera_calibration_generate_messages radar_camera_calibration_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_cpp _radar_camera_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_cpp _radar_camera_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_camera_calibration_gencpp)
add_dependencies(radar_camera_calibration_gencpp radar_camera_calibration_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_camera_calibration_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_camera_calibration
)
_generate_msg_eus(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg"
  "${MSG_I_FLAGS}"
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_camera_calibration
)

### Generating Services

### Generating Module File
_generate_module_eus(radar_camera_calibration
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_camera_calibration
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(radar_camera_calibration_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(radar_camera_calibration_generate_messages radar_camera_calibration_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_eus _radar_camera_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_eus _radar_camera_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_camera_calibration_geneus)
add_dependencies(radar_camera_calibration_geneus radar_camera_calibration_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_camera_calibration_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_camera_calibration
)
_generate_msg_lisp(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg"
  "${MSG_I_FLAGS}"
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_camera_calibration
)

### Generating Services

### Generating Module File
_generate_module_lisp(radar_camera_calibration
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_camera_calibration
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(radar_camera_calibration_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(radar_camera_calibration_generate_messages radar_camera_calibration_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_lisp _radar_camera_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_lisp _radar_camera_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_camera_calibration_genlisp)
add_dependencies(radar_camera_calibration_genlisp radar_camera_calibration_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_camera_calibration_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_camera_calibration
)
_generate_msg_nodejs(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg"
  "${MSG_I_FLAGS}"
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_camera_calibration
)

### Generating Services

### Generating Module File
_generate_module_nodejs(radar_camera_calibration
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_camera_calibration
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(radar_camera_calibration_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(radar_camera_calibration_generate_messages radar_camera_calibration_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_nodejs _radar_camera_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_nodejs _radar_camera_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_camera_calibration_gennodejs)
add_dependencies(radar_camera_calibration_gennodejs radar_camera_calibration_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_camera_calibration_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_camera_calibration
)
_generate_msg_py(radar_camera_calibration
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg"
  "${MSG_I_FLAGS}"
  "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_camera_calibration
)

### Generating Services

### Generating Module File
_generate_module_py(radar_camera_calibration
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_camera_calibration
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(radar_camera_calibration_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(radar_camera_calibration_generate_messages radar_camera_calibration_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObject.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_py _radar_camera_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sundong/bit_ivrc/test/src/radar_camera_calibration/msg/RadarObjects.msg" NAME_WE)
add_dependencies(radar_camera_calibration_generate_messages_py _radar_camera_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_camera_calibration_genpy)
add_dependencies(radar_camera_calibration_genpy radar_camera_calibration_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_camera_calibration_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_camera_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_camera_calibration
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(radar_camera_calibration_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(radar_camera_calibration_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET tf_generate_messages_cpp)
  add_dependencies(radar_camera_calibration_generate_messages_cpp tf_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(radar_camera_calibration_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_camera_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_camera_calibration
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(radar_camera_calibration_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(radar_camera_calibration_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET tf_generate_messages_eus)
  add_dependencies(radar_camera_calibration_generate_messages_eus tf_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(radar_camera_calibration_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_camera_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_camera_calibration
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(radar_camera_calibration_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(radar_camera_calibration_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET tf_generate_messages_lisp)
  add_dependencies(radar_camera_calibration_generate_messages_lisp tf_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(radar_camera_calibration_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_camera_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_camera_calibration
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(radar_camera_calibration_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(radar_camera_calibration_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET tf_generate_messages_nodejs)
  add_dependencies(radar_camera_calibration_generate_messages_nodejs tf_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(radar_camera_calibration_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_camera_calibration)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_camera_calibration\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_camera_calibration
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(radar_camera_calibration_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(radar_camera_calibration_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET tf_generate_messages_py)
  add_dependencies(radar_camera_calibration_generate_messages_py tf_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(radar_camera_calibration_generate_messages_py nav_msgs_generate_messages_py)
endif()
