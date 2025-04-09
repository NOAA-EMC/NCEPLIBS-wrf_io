@mainpage

# Introduction

The NCEPLIBS-wrf_io library was supplied by the WRF team at NCAR to
satisfy the binding needs for ncep_post. This is part of the
[NCEPLIBS](https://github.com/NOAA-EMC/NCEPLIBS) project.

This library is needed because UPP is also used to post process WRF
files so the hooks are in the code and because the hooks are in the
code we need the wrfio stuff to build UPP.

NCEPLIBS-wrf_io may need to be changed to support future versions of
WRF.

Prior to NCEPLIBS-wrf_io in 2018, we built the entire WRF to support
UPP and had to maintain several versions of WRF in library form to
support the several WRF APIs that people were using.

## Installation

```
# Load NetCDF into environment; cmake/FindNetcdf.cmake uses `nc-config` to link to NetCDF libraries
git clone https://github.com/NOAA-EMC/NCEPLIBS-wrf_io # or download a release from https://github.com/NOAA-EMC/NCEPLIBS-wrf_io/releases
cmake -DCMAKE_INSTALL_PREFIX=/path/to/install -S NCEPLIBS-wrf_io -B NCEPLIBS-wrf_io/build # <add'l CMake options>
cmake --build NCEPLIBS-wrf_io/build --parallel 4
ctest --test-dir NCEPLIBS-wrf_io/build --parallel 4 # <add'l CTest options>
cmake --install NCEPLIBS-wrf_io/build
```

The following CMake build options can be used to configure the build by setting them with `-D<OPTION>=<VALUE>`.

| Option | Description | Default |
|--------|-------------|---------|
| CMAKE_INSTALL_PREFIX | Installation path | /usr/local |
| CMAKE_POSITION_INDEPENDENT_CODE | Enable position-independent code (PIC) for static build | OFF |
| OPENMP | Enable OpenMP threading | OFF |
| ENABLE_DOCS | Enable generation of doxygen-based documentation. | OFF |
