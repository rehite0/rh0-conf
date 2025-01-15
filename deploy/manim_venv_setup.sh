#!/usr/bin/env bash
if [ ! -d ~/.venv ] ;then
	mkdir ~/.venv
fi
if [ -d ~/.venv/manim/ ] ; then
	echo "manim already exist" 
	exit	
fi
if [ -zy "$(pacman -Qs python310)" ] ;then
	yay -Ss python310
fi
python3.10 -m venv ~/.venv/manim
cd ~/.venv/manim
source ./bin/activate
pip install manim
echo ">>add path+=~/.venv/manim/bin/manim in your bash rc"
