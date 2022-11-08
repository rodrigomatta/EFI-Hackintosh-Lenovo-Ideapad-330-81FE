#!/bin/bash
# 
# Script: create-iso-macOS
# Goal: create "ISO" file for use in the Proxmox VE Environment or Balena Etcher
# 
# Author: Gabriel Luchina
# https://luchina.com.br
# 20211116T2245

clear

echo -e "\nAutomatize o script para criar o arquivo \"ISO\" do macOS Instale no Proxmox VE Environament ou Balena Etcher"
echo -e "BY: Universo Hachintosh"
echo -e "SUPORTE: https://discord.universohackintosh.com"

echo -n -e "\nCaminho para arquivos temporários (diretório de trabalho): "
read TEMPDIR

echo -n -e "Caminho para o arquivo de instalação do macOS (.app): "
read APPOSX

echo " "

## Core 
cd ${TEMPDIR} > /dev/null 2> /dev/null
rm -rf macOS-install* > /dev/null 2> /dev/null
hdiutil create -o macOS-install -size 14g -layout GPTSPUD -fs HFS+J > /dev/null 2> /dev/null
hdiutil attach -noverify -mountpoint /Volumes/install_build macOS-install.dmg > /dev/null 2> /dev/null
sudo "${APPOSX}/Contents/Resources/createinstallmedia" --volume /Volumes/install_build --nointeraction
hdiutil detach -force "/Volumes/Install macOS"* > /dev/null 2> /dev/null && sleep 3s > /dev/null 2> /dev/null
hdiutil detach -force "/Volumes/Shared Support"* > /dev/null 2> /dev/null
mv macOS-install.dmg macOS-install.iso > /dev/null 2> /dev/null

echo " "
