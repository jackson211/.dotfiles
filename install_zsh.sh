
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


# powerlevel10k
if git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k; then :
else
    cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull
fi

# font
wget -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts/
wget -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts/
wget -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts/
wget -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts/

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

ZSHRC=~/.zshrc
if test -L "$ZSHRC"; then
    echo "$ZSHRC exist"
    rm ~/.zshrc
else
    echo "$ZSHRC does not exist"
fi

cp .zshrc ~
