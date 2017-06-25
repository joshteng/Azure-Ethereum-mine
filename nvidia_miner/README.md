# Setting up a NVIDIA Mining Rig

1. Use the right motherboard! (don't try to save a buck here. Really. Your life will be hell.)
  Good options:
    - Asus Prime Z270 - A
    - ASRock H97 Anniversary
2. PCIe Risers will likely be your biggest obstacle. From our experience, the reliability of these risers have issues.
3. To automate start up of miner, create a script that starts claymore
4. Create another script that starts a screen with a name that runs the script you created in the step above
5. Create an alias in .bashrc to easily access your miner's stdout
6. Go to `/etc/rc.local` and run the script you created in step 4


## To automate your OC settings
1. Set coolbits to 28 and allow initial config to be empty
  `nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration`
2. Reboot
  `sudo reboot`
3. Have fun tuning
  1. You can run commands like `nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=1200'` directly in console to edit (the GUI version is just wonky)
  2. However, instead of running commands like that, I find it easier to keep track of everything in a file. So create a file, make it executable and run it to adjust your settings. I created a file in my home directory called `oc.sh` and it looks like

    ```
    nvidia-smi -pm 1
    nvidia-smi -pl 115
    nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=1200'
    nvidia-settings -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=1200'
    nvidia-settings -a '[gpu:2]/GPUMemoryTransferRateOffset[3]=1100'
    nvidia-settings -a '[gpu:3]/GPUMemoryTransferRateOffset[3]=1200'
    nvidia-settings -a '[gpu:4]/GPUMemoryTransferRateOffset[3]=1200'
    nvidia-settings -a '[gpu:5]/GPUMemoryTransferRateOffset[3]=1200' # assuming you have 6 GPUs
    ```

    You can run it by typing `./oc.sh`
    Tweak each GPU by each GPU until you find the right config!
  3. the command `nvidia-smi -pl` is to set the power limit for each GPU and `nvidia-smi -pm 1` is to make the setting persist
  4. Running this file is simple; however, if you are mining, you very likely want to automate this on startup. The solution is to autostart a terminal session as soon as you're logged in. You can very easily do this on Ubuntu's GUI. Just set an autostart rule for gnome-terminal (ubuntu) or xcfe4-terminal (xubuntu).
  5. You're not done yet! You still need to append to the last line of your `.bashrc` to run your `oc.sh` script.
  (You can't run `oc.sh` from `/etc/rc.local` `nvidia-settings` can only be ran after logging in from the computer itself. *You won't also be able to run `nvidia-settings` when you SSH in unless you first did a `export DISPLAY=:0`.)
  6. However, if you run your `oc.sh` script in `.bashrc`, it means that every time you start a new terminal session (or SSH), it will try to execute the script. So I wrote a hack:

  `~/.bashrc`
  ```
  #### some other code above

  ### Code I added at the bottom of this file ###
  OC_LOG_FILE="/tmp/oc.log"
  OC_SCRIPT="oc.sh"

  if [ ! -f $OC_LOG_FILE ]; then
    touch $OC_LOG_FILE
    sh $OC_SCRIPT > $OC_LOG_FILE
  else
    echo "Woot! Already ran initial $OC_SCRIPT OC script!"
  fi
  ```
  This essentially creates a log file the very first time you boot up and log in, just to indicate that the OS ran your OC script and logged the output from running your script. All files in `/tmp` are deleted when you reboot.

ENJOY!

p.s. for this to work, you need to ensure that your user auto logs in as soon as the computer boots. No password required even if password is set.
