# You should have a fresh install of Xubuntu before continuing!
# Make sure that auto login is selected during the installation process
# Ensure no monitors are connected to your motherboard's display output

# Step 0: Download auto set-up script
echo "Downloading Script"
sudo apt-get install git
cd ~
git clone https://github.com/joshteng/Ethereum-mining.git

# Step 1: Install necessary packages
echo "Installing Necessary packages!"
sudo apt-get update
sudo apt-get install software-properties-common gcc make
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install openssh-server

# Step 2: Install proprietary NVIDIA GPU Driver
sudo apt-get purge nvidia-*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-375

# Step 3: Install Ethereum
echo "Installing Ethereum!"
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

# Step 4: Install Claymore
echo "Installing Claymore and setting up miner!"
cd ~
wget https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v9.5/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.5.-.LINUX.tar.gz
mkdir ~/miner/
mkdir ~/miner/claymore95
tar -xvf Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.5.-.LINUX.tar.gz -C ~/miner/claymore95
chmod u+s ~/miner/claymore95/ethdcrminer64
cd ~
cp ~/nvidia_miner/home/digdug/miner/mine.sh ~/miner/mine.sh
chmod +x ~/miner/mine.sh

# Step 5: Set up autostart script
echo "Setting up auto mining!"
sudo apt-get install screen
cd ~
cp ~/nvidia_miner/home/digdug/miner_launcher.sh ~/miner_launcher.sh
chmod +x ~/miner_launcher.sh
echo "alias miner=\"screen -r ethm\"" >> ~./bashrc

# Step 6: Set up OC
echo "Setting up OC!"
"xfce4-terminal" >> ~./bashrc
cp ~/nvidia_miner/home/digdug/oc.sh ~/
chmod +x ~/oc.sh

cat ~/nvidia_miner/home/digdug/.bashrc.oc >> ~/.bashrc

sudo cp ~/nvidia_miner/etc/rc.local /etc/rc.local

nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration # sudo may be necessary (when more cards are added, need to run this command again)

sudo reboot

## DONE
echo "ALL DONE!!"

# Step 7 (optional): Login to SSH via public key
cat << EOF
To get into SSH, run this from your local computer command line
cat ~/.ssh/id_rsa.pub | ssh <user>@<123.45.56.78> "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
EOF

# Step 8 (optional): Install VIM and use some sublime config
sudo apt-get install curl
sudo apt-get install vim
curl -L http://install.ohmyz.sh | sh
curl http://install.sublivim.com | sh
