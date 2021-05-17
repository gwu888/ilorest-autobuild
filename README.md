# ilorest-autobuild.sh  -- An ilorest script to automatically mount ISO image and build server.

1) ilorest login to ilo5
2) delete logical drive (existing mirror) on boot disks
3) clear controller configuration ad reset to fa
4) factory reset controller
5) create logical drive with boot disks
6) mount OS image onto the virtualmedia drive
7) ilorest reboot
