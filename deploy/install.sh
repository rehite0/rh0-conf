#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S \
	hyperland \

#	swaylock \
#	rofi \
#	slurp \
#	grim \
	
#system utils
sudo pacman -S \
	alacritty \
	amdgpu_top \
	nvtop \
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
	timeshift \
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


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#clib and python librays
flatpak install com.github.tchx84.Flatseal
flatpak install com.vivaldi.Vivaldi
flatpak install org.chromium.Chromium 
flatpak install com.visualstudio.code
flatpak install net.audiorelay.AudioRelay 

#eyecandy
sudo pacman -S \
	figlet \
	cmatrix \
	cowsay \

yay -S cbonsai \
	pipes.sh \
	rar
