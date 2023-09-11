FROM ros:kinetic


#install ros package
RUN apt-get update && apt-get install -y gnupg ros-kinetic-desktop-full python-rosinstall python-catkin-tools
RUN echo "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports xenial main restricted universe multiverse" >> /etc/apt/source.list

RUN apt-get update && apt-get install -y \
       bluez \
       bluez-tools\
       usbutils

#Configuracion del entorno de ROS
RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc

#Configuracion del ws
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws/src
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_init_workspace"
WORKDIR /root/catkin_ws
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make"



#CMD ["bash"]
