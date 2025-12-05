#!/usr/bin/env bash

# Clears The Screen And Displays My Beautiful Ascii Art :)

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
#               If you liked the install script I could use your star on the project :)                                                                                                                                                                                                                                                                                                        
EOF

# A Function For Installing Dotfiles Submenu

install_dotfiles(){
    
    # Updating The System
   
    sudo pacman -Syu --noconfirm

    # Installing Packages
   
    sudo pacman -S xorg-server xorg-wayland hyprland hypridle hyprlock hyprpaper hyprsunset waybar ttf-dejavu noto-fonts otf-font-awesome materia-gtk-theme swaync
    sudo pacman -S bluez-utils bluez blueman gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
    sudo pacman -S tumbler unrar unzip git base-devel xf86-video-intel brightnessctl papirus-icon-theme thunar-volman wofi power-profiles-daemon man-db thunar
    sudo pacman -S ly networkmanager network-manager-applet nwg-look kitty

    # Installing Yay

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    
    # Enabling Services
    
    sudo systemctl enable networkmanager
    sudo systemctl enable bluetooth
    sudo systemctl enable ly
    
    # Copying Dotfiles To Home Folder
    
    USER=$(whoami)
    cp -r config_files/* /home/$USER/.config/
    chown -R $USER:$USER /home/$USER/.config/

    # Ending 

    clear
    echo "The Installation Is Completed !"

}


# Shows The Main Menu Of The Script

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