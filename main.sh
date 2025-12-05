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
    
       PACKAGES=(
        xorg-server xorg-xwayland hyprland hypridle hyprlock hyprpaper hyprsunset waybar
        noto-fonts otf-font-awesome swaync bluez-utils bluez blueman pipewire pavucontrol
        pipewire-pulse pipewire-alsa pipewire-jack wireplumber git base-devel brightnessctl
        wofi power-profiles-daemon thunar ly networkmanager network-manager-applet
        xdg-desktop-portal-hyprland hyprpolkitagent zsh kitty
    )

    while true; do
        echo ">>> Installing packages..."
        sudo pacman -Syu --noconfirm

        if sudo pacman -S --noconfirm "${PACKAGES[@]}"; then
            echo ">>> Packages installed successfully!"
            break
        else
            echo "!!! Package installation failed (Probably no internet)"
            echo ">>> Retrying in 5 seconds..."
            sleep 5
        fi
    done

    # Installing Yay

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    
    # Enabling Services
    
    sudo systemctl enable NetworkManager
    sudo systemctl enable bluetooth
    sudo systemctl enable ly
    
    # Copying Dotfiles To Home Folder
    
    USER=$(whoami)
    cp -r config_files/* /home/$USER/.config/
    chown -R $USER:$USER /home/$USER/.config/

    # Installing oh-my-zsh

    export RUNZSH=no
    export CHSH=no
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Ending 

    clear
    echo "The Installation Is Completed !"
    sleep 3

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
    echo ""
    echo "1) Install DotFiles"
    echo "2) Exit"
    echo ""
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