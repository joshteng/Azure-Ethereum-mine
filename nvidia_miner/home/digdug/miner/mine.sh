#!/bin/sh
echo "This miner's hostname: $(hostname)"

/home/digdug/miner/claymore95/ethdcrminer64 -epool asia1.ethermine.org:14444 -ewal 0x3A732697eE046Bf09969Ae8Ce3618Dccc1764489.$(hostname) -epsw x
