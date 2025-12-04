#!/usr/bin/env bash

## Clears and Displays My Beautiful ASCII Art :)

clear
cat << "EOF"

#      /$$$$$$                      /$$       /$$      /$$ /$$           /$$             /$$    
#     /$$__  $$                    | $$      | $$$    /$$$|__/          |__/            | $$    
#    | $$  \ $$  /$$$$$$   /$$$$$$$| $$$$$$$ | $$$$  /$$$$ /$$ /$$$$$$$  /$$  /$$$$$$$ /$$$$$$  
#    | $$$$$$$$ /$$__  $$ /$$_____/| $$__  $$| $$ $$/$$ $$| $$| $$__  $$| $$ /$$_____/|_  $$_/  
#    | $$__  $$| $$  \__/| $$      | $$  \ $$| $$  $$$| $$| $$| $$  \ $$| $$|  $$$$$$   | $$    
#    | $$  | $$| $$      | $$      | $$  | $$| $$\  $ | $$| $$| $$  | $$| $$ \____  $$  | $$ /$$
#    | $$  | $$| $$      |  $$$$$$$| $$  | $$| $$ \/  | $$| $$| $$  | $$| $$ /$$$$$$$/  |  $$$$/
#    |__/  |__/|__/       \_______/|__/  |__/|__/     |__/|__/|__/  |__/|__/|_______/    \___/  
#                                                                                               
#                                                                                               
#                                   github : erfanmousaviam-dev
#                  
#            If you liked the install script I could use your star on the project :)                                                                                                                                                                                                                                                                                                        

EOF

install_dotfiles(){
    
    echo "Now Installing Packages Needed For The Rice :)"
    sleep 2
    sudo pacman -Syu --noconfirm
    sudo pacman -S xorg-server xorg-xwayland ttf-dejavu noto-fonts waybar hyprland hypridle hyprlock hyprpaper hyprsunset otf-font-awesome materia-gtk-theme bluez-utils bluez blueman swaync gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb tumbler unrar unzip git base-devel xf86-video-intel brightnessctl papirus-icon-theme pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber thunar-volman wofi power-profiles-daemon man-db thunar ly networkmanager network-manager-applet nwg-look kitty
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    sudo systemctl enable networkmanager
    sudo systemctl enable bluetooth
    sudo systemctl enable ly
    cp -r config_files/* /home/$USER/.config/
    USER=$(whoami)
    chown -R $USER:$USER /home/$USER/.config/

}


while true;do
    clear
    cat << "EOF"

#      /$$$$$$                      /$$       /$$      /$$ /$$           /$$             /$$    
#     /$$__  $$                    | $$      | $$$    /$$$|__/          |__/            | $$    
#    | $$  \ $$  /$$$$$$   /$$$$$$$| $$$$$$$ | $$$$  /$$$$ /$$ /$$$$$$$  /$$  /$$$$$$$ /$$$$$$  
#    | $$$$$$$$ /$$__  $$ /$$_____/| $$__  $$| $$ $$/$$ $$| $$| $$__  $$| $$ /$$_____/|_  $$_/  
#    | $$__  $$| $$  \__/| $$      | $$  \ $$| $$  $$$| $$| $$| $$  \ $$| $$|  $$$$$$   | $$    
#    | $$  | $$| $$      | $$      | $$  | $$| $$\  $ | $$| $$| $$  | $$| $$ \____  $$  | $$ /$$
#    | $$  | $$| $$      |  $$$$$$$| $$  | $$| $$ \/  | $$| $$| $$  | $$| $$ /$$$$$$$/  |  $$$$/
#    |__/  |__/|__/       \_______/|__/  |__/|__/     |__/|__/|__/  |__/|__/|_______/    \___/  
#                                                                                               
#      
EOF
    echo "1) Install DotFiles"
    echo "2) Exit"
    echo -n "===> Select An Option : "
    read choice

    case "$choice" in
        1)
            install_dotfiles
            ;;
        2) 
            exit 0;
            ;;
        *)
            echo "Wrong Choice !"; sleep 1; ;;
        esac
done