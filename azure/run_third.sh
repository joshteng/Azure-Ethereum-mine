sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

# Install Claymore Miner
wget https://www.dropbox.com/s/r5mn00lngbwipvo/claymore-v9.5.tar.gz?dl=1
mv claymore-v9.5.tar.gz?dl=1 claymore-v9.5.tar.gz
tar -xvzf claymore-v9.5.tar.gz
mv Claymore\'s\ Dual\ Ethereum+Decred_Siacoin_Lbry_Pascal\ AMD+NVIDIA\ GPU\ Miner\ v9.5\ -\ LINUX/ claymore
cd claymore

# Begin mining!
cd ~
touch mine.sh
cat <<EOT >> mine.sh
IP_ADDRESS="azure-`hostname -I`"
/home/digdug/claymore/ethdcrminer64 -epool us1.ethermine.org:4444 -ewal 0x3A732697eE046Bf09969Ae8Ce3618Dccc1764489.$IP_ADDRESS -epsw x
EOT

sudo echo > /etc/rc.local
sudo cat <<EOT >> /etc/rc.local
#!/bin/sh -e
exec 2> /tmp/rc.local.log      # send stderr from rc.local to a log file
exec 1>&2                      # send stdout to the same log file
set -x                         # tell sh to display commands before execution

# Auto start miner
/home/digdug/miner_launcher.sh 10 &

exit 0
EOT
