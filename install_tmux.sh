if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
    echo -e "Installed tpm"
fi

cp .tmux.conf ~
cp -r .tmux ~
tmux source ~/.tmux.conf
