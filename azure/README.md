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
SSH into the VM you want to clone and run this command:
```
sudo waagent -deprovision -force
```
Then on your local machine run this (remember to change the resource group, VM name and all to suit your needs):
```
az vm deallocate --resource-group digduguseast --name digdug1
az vm generalize --resource-group digduguseast --name digdug1
az image create --resource-group digduguseast --location westus2 --name digdugimage --source digdug1
az vm create --resource-group digduguseast --size Standard_NV6 --location westus2 --storage-sku Standard_LRS --name digdug1 --image digdugimage --admin-username digdug --ssh-key-value ~/.ssh/id_rsa.pub
```

To spin up multiple at once
```
#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
   az vm create --resource-group digduguseast --size Standard_NC6 --location westus2 --storage-sku Standard_LRS --name "digdugnc$i" --image digdugimage --admin-username digdug --ssh-key-value ~/.ssh/id_rsa.pub --nsg digdug1NSG
done
```

### References

* https://docs.microsoft.com/en-us/azure/virtual-machines/linux/n-series-driver-setup#install-grid-drivers-for-nv-vms
* https://medium.com/azure-developers/mining-ethereum-with-azure-n-series-gpu-virtual-machines-81248b6f89ec
* https://medium.com/azure-developers/mining-bitcoin-other-altcoins-with-azure-n-series-gpu-virtual-machines-e8591895baba
