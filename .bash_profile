shopt -s histappend

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:$(brew --prefix)/bin:$(brew --prefix)/sbin:$HOME/bin
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
    workspace=$(terraform workspace show)
    workspaceTxt=''
    if [[ "$workspace" != "default" ]]; then workspaceTxt="[TF Workspace: $workspace]"; fi
    printf "\n $txtred%s: $bldpur%s $txtgrn%s $bldgrn%s \n$txtrst" "$(hostname)" "$dir" "$(vcprompt)" "$workspaceTxt"
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

function htunnel()
{
    ssh -p 25567 -N -L $3:$1:$2 user@redacted
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

function tfrc()
{
  echo "credentials \"app.terraform.io\" {" > ~/.terraformrc
  echo '  token = "TFCLOUD TOKEN GOES HERE"' >> ~/.terraform
rc
  echo "}" >> ~/.terraformrc
}

tfc-new-workspace()
{
  data='{ "data": { "attributes": { "name": "WORKSPACE-HERE", "resource-count": 0, "updated-at": "2017-11-29T19:18:09.976Z" },
"type": "workspaces" }}'
  curl --header "Authorization: Bearer TFCLOUD TOKEN GOES HERE" --header "Content-Type: application/vnd.api+json" --request POST --data "$data" https://app.terraform.io/api/v2/organizatio
ns/TF CLOUD ORG GOES HERE/workspaces
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
alias dev='cd ~/Dev'
alias devc='dev && clear'
alias h='cd ~/'
alias hc='h && clear'
alias home='h'
alias dropdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias tree="tree -C"
alias create-bation="kubectl create -f https://gist.githubusercontent.com/dewhurstwill/14cd4517e77322b380e10acd31067d65/raw/150
8dbc5b59fd812738ad1ae0476342c656a9068/bastion.yaml && sleep 10 && kubectl exec -it bastion -- /bin/bash"
alias new-bastion="kubectl create -f https://gist.githubusercontent.com/dewhurstwill/14cd4517e77322b380e10acd31067d65/raw/1508d
bc5b59fd812738ad1ae0476342c656a9068/bastion.yaml && sleep 10 && kubectl exec -it bastion -- /bin/bash"
alias connect-bastion="kubectl exec -it bastion -- /bin/bash"
alias bastion="kubectl apply -f https://gist.githubusercontent.com/dewhurstwill/14cd4517e77322b380e10acd31067d65/raw/1508dbc5b5
9fd812738ad1ae0476342c656a9068/bastion.yaml && sleep 10 && kubectl exec -it bastion -- /bin/bash"
alias npkill="npx npkill"

# -------
# Git Aliases
# -------

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# -------
# Terraform Aliases
# -------

alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfv="terraform validate"
alias tff="terraform fmt"
alias tfim="terraform import"
alias tf='terraform'
alias tfdoc='terraform-docs'
alias terratest="go test -v -timeout 90m"

# -------
# Command Replacement Aliases
# -------

alias cat=bat
alias vi=nvim
alias grep=rg
