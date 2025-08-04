#!/usr/bin/env bash
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scriptdir="$dir/scirpts"
packages="$dir/packages.conf"
aur_packages="$dir/aur_packages.conf"

bash "$scriptdir/pacman.sh"
bash "$scriptdir/aur.sh"
grep -v '^#' "$packages" | xargs -r pacman -S --noconfirm --needed
grep -v '^#' "$aur_packages" | xargs -r yay -S --noconfirm --needed

bash "$scriptdir/nvidia.sh"
bash "$scriptdir/services.sh"
reboot