sleep 60

nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=1200'
nvidia-settings -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=1200'
nvidia-settings -a '[gpu:2]/GPUMemoryTransferRateOffset[3]=1100'
nvidia-settings -a '[gpu:3]/GPUMemoryTransferRateOffset[3]=1200'
nvidia-settings -a '[gpu:4]/GPUMemoryTransferRateOffset[3]=1200'
nvidia-settings -a '[gpu:5]/GPUMemoryTransferRateOffset[3]=1200'
