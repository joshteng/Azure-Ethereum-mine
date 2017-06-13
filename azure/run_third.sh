sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum ethminer build-essential

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
