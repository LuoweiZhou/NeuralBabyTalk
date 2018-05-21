#!/usr/bin/env bash

installDir=/public/apps/cuda/9.0
# CUDA_PATH=/usr/local/cuda/

export C_INCLUDE_PATH=$installDir/include/:$C_INCLUDE_PATH
export CUDA_PATH=$installDir
export CUDA_ROOT=$installDir
export CUDA_HOME=$installDir
export CUDA_INCLUDE=$installDir/include/
export CUDA_LIB=$installDir/lib64/

cd src
echo "Compiling my_lib kernels by nvcc..."
nvcc -c -o roi_align_kernel.cu.o roi_align_kernel.cu -x cu -Xcompiler -fPIC -arch=sm_52

cd ../
python build.py
