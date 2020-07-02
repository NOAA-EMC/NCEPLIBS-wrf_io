
module load  ips/18.0.1.163  
module load NetCDF/4.5.0
export mySFC=ifort
make clean
make
make install
