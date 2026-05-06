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
	brightnessctl \
	btop \
	dunst \
	gnupg \
	gparted \
	htop \
	keyd \
	loginctl \
	man \
	man-db \
	man-pages \
	networkmanager \
	playerctl \
	qemu-desktop \
	rsync \
	timeshift \
	virt-manager \
	linux-headers \

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
	v4l2loopback-dkms \
	vlc \
	vlc-plugin-ffmpeg \
	yazi \
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
	docker \
	emacs \
	gcc \
	gdb \
	git \
	glew \
	glfw \
	gzip \
	make \
	neovim \
	npm \
	nvtop \
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
	tmux \
	valgrind \
	xz \
	zip \
	# direnv \


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
	cava \


yay -S cbonsai \
	pipes.sh \
	rar
