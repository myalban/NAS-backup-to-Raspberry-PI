#!/bin/sh
echo "==================================NAS BACKUP========================="
#figlet NAS BACKUP
date
START=$(date +%s)
echo "NAS backup starting...";
echo "Mount backup drive"
mount /dev/sda1 /media/usb/usb1
sudo chmod 777 /media/usb/usb1
sudo chown pi /media/usb/usb1
echo "Mount NAS drive"
mount -t cifs //192.168.1.20/Volume_1 /media/nas/nas_drive1 -o username=pi,password=pi
rsync -av /media/nas/nas_drive1/MesImages /media/usb/usb1/.
rsync -av /media/nas/nas_drive1/Camescope /media/usb/usb1/.
echo "Backup done !"
FINISH=$(date +%s)
echo "Total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds"
echo "unmount drives"
umount /media/usb/usb1
umount /media/nas/nas_drive1