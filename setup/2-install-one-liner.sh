/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
curl -fsSL https://raw.githubusercontent.com/dewhurstwill/dotfiles/main/setup/brew_packages_list.txt | while read line; do brew install "$line";done
