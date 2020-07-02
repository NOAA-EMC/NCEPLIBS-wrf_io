Lightweight WRF-IO API library for NCEP UNIFIED POST (UPP)

Build instructions

cd to v1.1.1/src  
load Intel compiler (done in make.sh)
load NetCDF (3.x or 4.x)
run make.sh

The libraries and .mod files will be installed in v1.1.1/lib/intel

The module to load this is in ../modulefiles/wrfio/v1.1.1 and will
need editing to specify it's location in the way NCO prefers.  Devlopment
hardwired paths and environment loading are assumed unacceptable.
The  module is suppled with $NCEPLIBS pathing


