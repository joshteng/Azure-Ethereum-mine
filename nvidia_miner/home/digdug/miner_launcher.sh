#!/bin/bash
DEFAULT_DELAY=5
if [ "x$1" = "x" -o "x$1" = "xnone" ]; then
   DELAY=$DEFAULT_DELAY
else
   DELAY=$1
fi
sleep $DELAY

su digdug -c "screen -dmS ethm /home/digdug/miner/mine.sh"
