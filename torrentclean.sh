#!/bin/bash
#This scripts cleanup my torrent file and clean up my mess
echo "Welcome $LOGNAME"
echo "Starting script at $(date)"
echo "Running the Torrent Clean Script"
cd /home/yash/Downloads
ls *.torrent > ../scripts/output.txt
rm -r *.torrent
echo "script has been completed at $(date)"