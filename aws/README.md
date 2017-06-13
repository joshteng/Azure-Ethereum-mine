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


### References
