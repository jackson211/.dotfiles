
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
        echo -e "ZSH and Git are already installed\n"
else
    if sudo apt install -y zsh git wget || sudo dnf install -y zsh git wget || sudo yum install -y zsh git wget || sudo brew install git zsh wget ; then
        echo -e "ZSH and Git Installed\n"
    else
        echo -e "Can't install ZSH or Git\n" && exit
    fi
fi

# ohmyzsh from github
if git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; then
    echo -e "Installed OH-MY-ZSH\n"
fi

# powerlevel9k
if git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k; then :
else
    cd ~/.oh-my-zsh/custom/themes/powerlevel9k && git pull
fi

# font
wget -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/

fc-cache -fv ~/.fonts

if git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions; then :
else
    cd ~/.oh-my-zsh/plugins/zsh-autosuggestions && git pull
fi

if git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; then :
else
    cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
fi

git clone git://github.com/wting/autojump.git
python3 ./autojump/install.py
rm -rf autojump

ln -sv ./.zshrc ~
