#!/usr/bin/env bash
touch /etc/modprobe.d/blacklist-nouveau.conf
echo "blacklist nouveau nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
pacman -S nvidia-open nvidia-utils nvidia-settings lib32-nvidia-utils

# Define the NVIDIA modules
NVIDIA_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
# Update mkinitcpio.conf
sed -i -E "/^MODULES=/ s|\(([^)]*)\)|(\1 $NVIDIA_MODULES)|" /etc/mkinitcpio.conf

mkinitcpio -P