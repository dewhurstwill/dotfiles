xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
curl -fsSL https://raw.githubusercontent.com/dewhurstwill/dotfiles/main/setup/brew_packages_list.txt | while read line; do brew install "$line";done
sudo echo "/usr/local/bin/bash" >> /etc/shells
chsh -s /usr/local/bin/bash
curl -o ~/.bash_profile -fsSL https://github.com/dewhurstwill/dotfiles/tree/main/.bash_profile
curl -fsSL https://raw.githubusercontent.com/dewhurstwill/vscode-settings/master/vscode-extensions.txt | while read line; do code --install-extension "$line";done
curl -o "~/Library/Application Support/Code/User/settings.json" -fsSL https://raw.githubusercontent.com/dewhurstwill/vscode-settings/master/settings.json
