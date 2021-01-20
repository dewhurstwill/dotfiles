shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾" "📦" "🥞" "🌐" "📚" "🌍" "🛠" "📱")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$(hostname)" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

fortune | cowsay -f tux

function mkcd()
{
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias 🍺="git checkout -b drunk"
alias a='code .'
alias bp='bat ~/.bash_profile'
alias editbp='nvim ~/.bash_profile'
alias c='code .'
alias cls='clear'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias nsd='npm run startDev'
alias nr='npm run'
alias nis='npm i -S'
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias dev='cd ~/Documents/Dev/Projects'
alias devc='dev && clear'
alias blog='dev && cd _MyProjects/blog/_posts'
alias h='cd ~/'
alias hc='h && clear'
alias home='h'

# -------
# Command Replacement Aliases
# -------

alias cat=bat
alias vi=nvim
alias grep=rg
  
