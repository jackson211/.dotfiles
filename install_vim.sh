
ln -sv ./.vim ~
ln -sv ./.vimrc ~

# setup vundle
if git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
then
    echo "pulling Vundle"
else
    cd ~/.vim/bundle/Vundle.vim && git pull
fi


vim +PluginInstall +qall
