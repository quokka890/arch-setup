#!/usr/bin/env bash
touch /etc/modprobe.d/blacklist-nouveau.conf
echo "blacklist nouveau nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
# Define the NVIDIA modules
NVIDIA_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
# Update mkinitcpio.conf
sed -i -E "/^MODULES=/ s|^MODULES=\(.*\)|MODULES=($NVIDIA_MODULES)|" /etc/mkinitcpio.conf

mkinitcpio -P