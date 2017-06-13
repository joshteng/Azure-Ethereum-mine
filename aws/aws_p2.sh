echo -e "\e[31;43m***** Installing Drivers and Prerequisites *****\e[0m"
sudo apt-get update
sudo apt-get install software-properties-common gcc make
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install build-essential ubuntu-desktop -y
# sudo touch /etc/modprobe.d/nouveau.conf
# sudo chmod 775 /etc/modprobe.d/nouveau.conf
#sudo echo $'blacklist nouveau\nblacklist lbm-nouveau' > /etc/modprobe.d/nouveau.conf
# sudo reboot

# Install NVIDIA Graphics Driver
sudo apt-get install linux-image-extra-virtual linux-source linux-headers-`uname -r`
sudo systemctl stop lightdm.service # sudo service lightdm stop #(if running Ubuntu 14.04)
wget http://in.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
chmod +x NVIDIA-Linux-x86_64-375.66.run
sudo ./NVIDIA-Linux-x86_64-375.66.run

# Install Ethereum
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

# Install Claymore Miner
wget https://www.dropbox.com/s/r5mn00lngbwipvo/claymore-v9.5.tar.gz?dl=1
mv claymore-v9.5.tar.gz?dl=1 claymore-v9.5.tar.gz
tar -xvzf claymore-v9.5.tar.gz
mv Claymore\'s\ Dual\ Ethereum+Decred_Siacoin_Lbry_Pascal\ AMD+NVIDIA\ GPU\ Miner\ v9.5\ -\ LINUX/ claymore
cd claymore
export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

# Begin mining!
screen
./ethdcrminer64 -epool us1.ethermine.org:4444 -ewal 0x3A732697eE046Bf09969Ae8Ce3618Dccc1764489.DigDugJtAwsP28xl -epsw x
