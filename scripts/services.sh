#!/usr/bin/bash
systemctl enable NetworkManager
systemctl enable reflector.service
systemctl enable ufw.service
systemctl enable sddm.service