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

function deviceauth() {
  # Requires https://github.com/dewhurstwill/tamper-monkey-scripts/blob/main/Scripts/Microsoft/device-auth-injector.js
  URL="https://login.microsoftonline.com/common/oauth2/deviceauth?otp=$1"
  edge "$URL"
}

# Open url in chromium edge from command line
function edge() {
    URL=$1
    if [[ $1 != http* ]] ; then
        URL="https://$1"
    fi
    /usr/bin/open -a '/Applications/Microsoft Edge.app' "$URL"
}

# Open url in chrome from command line
function chrome() 
{
    URL=$1
    if [[ $1 != http* ]] ; then
        URL="http://$1"
    fi
    /usr/bin/open -a '/Applications/Google Chrome.app' "$URL"
}

# Open url in safari from command line
function safari()
{
    URL=$1
    if [[ $1 != http* ]] ; then
        URL="http://$1"
    fi
    /usr/bin/open -a '/Applications/Safari.app' "$URL"
}

# Google things from the command line
function google() {
    QUERY=$( rawurlencode "$*" )
    safari "https://www.google.co.uk/search?client=safari&rls=en&q=$QUERY&ie=UTF-8&oe=UTF-8"
}

# URL encoding function taken from https://stackoverflow.com/a/10660730
function rawurlencode()
{
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER)
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

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
alias dropdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias tf='terraform'
alias tfdoc='terraform-docs'
alias tree="tree -C"

# -------
# Git Aliases
# -------

alias ga="git add ."
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gl="git log"
alias gp="git push -u"
# The --force-with-lease option is like --force but will not overwrite other people's changes.
alias gpf="git push --force-with-lease"
alias gs="git status"
alias rebasem="git fetch --all && git rebase origin/master"

# -------
# Terraform Aliases
# -------

alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfv="terraform validate"
alias tff="terraform fmt"
alias tfim="terraform import"

# -------
# Command Replacement Aliases
# -------

alias cat=bat
alias vi=nvim
alias grep=rg
