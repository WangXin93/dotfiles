#!/usr/bin/env sh

sudo apt install vim tmux -y
# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./.tmux.conf ~
cp ./.vimrc ~

# Install xclip for remote copy in tmux
sudo apt install xclip -y

# vim -E -s << EOF
#     :PlugInstall
# EOF
#
# # Compile YCM
# sudo apt-get install -y build-essential cmake
# sudo apt-get install -y python-dev python3-dev
# cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --clang-completer

# Config .bashrc
cp ./git-* ~
cat ./.bashrc >> ~/.bashrc
