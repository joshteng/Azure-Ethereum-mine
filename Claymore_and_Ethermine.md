# Installing Claymore Miner with Ethermine Pool
1. Download the file
` wget https://www.dropbox.com/s/r5mn00lngbwipvo/Claymore%27s%20Dual%20Ethereum%2BDecred_Siacoin_Lbry_Pascal%20AMD%2BNVIDIA%20GPU%20Miner%20v9.5%20-%20LINUX.tar.gz?dl=1`

2. Extract the tar file
```
tar -xvzf Claymore%27s%20Dual%20Ethereum%2BDecred_Siacoin_Lbry_Pascal%20AMD%2BNVIDIA%20GPU%20Miner%20v9.5%20-%20LINUX.tar.gz?dl=1
```

3. Set environment variables
```
export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
```

4. Start mining
Claymore executable `ethdcrminer64` is inside the downloaded folder
`./ethdcrminer64 -epool us1.ethermine.org:4444 -ewal 0x3A732697eE046Bf09969Ae8Ce3618Dccc1764489.DigDugmAWSJTG2 -epsw x`

*Replace it with your own wallet address! However, I do appreciate donations.*

---
### Reference
Recommended wallet: https://www.myetherwallet.com/
Check miner status: https://ethermine.org/miners/3A732697eE046Bf09969Ae8Ce3618Dccc1764489
Claymore installation: https://bitcointalk.org/index.php?topic=1433925.0
