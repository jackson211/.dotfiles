# if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
#     echo -e "Installed tpm"
# fi

ln -s $PWD/.tmux.conf ~/.tmux.conf
ln -s $PWD/.tmux ~/.tmux

# cp .tmux.conf ~
# cp -r .tmux ~
tmux source ~/.tmux.conf
