Lightweight WRF-IO API library for Unified Post Processor (UPP)
---------------------------------------------------------------

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
