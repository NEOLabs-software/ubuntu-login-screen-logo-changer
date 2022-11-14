#!/bin/bash
echo "Welcome to the ubuntu login logo changer"
read -p "What is the photo you wish to use? " photolocation 
echo The photo you chose is $photolocation, is that right
read -p "{y|N} " yesno
if [ $yesno == y ]
then
   echo "Starting"
   if [ $(whoami) == root ]
then
   echo root confirmed
   cp $photolocation /usr/share/plymouth/ubuntu-logo.png
   echo Finished!
   echo do you want to restart gdm3?
   read -p "{y|N} " yesno2
   if [ $yesno2 == y ]
   then
      systemctl restart gdm
   else
      echo "DONE!"
   fi
else
   echo aborted, not root
fi

else
   echo "Aborting"
fi
 
