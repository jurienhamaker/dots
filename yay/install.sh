#!/bin/bash
set -e

sudo pacman -S --needed git base-devel
mkdir tmp
git clone https://aur.archlinux.org/yay.git ./tmp/yay

cd ./tmp/yay
makepkg -si

cd ../../
ls -la
rm -rf ./tmp

yay -Sy $(cat ./packages) --noconfirm
