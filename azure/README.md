# Azure-Ethereum-mine
A shell script to mine Ethereum on Microsoft Azure

## 1: SSH into your server for the first time and run the following commands
```
git clone https://github.com/joshteng/Ethereum-mining
cd Ethereum-mining/azure
chmod +x run_first.sh
chmod +x run_second.sh
chmod +x run_third.sh
sudo ./run_first.sh
```
*Just hit 'Yes' or 'Y' every time you are prompted*

Your server should reboot itself after `run one`

## 2: SSH into your server for the second time and run the following commands
```
cd Ethereum-mining/azure
sudo ./run_second.sh
```
*Just hit 'Yes' or 'Y' every time you are prompted*

Again, after `run two` your server should reboot itself.

## 3: SSH into your server for the third time and run the following commands
```
cd Ethereum-mining/azure
sudo ./run_third.sh
```

You can now terminate your SSH session and your server should be mining in the background
Don't forget to change the script to use your own Ether Wallet address!

## To SSH into your server
```
ssh <username>@<server ip address>
```
*remember your password if you are not using SSH keys!*

### To easily spin up new VMs!
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/capture-image

Your miner won't automatically begin. It's important to remember to SSH into your VM and start it up manually.
However, it's possible to ensure that your miner begins working as soon as your instances start up! Check this link http://ccm.net/faq/3348-execute-a-script-at-startup-and-shutdown-on-ubuntu

### References

* https://docs.microsoft.com/en-us/azure/virtual-machines/linux/n-series-driver-setup#install-grid-drivers-for-nv-vms
* https://medium.com/azure-developers/mining-ethereum-with-azure-n-series-gpu-virtual-machines-81248b6f89ec
* https://medium.com/azure-developers/mining-bitcoin-other-altcoins-with-azure-n-series-gpu-virtual-machines-e8591895baba
