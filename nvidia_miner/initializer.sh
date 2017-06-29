# Detect if new GPUs are installed
  echo "initialize Xorg file for all nvidia cards installed"
  sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration
  
  sleep 3

  echo "Use new wallet address"
  cp home/digdug/miner/mine.sh ~/miner/mine.sh
  
  sleep 3

  echo "add sleep 60 to Overclock Script"
  cp home/digdug/oc.sh ~/oc.sh
  
  echo "Rebooting in 4 seconds"
  sleep 4

  sudo reboot

# Detect if there is a change in internal IP Address and hostname
  # sudo reboot
