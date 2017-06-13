# AWS-Ethereum-mining (great for P2 machines)
A shell script to mine Ethereum on AWS P2 EC2 Instances

## 1: SSH into your server for the first time and run the following commands
```
git clone https://github.com/joshteng/Ethereum-mining
cd Ethereum-mining/aws
chmod +x aws_p2.sh
sudo ./aws_p2.sh
```
*Just hit 'Yes' or 'Y' or ENTER every time you are prompted*

Once it's done, you can now terminate your SSH session and your server should be mining in the background! Don't forget to change the script to use your own Ether Wallet address!

## To SSH into your server
```
ssh -i <path-to-aws-key-file> ubuntu@<ec2-address>
```

### To easily spin up new instances!
Create an AMI of your working instance and then in future, when you create new instances, just select the AMI you created. You will still need to SSH into your newly created instances to begin mining.

However, it's possible to ensure that your miner begins working as soon as your instances start up! Check this link http://ccm.net/faq/3348-execute-a-script-at-startup-and-shutdown-on-ubuntu

### References
