# JetsonTX2ForDeeplearning
Setting up Jetson TX2 with OpenCV Tensorflow &amp; Keras for deep learning


## OpenCV
https://jkjung-avt.github.io/opencv3-on-tx2/
```
### Remove all old opencv stuffs installed by JetPack (or OpenCV4Tegra)
$ sudo apt-get purge libopencv*
### I prefer using newer version of numpy (installed with pip), so
### I'd remove this python-numpy apt package as well
sudo apt-get -y purge python-numpy
### Remove other unused apt packages
sudo apt autoremove
### Upgrade all installed apt packages to the latest versions (optional)
sudo apt-get update
sudo apt-get dist-upgrade
### Update gcc apt package to the latest version (highly recommended)
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
### Install additional dependencies according to the pyimageresearch
### article
sudo apt-get install -y libjpeg8-dev libjpeg-turbo8-dev libtiff5-dev \
                       libjasper-dev libpng12-dev libavcodec-dev
sudo apt-get install -y libxvidcore-dev libx264-dev libgtk-3-dev \
                       libatlas-base-dev gfortran
### Install Qt5 dependencies
sudo apt-get install -y qt5-default
### Install dependencies for python3
sudo apt-get install -y python3-dev python3-pip python3-tk
sudo pip3 install numpy
sudo pip3 install matplotlib
### Modify matplotlibrc (line #41) as 'backend      : TkAgg'
sudo sed -i 's/^backend *:.*/backend      : TkAgg/g' /usr/local/lib/python3.5/dist-packages/matplotlib/mpl-data/matplotlibrc
### Also install dependencies for python2
### Note that I install numpy with pip, so that I'd be using a newer
### version of numpy than the apt-get package
sudo apt-get install -y python-dev python-pip python-tk
sudo pip2 install numpy
sudo pip2 install matplotlib
### Modify matplotlibrc (line #41) as 'backend      : TkAgg'
sudo sed -i 's/^backend *:.*/backend      : TkAgg/g' /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc

```
