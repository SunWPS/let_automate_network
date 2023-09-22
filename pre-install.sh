#!/bin/bash

# Update the package list and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Install Vim
sudo apt install vim

# Install Git
sudo apt install git -y

# Install Python 3 and Pip
sudo apt install python3 python3-pip -y

# Download PyCharm (Community Edition) from the official website
wget -O pycharm.tar.gz https://download.jetbrains.com/python/pycharm-community-2021.3.3.tar.gz

# Extract PyCharm
sudo tar -xzvf pycharm.tar.gz -C /opt/
sudo rm pycharm.tar.gz

# Rename the PyCharm directory to a more generic name
sudo mv /opt/pycharm* /opt/pycharm

# Create a desktop shortcut for PyCharm
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Exec=/opt/pycharm/bin/pycharm.sh
Icon=/opt/pycharm/bin/pycharm.png
Categories=Development;IDE;" > ~/.local/share/applications/pycharm.desktop

# Make the shortcut executable
chmod +x ~/.local/share/applications/pycharm.desktop

# Create a symbolic link to PyCharm binary for command-line usage
sudo ln -s /opt/pycharm/bin/pycharm.sh /usr/local/bin/pycharm

# Output installation completion message
echo "Git, Python 3, Pip, and PyCharm have been installed successfully!"

# Clean up the package manager cache
sudo apt clean

# install gns3
sudo add-apt-repository ppa:gns3/ppa
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install gns3-gui gns3-server dynamips gns3-iou

# add user to ubridge group
sudo usermod -aG ubridge network

# Exit the script
exit 0
