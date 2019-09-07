
cp -r ./.vim ~
cp ./.vimrc ~

# setup vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
