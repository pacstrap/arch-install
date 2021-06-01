#!/bin/bash

################################################################################
# bootable usb
################################################################################

wipefs --all /dev/sdx

# Find out the name of your usb drive with lsblk. 
# Make sure that it is NOT mounted.

dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync

################################################################################
# wipe hdd
################################################################################

gdisk /dev/sdx x, z, y, y
gdisk /dev/sdx o
gdisk /dev/sdx n
gdisk /dev/sdx w