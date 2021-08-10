#!/bin/bash
echo "_____________      __.__                 ________                       .___"
echo "\__    ___/  \    /  \__|______   ____  /  _____/ __ _______ _______  __| _/"
echo "  |    |  \   \/\/   /  \_  __ \_/ __ \/   \  ___|  |  \__  \\_  __ \/ __ | "
echo "  |    |   \        /|  ||  | \/\  ___/\    \_\  \  |  // __ \|  | \/ /_/ | "
echo "  |____|____\__/\  / |__||__|    \___  >\______  /____/(____  /__|  \____ | "
echo "      /_____/    \/                  \/        \/           \/           \/ "
echo "=============================================================================="
echo " 1. Create Wireguard Profile"
echo " 2. Cek status Wireguard"
echo " 3. Remove Wireguard Profile"
echo " 4. Exit"
echo "=============================================================================="
echo " create wireguard config at $HOME/wg.conf "
echo -n "Pilih menu: "
read menu

case $menu in

  1)	
	read -p "WG profile. (ex:wg0 / wg1 / wg2):" profile
	sudo cat $HOME/wg.conf >> /etc/wireguard/$profile.conf
	sudo systemctl enable wg-quick@$profile
	sudo wg-quick up $profile 
    ;;

  2)
    sudo wg
    ;;

  3)
	echo "List wireguard profile"
    	sudo ls /etc/wireguard/
	read -p "Hapus profile (ex:wg0 / wg1 / wg2):" profile
	sudo wg-quick down $profile
	sudo rm /etc/wireguard/$profile.conf
    ;;
	
  *)
    echo -n "unknown"
    ;;
esac

