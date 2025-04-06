# Install script for directory: /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "default")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-zigbee.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-wimax.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-wifi.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-virtual-net-device.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-uan.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-traffic-control.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-topology-read.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-stats.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-spectrum.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-sixlowpan.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-propagation.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-point-to-point-layout.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-point-to-point.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-olsr.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-nix-vector-routing.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-network.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-netanim.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-mobility.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-mesh.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-lte.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-lr-wpan.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-internet-apps.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-internet.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-flow-monitor.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-energy.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-dsr.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-dsdv.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-csma-layout.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-csma.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-core.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-config-store.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-buildings.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-bridge.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-applications.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-aodv.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/pkgconfig/ns3-antenna.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3/ns3Targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3/ns3Targets.cmake"
         "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/Export/2a81891a6eb0eac8fbb86ed7caf9a458/ns3Targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3/ns3Targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3/ns3Targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/Export/2a81891a6eb0eac8fbb86ed7caf9a458/ns3Targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Ff][Aa][Uu][Ll][Tt])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3" TYPE FILE FILES "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/Export/2a81891a6eb0eac8fbb86ed7caf9a458/ns3Targets-default.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ns3" TYPE FILE FILES
    "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/ns3Config.cmake"
    "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/ns3ConfigVersion.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/cmake_install.cmake")
  include("/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/examples/cmake_install.cmake")
  include("/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/scratch/cmake_install.cmake")
  include("/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/utils/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
