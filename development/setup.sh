#!/bin/bash

set -e

sudo yum install -y http://install.linux.ncsu.edu/pub/yum/itecs/public/chromium/rhel7/noarch/chromium-release-2.2-1.noarch.rpm
sudo yum install -y https://github.com/atom/atom/releases/download/v1.6.0-beta4/atom.x86_64.rpm
sudo yum install -y vim chromium firefox git tree


sudo yum install -y nodejs
sudo yum install -y npm
sudo npm install -g npm
sudo npm install -g bower
sudo npm install -g ember-cli@2.3

sudo yum install -y python-pip mongodb python-pymongo python-pep8 pylint
sudo pip install flask

runuser -l vagrant -c  '
set -e
cp -f /vagrant/vimrc ~/.vimrc
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

rm -rf ~/solarized
mkdir -p ~/solarized
cd ~/solarized
git clone https://github.com/sgerrand/xfce4-terminal-colors-solarized.git
mkdir -p  ~/.config/Terminal
cp -f xfce4-terminal-colors-solarized/light/terminalrc ~/.config/Terminal/
'
