Follow this guide: http://www.cryptobadger.com/2017/04/build-ethereum-mining-rig-linux/

However, since I have many different rigs, I want to dynamically generate hostname.

To do that, when starting claymore miner, substitute miner name with `$HOSTNAME`. However, in order for $HOSTNAME to be available, I would need to export it! Within `/etc/rc.local`, add a line `export HOSTNAME=/`hostname/``. That's all!
