
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

for i in $(cat brew_pkgs.txt);do
    brew install $i
done

brew cleanup
