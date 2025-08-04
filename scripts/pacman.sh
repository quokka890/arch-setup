#!/usr/bin/env bash
sed -i '/#\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
pacman -Sy

reflector --sort rate --latest 15 --protocol https --country Portugal,Spain --verbose --save /etc/pacman.d/mirrorlist