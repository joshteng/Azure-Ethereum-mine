sudo systemctl stop lightdm.service
wget http://in.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
chmod +x NVIDIA-Linux-x86_64-375.66.run
sudo ./NVIDIA-Linux-x86_64-375.66.run

sudo echo $'\nIgnoreSP=TRUE\n' >> /etc/nvidia/gridd.conf.template

sudo reboot
