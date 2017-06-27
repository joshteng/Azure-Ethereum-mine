PUBLIC_IP=`curl -4 http://l2.io/ip | sed -e 's/[\.]/-/g'`
echo "Starting miner with name: az-$(hostname)-$PUBLIC_IP"
/home/digdug/miner/claymore/ethdcrminer64 -epool us1.ethermine.org:4444 -ewal 0x3A732697eE046Bf09969Ae8Ce3618Dccc1764489.az-$(hostname)-$PUBLIC_IP -epsw x
