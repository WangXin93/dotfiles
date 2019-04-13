#!/usr/bin/env sh

# Install tmux vim xsel
sudo apt install vim tmux xsel curl -y

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln ./.tmux.conf ~/.tmux.conf
ln ./.vimrc ~/.vimrc
if [ ! -d ~/.vim/colors ]
then
    mkdir -p ~/.vim/colors
fi
cp ./.vim/colors/* ~/.vim/colors

# Config .bashrc
cp ./git-* ~
cat ./.bashrc >> ~/.bashrc

# Install autojump
git clone git://github.com/wting/autojump.git
cd autojump && ./install.py && cd ..
rm -rf autojump

# Install Ack
if [ ! -d ~/bin ]
then
    mkdir ~/bin
fi
curl https://beyondgrep.com/ack-2.22-single-file > ~/bin/ack && chmod 0755 ~/bin/ack

# Copy my command line tools
cp bin/* ~/bin

# Install xclip for remote copy in tmux
# sudo apt install xclip -y

# vim -E -s << EOF
#     :PlugInstall
# EOF
#
# # Compile YCM
# sudo apt-get install -y build-essential cmake
# sudo apt-get install -y python-dev python3-dev
# cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --clang-completer
