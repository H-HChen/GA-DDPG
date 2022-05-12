#!/bin/sh

git clone https://github.com/H-HChen/GA-DDPG.git --recursive -b develop
pip3 install "git+git://github.com/erikwijmans/Pointnet2_PyTorch.git#egg=pointnet2_ops&subdirectory=pointnet2_ops_lib"
ln -s /usr/include/eigen3/Eigen /usr/include/Eigen
cd /GA-DDPG/OMG/ycb_render && python3 setup.py develop
cd /GA-DDPG/OMG/Sophus
cmake -Bbuild -H.
cmake --build build/ -j8
cd build && make install
ls /usr/lib/python3.8/site-packages/
cd /GA-DDPG/OMG/orocos_kinematics_dynamics
cd ./sip-4.19.3
python3 configure.py
make -j8; make install
export ROS_PYTHON_VERSION=3
cd /GA-DDPG/OMG/orocos_kinematics_dynamics/orocos_kdl
mkdir build; cd build;
cmake ..
make -j8; make install
cd /GA-DDPG/OMG/orocos_kinematics_dynamics/python_orocos_kdl
mkdir build; cd build;
cmake ..  -DPYTHON_VERSION=3.8.10 -DPYTHON_EXECUTABLE=/usr/bin/python3
make -j8; cp PyKDL.so /usr/lib/python3/dist-packages/
cd /GA-DDPG/OMG/layers
python3 setup.py install
cp -r /usr/lib/python3.8/site-packages/* /usr/lib/python3/dist-packages/
