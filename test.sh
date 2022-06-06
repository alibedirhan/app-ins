#!/bin/sh
#Bu scripti hazırlamak için yardım aldığım siteler
#https://github.com/PCTLC157/Ubuntu-Scripts
#https://askubuntu.com/questions/459402/how-to-know-if-the-running-platform-is-ubuntu-or-centos-with-help-of-a-bash-scri
#https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script



show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Mavi
    number=`echo "\033[33m"` #Sarı
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    #echo cat /etc/os-release | awk -F '=' '/^PRETTY_NAME/{print $2}' | tr -d '"'

    printf "\n${menu}
    ***********************************************
                 **********************
                **Kurulacak Programlar**
                 **********************
    ***********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Sistemi Güncelle ${normal}\n"
    printf "${menu}**${number} 2)${menu} Gnome Tweak Tools ${normal}\n"
    printf "${menu}**${number} 3)${menu} Bazı gerekli Komutlar (git curl docker docker-compose)  ${normal}\n"
    printf "${menu}**${number} 4)${menu} Brave Browser ${normal}\n"
    printf "${menu}**${number} 5)${menu} Sublime Text ${normal}\n"
    printf "${menu}**${number} 6)${menu} VLC Player ${normal}\n"
    printf "${menu}**${number} 7)${menu} Spotify ${normal}\n"
    printf "${menu}**${number} 8)${menu} Extension Manager ${normal}\n"
    printf "${menu}**${number} 9)${menu} Anaconda Kurulumu ${normal}\n"
    printf "${menu}**${number} 10)${menu} Kvantum Manager ${normal}\n"
    printf "${menu}**${number} 11)${menu} Chrome ${normal}\n"

    printf "${menu}*********************************************${normal}\n"
    printf "Kurulumlar Sonrasında paket listelerini güncellemek için 1 numarayı seçin.${normal}\n"
    printf "Menüden çıkmak için  ${fgred}x'e basın. ${normal}\n"
    
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Option 1 Picked";
            sudo apt-get update && sudo apt-get upgrade -y;

            echo "          ****************************"
            echo "                Sistem Güncellendi"
            echo "          ****************************"
            sleep 5
            show_menu;

        ;;
        2) clear;
            option_picked "Option 2 Picked";
            sudo apt-get install gnome-tweaks;

            echo "          ****************************"
            echo "           Gnome Tweak Tools Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            sudo apt-get install git curl docker docker-compose ;

            echo "       *********************************************"
            echo "                     Bazı gerekli Komutlar" 
            echo "          (git curl docker docker-compose) Kuruldu"
            echo "      **********************************************"
            sleep 5            
            show_menu;
        ;;
        4) clear;
            option_picked "Option 4 Picked";
            sudo apt install apt-transport-https curl;
            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg;
            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list;
            sudo apt update;
            sudo apt install brave-browser;

            echo "          ****************************"
            echo "              Brave Browser Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;
        ;;    
        5) clear;
            option_picked "Option 5 Picket";
            echo "Bazı gerekli bağlılıklar indirilecek"
            sleep 1
            sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common  
            sudo apt-get update
            curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
            sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"

            echo "          ****************************"
            echo "              Sublime Text Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;
        
        ;;
        6) clear;
            option_picked "Option 6 Picked"
            sudo apt install vlc -y

            echo "          ****************************"
            echo "              VLC Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;

        ;;
        7) clear;
            option_picked "Option 7 Picked"
            sudo snap install spotify

            echo "          ****************************"
            echo "              Spotify Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;

        ;;
        8) clear;
            option_picked "Option 8 Picked"
            sudo apt install gnome-shell-extension-manager
            
            echo "          ****************************"
            echo "              Extension Manager Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;

        ;;
        9) clear;
            option_picked "Option 9 Picked"
            echo "Bazı gerekli bağlılıklar indirilecek"
            sleep 1
            sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
            cd /tmp
            curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
            bash Anaconda3-2020.02-Linux-x86_64.sh
            source ~/.bashrc
            conda list
            conda create --name my_env python=3
            conda activate my_env

            echo "          ****************************"
            echo "           Extension Manager Kuruldu"
            echo "          ****************************"
            sleep 5
            show_menu;

        ;;
        10) clear;
             option_picked "Option 10 Picked"
             sudo apt-get -y install qt5-style-kvantum-themes
             sudo aptitude update
             echo "Bazı gerekli bağlılıklar indirilecek"
             sleep 1
             sudo aptitude -y install qt5-style-kvantum-themes

             echo "          ****************************"
             echo "             Kvantum Manager Kuruldu"
             echo "          ****************************"
             sleep 5

        ;;
        11) clear;
             option_picked "Option 11 Picked"
             wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
             sudo dpkg -i google-chrome-stable_current_amd64.deb

             echo "          ****************************"
             echo "                 Chrome Kuruldu"
             echo "          ****************************"
             sleep 5

        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Kurmak istediğiniz Programı menüden seçin";
            show_menu;
        ;;
      esac
    fi
done