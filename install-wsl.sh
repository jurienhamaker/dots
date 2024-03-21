#!/usr/bin/env bash
cd "$(dirname "$0")"
export base="$(pwd)"
source ./scriptdata/functions
source ./scriptdata/installers
source ./scriptdata/options

#####################################################################################
if ! command -v pacman >/dev/null 2>&1; then
	printf "\e[31m[$0]: pacman not found, it seems that the system is not ArchLinux or Arch-based distros. Aborting...\e[0m\n"
	exit 1
fi

# Don't run as sudo
prevent_sudo_or_root

startask() {
	printf "\e[34m[$0]: Hi there!\n"
	printf 'This script 1. only works for ArchLinux and Arch-based distros.\n'
	printf '            2. has not been fully tested, use at your own risk.\n'
	printf '            3. does not provide GPU things and you must have set it up yourself.\n'
	printf "\e[31m"
	printf "Please CONFIRM that you HAVE ALREADY BACKED UP \"$HOME/.config/\" and \"$HOME/.local/\" folders!\n"
	printf "\e[97m"
	printf "Enter capital \"YES\" (without quotes) to continue:"
	read -p " " p
	case $p in "YES") sleep 0 ;; *)
		echo "Received \"$p\", aborting..."
		exit 1
		;;
	esac
	printf '\n'
	printf 'Do you want to confirm every time before a command executes?\n'
	printf '  y = Yes, ask me before executing each of them. (RECOMMENDED)\n'
	printf '  n = No, just execute them automatically.\n'
	printf '  a = Abort. (DEFAULT)\n'
	read -p "====> " p
	case $p in
	y) ask=true ;;
	n) ask=false ;;
	*) exit 1 ;;
	esac
}

case $ask in
false) sleep 0 ;;
*) startask ;;
esac

set -e
#####################################################################################
printf "\e[36m[$0]: 1. Get packages and add user to video/input groups\n\e[97m"

remove_bashcomments_emptylines ./scriptdata/dependencies_wsl.conf ./cache/dependencies_stripped_wsl.conf
readarray -t pkglist <./cache/dependencies_stripped_wsl.conf

if ! command -v yay >/dev/null 2>&1; then
	if ! command -v paru >/dev/null 2>&1; then
		echo -e "\e[33m[$0]: \"yay\" not found.\e[0m"
		showfun install-yay
		v install-yay
		AUR_HELPER=yay
	else
		echo -e "\e[33m[$0]: \"yay\" not found, but \"paru\" found.\e[0m"
		echo -e "\e[33mIt is not recommended to use \"paru\" as warned in Hyprland Wiki:\e[0m"
		echo -e "\e[33m    \"If you are using the AUR (hyprland-git) package, you will need to cleanbuild to update the package. Paru has been problematic with updating before, use Yay.\"\e[0m"
		echo -e "\e[33mReference: https://wiki.hyprland.org/FAQ/#how-do-i-update\e[0m"
		if $ask; then
			printf "Install \"yay\"?\n"
			printf "  y = Yes, install \"yay\" for me first. (DEFAULT)\n"
			printf "  n = No, use \"paru\" at my own risk.\n"
			printf "  a = Abort.\n"
			sleep 2
			read -p "====> " p
			case $p in
			[Nn]) AUR_HELPER=paru ;;
			[Aa])
				echo -e "\e[34mAlright, aborting...\e[0m"
				exit 1
				;;
			*)
				v paru -S --needed --noconfirm yay-bin
				AUR_HELPER=yay
				;;
			esac
		else
			AUR_HELPER=paru
		fi
	fi
else
	AUR_HELPER=yay
fi

if $ask; then
	# execute per element of the array $pkglist
	for i in "${pkglist[@]}"; do v $AUR_HELPER -S --needed $i; done
else
	# execute for all elements of the array $pkglist in one line
	v $AUR_HELPER -S --needed --noconfirm ${pkglist[*]}
fi

sudo usermod -aG video,input "$(whoami)"

#####################################################################################
printf "\e[36m[$0]: 2. Installing parts from source repo\e[97m\n"
sleep 1

#####################################################################################
printf "\e[36m[$0]: 3. Installing dots\e[97m\n"

# In case some folders does not exists
v mkdir -p "$HOME"/.{config,cache,local/{bin,share}}

dotdrop -p jurien-wsl install

# remove cache dir
rm -rf ./cache

#####################################################################################
printf "\e[36mPress \e[30m\e[46m Super+/ \e[0m\e[36m for a list of keybinds\e[97m\n"
