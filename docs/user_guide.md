@mainpage

# NCEPLIBS-wrf_io

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