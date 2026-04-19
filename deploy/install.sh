#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S \
	hyperland
	
#system utils
sudo pacman -S \
	alacritty \
	amdgpu_top \
	btop \
	dunst \
	gparted \
	htop \
	keyd \
	man \
	man-db \
	man-pages \
	networkmanager \
	nvtop \
	rsync \
	gnupg \
	# swaylock \
#	rofi \
#	slurp \
#	grim \
#	qemu/kvm

#user utils
sudo pacman -S \
	blender \
	cmus \
	entr \
	ffmpeg \
	flatpak \
	fzf \
	gimp \
	inkscape \
	less \
	mpv \
	nsxiv \
	obs-studio \
	pandoc \
	thunar \
	vlc \
	zathura \
	zathura-pdf-poppler \
	# sxiv \

#dev tools
sudo pacman -S \
	amdgpu_top \
	base-devel \
	binutils \
	blender \
	clang \
	cmake \
	coreutils \
	ctags \
	gcc \
	gdb \
	git \
	glew \
	glfw \
	gzip \
	make \
	neovim \
	npm \
	opengl-man-pages \
	openssh \
	pkgconf \
	python \
	python-matplotlib \
	python-numpy \
	python-opencv \
	python-opengl \
	python-pandas \
	ripgrep \
	tar \
	thunar \
	valgrind \
	xz \
	zip \
	docker \
	glew \
	# direnv \
# 	emacs \


#clib and python librays
flatpak install com.github.tchx84.Flatseal
flatpak install com.visualstudio.code
flatpak install com.vivaldi.Vivaldi
flatpak install net.audiorelay.AudioRelay 
flatpak install org.chromium.Chromium 

#eyecandy
sudo pacman -S \
	figlet \
	cmatrix \
	cowsay \

yay -S cbonsai \
	pipes.sh \
	rar
