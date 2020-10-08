# Lightweight WRF-IO API library for Unified Post Processor (UPP)

The NCEPLIBS-wrf_io library was supplied by the WRF team at NCAR to
satisfy the binding needs for ncep_post. This is part of the
[NCEPLIBS](https://github.com/NOAA-EMC/NCEPLIBS) project.

## Authors

NCEP/EMC developers.

Code Manager: George Vandenberghe

## Build instructions

load Intel or GNU compiler
load NetCDF (3.x or 4.x)

```
prefix=/path/to/wrfio
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=<prefix> ..
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
