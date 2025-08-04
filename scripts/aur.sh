#!/usr/bin/env bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay makepkg -si || exit 1