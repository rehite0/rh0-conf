#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S --needed \
	hyprland \
	hyprshot \
	hyprlock \
	hyprpicker \
	hypridle \

#	swaylock \
#	rofi \
#	slurp \
#	grim \
	
#system utils
sudo pacman -S --needed \
	alacritty \
	btop \
	dunst \
	gparted \
	htop \
	keyd \
	man \
	man-db \
	man-pages \
	networkmanager \
	rsync \
	gnupg \
	timeshift \
	virt-manager \
	qemu-desktop \
	brightnessctl \
	playerctl \
	loginctl \

#user utils
sudo pacman -S --needed \
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
sudo pacman -S --needed \
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
	nvtop \
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
	tmux \
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
sudo pacman -S --needed \
	figlet \
	cmatrix \
	cowsay \

yay -S cbonsai \
	pipes.sh \
	rar
