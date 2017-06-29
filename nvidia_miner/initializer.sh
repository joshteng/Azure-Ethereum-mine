# Detect if new GPUs are installed
  sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration
  cp home/digdug/miner/mine.sh ~/miner/mine.sh
  cp home/digdug/oc.sh ~/oc.sh
  sudo reboot

# Detect if there is a change in internal IP Address and hostname
  # sudo reboot
