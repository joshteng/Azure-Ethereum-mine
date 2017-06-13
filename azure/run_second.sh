sudo systemctl stop lightdm.service
wget -O NVIDIA-Linux-x86_64-367.92-grid.run https://go.microsoft.com/fwlink/?linkid=849941  
chmod +x NVIDIA-Linux-x86_64-367.92-grid.run
sudo ./NVIDIA-Linux-x86_64-367.92-grid.run

sudo echo $'\nIgnoreSP=TRUE\n' >> /etc/nvidia/gridd.conf.template

sudo reboot
