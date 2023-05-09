#!/bin/bash 
configs="$HOME/.config/nvim"
col1="\e[31m"
col2="\e[35m"
res="\e[0m"
function running(){
    printf "${col1}[R]${res} %s\n" "$1"
}

function ERR(){
    printf "${col2}[ERR]${res} %s\n" "$1"
    exit 1
}

printf "Pick One...\n[1] Install packer only\n[2] Install packer and configure nvim\n>>"
read ans 

running "Installing Packer..."
[ -f /bin/git ] && printf "%s\n" "git found running...." || ERR "git not found" 
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

running "Some dependices... [ ripgrep for telescope ]"
sudo pacman -Sy ripgrep  --noconfirm || ERR "could not install ripgrep..."

if [ $ans -eq 2 ];then 
    running "Setting up nvim..."
    [ -d "$configs" ] && { running "making backup..."; mv "$configs" "$HOME/.config/nvim_backup"; }
    mkdir -p $configs && cp -r * "$configs" || ERR "unable to copy files over..."
fi

exit 
