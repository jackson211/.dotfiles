#!/usr/bin/env bash
if [ "$(uname)" == "Darwin" ]; then
    echo -e "This is MacOS platform\n"
    # Do something under Mac OS X platform
    # Install Homebrew
    if command -v brew &> /dev/null; then

	echo -e "brew is already installed\n"
    else
    	if /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ; then
		echo -e "brew Installed\n"
    	else
		echo -e "Can't install brew\n" && exit
    	fi
    fi

    # brew update
    # brew upgrade

    # for i in $(cat brew_pkgs.txt);do
    #     brew install $i
    # done

    # brew cleanup
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo -e "This is GNU/Linux platform\n"
    # Do something under GNU/Linux platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo -e "This is 32 bits Windows NT platform\n"
    # Do something under 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    echo -e "This is 64 bits Windows NT platform\n"
    # Do something under 64 bits Windows NT platform
fi

# ZSH
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
	echo -e "ZSH and Git are already installed\n"
else
    if sudo apt install -y zsh git wget || sudo dnf install -y zsh git wget || sudo yum install -y zsh git wget || sudo brew install git zsh wget ; then
	echo -e "ZSH and Git Installed\n"
    else
	echo -e "Can't install ZSH or Git\n" && exit
    fi
fi

rm -r ~/.oh-my-zsh
if ln -s $PWD/.oh-my-zsh ~/.oh-my-zsh; then
    echo -e "oh-my-zsh linked\n"
else
    echo -e "Can't link oh-my-zsh\n" && exit
fi

rm -r ~/.fonts
if ln -s $PWD/.fonts ~/.fonts; then
    echo -e ".fonts linked\n"
else
    echo -e "Can't link .fonts\n" && exit
fi
fc-cache -fv ~/.fonts

cd ./autojump
if ./install.py; then
    echo -e "autojump Installed\n"
else
    echo -e "Can't install autojump\n" && exit
fi
cd ..

rm -r ~/.p10k.zsh
if ln -s $PWD/.p10k.zsh ~/.p10k.zsh; then
    echo -e ".p10k.zsh linked\n"
else
    echo -e "Can't link .p10k.zsh\n" && exit
fi

ZSHRC=~/.zshrc
if test -L "$ZSHRC"; then
    echo "$ZSHRC exist"
    rm ~/.zshrc
else
    echo "$ZSHRC does not exist"
fi

if ln -s $PWD/.zshrc ~/.zshrc; then
    echo -e ".zshrc linked\n"
else
    echo -e "Can't link .zshrc\n" && exit
fi

# vim
rm -r ~/.vim
if ln -s $PWD/.vim ~/.vim; then
    echo -e ".vim linked\n"
else
    echo -e "Can't link .vim\n" && exit
fi

rm ~/.vimrc
if ln -s $PWD/.vimrc ~/.vimrc; then
    echo -e ".vimrc linked\n"
else
    echo -e "Can't link .vimrc\n" && exit
fi

# tmux
rm ~/.tmux.conf
if ln -s $PWD/.tmux.conf ~/.tmux.conf; then
    echo -e ".tmux.conf linked\n"
else
    echo -e "Can't link .tmux.conf\n" && exit
fi

rm -r ~/.tmux
if ln -s $PWD/.tmux ~/.tmux; then
    echo -e ".tmux linked\n"
else
    echo -e "Can't link .tmux\n" && exit
fi


