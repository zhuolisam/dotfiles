HOST_NAME=zhuoli

# Set homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# Auto append history into .bash_history
shopt -s histappend

export HISTSIZE=5000
export HISTFILESIZE=10000

#Binds up and down to history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#Colouring and make the prompt looks like zsh
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n$txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" ""
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
