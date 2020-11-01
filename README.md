# My dotfiles

* [Bash Profile](https://github.com/dewhurstwill/dotfiles/tree/main/.bash_profile)
* [VSCode](https://github.com/dewhurstwill/dotfiles/tree/main/.vscode)
  * [VSCode Settings & Extensions](https://github.com/dewhurstwill/vscode-settings)
* Git
  * [.gitconfig](https://github.com/dewhurstwill/dotfiles/tree/main/.gitconfig)
  * [.gitignore](https://github.com/dewhurstwill/dotfiles/tree/main/.gitignore)

# OSX Setup

1. Dev Build Dependencies

```bash
xcode-select --install
```

2. [Homebrew](https://github.com/dewhurstwill/dotfiles/tree/main/setup/homebrew)
3. Change default shell to latest version of bash installed by homebrew

```bash
sudo vi /etc/shells 
```

Add /usr/local/bin/bash to the top of the list of available shells

Then

```bash
chsh -s /usr/local/bin/bash
```

to switch

4. Download bash_profile

```bash
curl -o ~/Downloads/.bash_profile -fsSL https://github.com/dewhurstwill/dotfiles/tree/main/.bash_profile
```

5. Copy contents of downloaded bash profile to ~/.bash_profile

6. Create a dev directory

```bash
mkdir ~/dev
```

DONE!
