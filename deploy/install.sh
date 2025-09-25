#!/usr/bin/env bash

sudo pacman -Syu
#system utils
sudo pacman -S \
	alacritty \
	man \
	man-db \
	man-pages \
	gparted \
	ly \
	rsync \
	dunst \
	htop \
	btop \
	nvtop \
	amdgpu_top \
	keyd \
	swaylock \
	networkmanager \
#	rofi \
#	hyperland \
#	slurp \
#	grim \
#	qemu/kvm

#user utils
sudo pacman -S \
	obs-studio \
	man \
	gparted \
	gimp \
	inkscape \
	vlc \
	thunar \
	fzf \
	entr \
	cmus \
	sxiv \
	mpv \
	ffmpeg \
	less \
	flatpak

#dev tools
sudo pacman -S \
	neovim \
	git \
	gcc \
	clang \
	gdb \
	valgrind \
	make \
	pkgconf \
	ctags \
	opengl-man-pages \
	openssh \
	glfw \
	glew \
	python \
	python-numpy \
	python-matplotlib \
	python-opengl \
	python-opencv \
	python-pandas \
	npm \
	thunar \
	blender \
	gzip \
	zip \
	xz \
	tar \
	binutils \
	coreutils \
	base-devel \

#eyecandy
sudo pacman -S \
	figlet \
	cmatrix \
	cowsay \

#clib and python librays
#flatpak
yay -S cbonsai \
	pipes.sh \
	rar
