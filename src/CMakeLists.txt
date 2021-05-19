list(APPEND definitions
  WRFIO_NCD_LARGE_FILE_SUPPORT
  NO_M4)
if(NetCDF_VERSION VERSION_GREATER_EQUAL 4)
  list(APPEND definitions
    USE_NETCDF4_FEATURES)
endif()

if(CMAKE_Fortran_COMPILER_ID MATCHES "^(Intel)$")
  set(CMAKE_Fortran_FLAGS "-fpp -g -traceback -fp-model source -ftz -assume byterecl -convert big_endian -heap-arrays -nostdinc ${CMAKE_Fortran_FLAGS}")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -w")
  set(CMAKE_Fortran_FLAGS_DEBUG "-O0")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "^(GNU)$")
  set(CMAKE_Fortran_FLAGS "-cpp -g -fbacktrace -funroll-loops -ffree-line-length-none -fconvert=big-endian -frecord-marker=4 ${CMAKE_Fortran_FLAGS}")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3")
  set(CMAKE_Fortran_FLAGS_DEBUG "-ggdb -Wall")
endif()

if(${CMAKE_Fortran_COMPILER_ID} MATCHES "^(GNU)$" AND ${CMAKE_Fortran_COMPILER_VERSION} VERSION_GREATER_EQUAL 10)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -w -fallow-argument-mismatch")
endif()

set(fortran_src
  field_routines.F90
  io_int_stubs.f90
  module_driver_constants.F90
  module_machine.F90
  wrf_io.f90)

set(c_src
  pack_utils.c)

set(lib_name ${PROJECT_NAME})
set(module_dir ${CMAKE_CURRENT_BINARY_DIR}/include)

add_library(${lib_name}_f OBJECT ${fortran_src})
set_target_properties(${lib_name}_f PROPERTIES Fortran_MODULE_DIRECTORY ${module_dir})
set_property(TARGET ${lib_name}_f PROPERTY Fortran_FORMAT FREE)

add_library(${lib_name}_c OBJECT ${c_src})

add_library(${lib_name} STATIC $<TARGET_OBJECTS:${lib_name}_f>
  $<TARGET_OBJECTS:${lib_name}_c>)

target_compile_definitions(${lib_name} PUBLIC "${definitions}")

target_include_directories(${lib_name} PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

target_include_directories(${lib_name} INTERFACE
  $<BUILD_INTERFACE:${module_dir}>
  $<INSTALL_INTERFACE:include>)

target_link_libraries(${lib_name} PUBLIC NetCDF::NetCDF_Fortran)

if(OpenMP_Fortran_FOUND)
  target_link_libraries(${lib_name} PUBLIC OpenMP::OpenMP_Fortran)
endif()

install(DIRECTORY ${module_dir} DESTINATION ${CMAKE_INSTALL_PREFIX})

install(
  TARGETS ${lib_name}
  EXPORT ${PROJECT_NAME}Exports
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib)

### Package config
include(CMakePackageConfigHelpers)
set(CONFIG_INSTALL_DESTINATION lib/cmake/${PROJECT_NAME})

export(EXPORT ${PROJECT_NAME}Exports
  NAMESPACE ${PROJECT_NAME}::
  FILE ${PROJECT_NAME}-targets.cmake)

configure_package_config_file(
  ${CMAKE_SOURCE_DIR}/cmake/PackageConfig.cmake.in ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config.cmake
  INSTALL_DESTINATION ${CONFIG_INSTALL_DESTINATION})
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config.cmake
  DESTINATION ${CONFIG_INSTALL_DESTINATION})

write_basic_package_version_file(
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion)
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  DESTINATION ${CONFIG_INSTALL_DESTINATION})

install(EXPORT ${PROJECT_NAME}Exports
  NAMESPACE ${PROJECT_NAME}::
  FILE ${PROJECT_NAME}-targets.cmake
  DESTINATION ${CONFIG_INSTALL_DESTINATION})
