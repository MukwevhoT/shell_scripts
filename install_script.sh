#!/bin/bash

wget https://raw.githubusercontent.com/MukwevhoT/shell_scripts/main/clean.sh  ~/

chmod +x clean.sh

echo -e "wtc" | sudo -S  mv clean.sh /bin

echo "Done!!"
