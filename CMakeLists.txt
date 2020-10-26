# This is the main CMake file for NCEPLIBS-wrf_io.
#
# Other programmer, Ed Hartnett
cmake_minimum_required(VERSION 3.15)

# Get the version from the VERSION file.
file(STRINGS "VERSION" pVersion)

# This provides cmake_print_variables() function for debugging.
include(CMakePrintHelpers)

# Initialize project.
project(wrf_io VERSION ${pVersion} LANGUAGES Fortran)

#Add custom CMake Module
SET(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/"
  CACHE INTERNAL "Location of our custom CMake modules.")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules/Modules")

option(OPENMP "Enable OpenMP threading" OFF)

include(GNUInstallDirs)

if(NOT CMAKE_BUILD_TYPE MATCHES "^(Debug|Release|RelWithDebInfo|MinSizeRel)$")
  message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE
      "Release"
      CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
                                               "MinSizeRel" "RelWithDebInfo")
endif()

# Find netCDF.
include(FindNetCDF)
#find_package (NetCDF REQUIRED COMPONENTS C)
find_package(NetCDF REQUIRED)
cmake_print_variables(NETCDF_LIBRARIES NETCDF_INCLUDE_DIRS)
include_directories("${NETCDF_INCLUDE_DIRS}")
find_package(NetCDF REQUIRED COMPONENTS Fortran)

if(OPENMP)
  find_package(OpenMP REQUIRED COMPONENTS Fortran)
endif()

add_subdirectory(libsrc)

# Determine whether or not to generate documentation.
option(ENABLE_DOCS "Enable generation of doxygen-based documentation." OFF)
if(ENABLE_DOCS)
  find_package(Doxygen REQUIRED)
endif()
add_subdirectory(docs)  
