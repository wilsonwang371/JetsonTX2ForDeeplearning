#!/usr/bin/env bash
set -e
set -x
echo "Remove all old opencv stuffs installed by JetPack (or OpenCV4Tegra)"
sudo apt-get purge libopencv*
### I prefer using newer version of numpy (installed with pip), so
### I'd remove this python-numpy apt package as well
sudo apt-get -y purge python-numpy
echo "Remove other unused apt packages"
sudo apt autoremove
echo "Upgrade all installed apt packages to the latest versions"
sudo apt-get update
sudo apt-get dist-upgrade
echo "Update gcc apt package to the latest version"
sudo apt-get install -y --only-upgrade g++-5 cpp-5 gcc-5
### Install dependencies based on the Jetson Installing OpenCV Guide
sudo apt-get install -y build-essential make cmake cmake-curses-gui \
                       g++ libavformat-dev libavutil-dev \
                       libswscale-dev libv4l-dev libeigen3-dev \
                       libglew-dev libgtk2.0-dev
### Install dependencies for gstreamer stuffs
sudo apt-get install -y libdc1394-22-dev libxine2-dev \
                       libgstreamer1.0-dev \
                       libgstreamer-plugins-base1.0-dev
echo "Install additional dependencies according to the pyimageresearch article"
sudo apt-get install -y libjpeg8-dev libjpeg-turbo8-dev libtiff5-dev \
                       libjasper-dev libpng12-dev libavcodec-dev
sudo apt-get install -y libxvidcore-dev libx264-dev libgtk-3-dev \
                       libatlas-base-dev gfortran
echo "Install Qt5 dependencies"
sudo apt-get install -y qt5-default
echo "Install dependencies for python3"
sudo apt-get install -y python3-dev python3-pip python3-tk
sudo pip3 install numpy
sudo pip3 install matplotlib
echo "Modify matplotlibrc (line #41) as 'backend      : TkAgg'"
sudo sed -i 's/^backend *:.*/backend      : TkAgg/g' /usr/local/lib/python3.5/dist-packages/matplotlib/mpl-data/matplotlibrc
echo "Also install dependencies for python2"
### Note that I install numpy with pip, so that I'd be using a newer
### version of numpy than the apt-get package
sudo apt-get install -y python-dev python-pip python-tk
sudo pip2 install numpy
sudo pip2 install matplotlib
echo "Modify matplotlibrc (line #41) as 'backend      : TkAgg'"
sudo sed -i 's/^backend *:.*/backend      : TkAgg/g' /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc

sudo sed -i 's/^#error Please include the appropriate.*/#include \<GL\/gl.h\>/g' /usr/local/cuda/include/cuda_gl_interop.h
pushd /usr/lib/aarch64-linux-gnu/
sudo ln -sf tegra/libGL.so libGL.so
popd


echo "Download opencv-3.4.0 source code"
mkdir -p ~/src
pushd ~/src
wget https://github.com/opencv/opencv/archive/3.4.0.zip \
       -O opencv-3.4.0.zip
unzip opencv-3.4.0.zip
echo "Build opencv (CUDA_ARCH_BIN=\"6.2\" for TX2, or \"5.3\" for TX1)"
pushd ~/src/opencv-3.4.0
mkdir build
pushd build
echo "Configure opencv-3.4.0"
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D WITH_CUDA=ON -D CUDA_ARCH_BIN="6.2" -D CUDA_ARCH_PTX="" \
        -D WITH_CUBLAS=ON -D ENABLE_FAST_MATH=ON -D CUDA_FAST_MATH=ON \
        -D ENABLE_NEON=ON -D WITH_LIBV4L=ON -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF \
        -D WITH_QT=ON -D WITH_OPENGL=ON ..
echo "Build opencv-3.4.0"
make -j4
sudo make install
popd
popd
