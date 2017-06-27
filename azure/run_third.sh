sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

# Install Claymore Miner
cd ~
mkdir miner
wget https://www.dropbox.com/s/r5mn00lngbwipvo/claymore-v9.5.tar.gz?dl=1
mv claymore-v9.5.tar.gz?dl=1 claymore-v9.5.tar.gz
tar -xvzf claymore-v9.5.tar.gz
rm claymore-v9.5.tar.gz
mv Claymore\'s\ Dual\ Ethereum+Decred_Siacoin_Lbry_Pascal\ AMD+NVIDIA\ GPU\ Miner\ v9.5\ -\ LINUX/ miner/claymore

# Begin mining!
cd ~
touch miner/mine.sh
cat <<EOT >> miner/mine.sh
PUBLIC_IP=`curl -4 http://l2.io/ip | sed -e 's/[\.]/-/g'`
echo "Starting miner with name: az-$(hostname)-$PUBLIC_IP"

/home/digdug/miner/claymore/ethdcrminer64 -epool us1.ethermine.org:4444 -ewal 0x3A732697eE046Bf09969Ae8Ce3618Dccc1764489.az-$(hostname)-$PUBLIC_IP -epsw x
EOT

chmod 775 miner/mine.sh

cd ~
touch miner_launcher.sh
cat <<EOT >> miner_launcher.sh
#!/bin/bash
DEFAULT_DELAY=5
if [ "x$1" = "x" -o "x$1" = "xnone" ]; then
   DELAY=$DEFAULT_DELAY
else
   DELAY=$1
fi
sleep $DELAY

su digdug -c "screen -dmS ethm /home/digdug/miner/mine.sh"
EOT

chmod 775 miner_launcher.sh
sudo chown digdug:digdug miner_launcher.sh

echo "alias miner=\"screen -r ethm\"" >> ~/.bashrc

sudo cat <<EOT > /etc/rc.local
#!/bin/sh -e
exec 2> /tmp/rc.local.log      # send stderr from rc.local to a log file
exec 1>&2                      # send stdout to the same log file
set -x                         # tell sh to display commands before execution

# Auto start miner
/home/digdug/miner_launcher.sh 10 &

exit 0
EOT

sudo reboot
