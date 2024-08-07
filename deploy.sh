#!/usr/bin/env bash

pkg1="man ly qtile alacritty blueman neofetch"
pkg2="blender obs-studio gimp blueman python vlc git thunar vivaldi mpv neovim rofi sxiv maim ffmpeg entr ctags"
pkg3="gparted sxhkd rsync raylib make gzip glew glfw"
# lockscreen, emoji, notification, wifi, note, 
sudo pacman -Syu
sudo pacman -S $pkg1 $pkg2 $pkg3
#ln -s
