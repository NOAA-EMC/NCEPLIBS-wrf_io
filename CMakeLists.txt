# This is the main CMake file for NCEPLIBS-wrf_io.
#
# Other programmer, Ed Hartnett
cmake_minimum_required(VERSION 3.15)

# Get the version from the VERSION file.
file(STRINGS "VERSION" pVersion)

# Initialize project.
project(wrf_io VERSION ${pVersion} LANGUAGES Fortran)

# Add custom CMake Modules.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# User build options.
option(OPENMP "Enable OpenMP threading" OFF)
option(ENABLE_DOCS "Enable generation of doxygen-based documentation." OFF)

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
find_package(NetCDF REQUIRED COMPONENTS Fortran)

# Find OpenMP if desired.
if(OPENMP)
  find_package(OpenMP REQUIRED COMPONENTS Fortran)
endif()

add_subdirectory(libsrc)

# Determine whether or not to generate documentation.
if(ENABLE_DOCS)
  find_package(Doxygen REQUIRED)
endif()
add_subdirectory(docs)  
