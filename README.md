![Status](https://github.com/NOAA-EMC/NCEPLIBS-wrf_io/workflows/developer/badge.svg)

# NCEPLIBS-wrf_io

This is a lightweight WRF-IO API library for Unified Post Processor
(UPP). It reads wrf forecasts (WRF state plus diagnostics). It is
based on code copied from
https://github.com/wrf-model/WRF/tree/master/external/io_netcdf.

The NCEPLIBS-wrf_io library was supplied by the WRF team at NCAR to
satisfy the binding needs for ncep_post. This is part of the
[NCEPLIBS](https://github.com/NOAA-EMC/NCEPLIBS) project.

For complete documentation see
https://noaa-emc.github.io/NCEPLIBS-wrf_io/.

To submit bug reports, feature requests, or other code-related issues including installation and usage questions, please create a [GitHub issue](https://github.com/NOAA-EMC/NCEPLIBS-wrf_io/issues). For general NCEPLIBS inquiries, contact [Edward Hartnett](mailto:edward.hartnett@noaa.gov) (secondary point of contact [Alex Richert](mailto:alexander.richert@noaa.gov)).

## Authors

Jacques Middlecoff

Code Manager: [George Vandenberghe](mailto:george.vandenberghe@noaa.gov)

## Prerequisites

This package requires the netCDF C library.

## Build instructions

```console
# Load NetCDF into environment; cmake/FindNetcdf.cmake uses `nc-config` to link to NetCDF libraries
git clone https://github.com/NOAA-EMC/NCEPLIBS-wrf_io # or download a release from https://github.com/NOAA-EMC/NCEPLIBS-wrf_io/releases
cmake -DCMAKE_INSTALL_PREFIX=/path/to/install -S NCEPLIBS-wrf_io -B NCEPLIBS-wrf_io/build # <add'l CMake options>
cmake --build NCEPLIBS-wrf_io/build --parallel 4
ctest --test-dir NCEPLIBS-wrf_io/build --parallel 4 # <add'l CTest options>
cmake --install NCEPLIBS-wrf_io/build
```

The libraries and .mod files will be installed in `<prefix>`

To use this library in the application:
```
find_package(wrfio)
cmake -DCMAKE_PREFIX_PATH=<prefix> ..
```

## Disclaimer

The United States Department of Commerce (DOC) GitHub project code is
provided on an "as is" basis and the user assumes responsibility for
its use. DOC has relinquished control of the information and no longer
has responsibility to protect the integrity, confidentiality, or
availability of the information. Any claims against the Department of
Commerce stemming from the use of its GitHub project will be governed
by all applicable Federal law. Any reference to specific commercial
products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by the Department of
Commerce. The Department of Commerce seal and logo, or the seal and
logo of a DOC bureau, shall not be used in any manner to imply
endorsement of any commercial product or activity by DOC or the United
States Government.
