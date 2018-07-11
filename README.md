# JetsonTX2ForDeeplearning
Setting up Jetson TX2 with OpenCV Tensorflow &amp; Keras for deep learning


## OpenCV
https://jkjung-avt.github.io/opencv3-on-tx2/

```
./build_install_opencv.sh
```

To check OpenCV installation, run this:
```
ls /usr/local/lib/python3.5/dist-packages/cv2.*
# supposed to be /usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-aarch64-linux-gnu.so
ls /usr/local/lib/python2.7/dist-packages/cv2.*
# supposed to be /use/local/lib/python2.7/dist-packages/cv2.so
python3 -c 'import cv2; print(cv2.__version__)'
# expect 3.4.0
python2 -c 'import cv2; print(cv2.__version__)'
# expect 3.4.0
```

## Tensorflow Install

I highly recommend to install prebuild binary. As suggested from https://github.com/JasonAtNvidia/JetsonTFBuild

Otherwise, please follow the link to compile and install tensorflow.

Note: place make sure the versions of dependencies meet the requirement, otherwise, you will see errors like not being able to find a particular library.

```
./install_tensorflow.sh
```

## Keras Install

```
./install_keras.sh
```
