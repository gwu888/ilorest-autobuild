# ilorest-autobuild.sh  -- An ilorest script to mount ISO image and build server.

1) ilorest login to ilo
2) delete logical drive (existing mirror) on boot disks
3) clear controller configuration
4) factory reset controller
5) create logical mirrored boot drive with two hard diskses
6) mount OS image onto the virtualmedia 2 and bootnextreset
7) ilorest reboot
