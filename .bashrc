# .bashrc

[ -f "/etc/bashrc" ] && . "/etc/bashrc"

[ -f "$HOME/.vars" ] && . "$HOME/.vars"

# export PS1="[\u@\h:\w]\\$ \d\[$(tput sgr0)\]"
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

PS1='\[\e[0m\][\[\e[0;38;5;154m\]\D{%Y-%m-%d %H:%M}\[\e[0m\]]\[\e[0m\][\[\e[0;38;5;220m\]\!\[\e[0m\]]\[\e[0m\][\[\e[0;38;5;33m\]$?\[\e[0m\]]\[\e[0m\][\[\e[0m\]\u\[\e[0m\]@\[\e[0m\]\H\[\e[0m\]]\[\e[0m\][\[\e[0;38;5;51m\]\w\[\e[0m\]]\e[0;38;5;82m\]$(parse_git_branch)\[\e[m\]\n\[\e[0;38;5;82m\]\$\[\e[m\] \[\e0'

# wczytuje plik $HOME/.aliases jeśli istnieje
[ "$HOME/.aliases" ] && source "$HOME/.aliases"

# wyłączenie ctrl-s i ctrl-q
stty -ctlecho

# ustawinie esc na capslocku
if [ $DISPLAY ]; then
    setxkbmap -option caps:escape
    xset r rate 280 40
fi

# włączenie vi mode
set -o vi

# historia poleceń
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000
HISTTIMEFORMAT='%F %T'
PROMPT_COMMAND='history -a'

eval $(ssh-agent)
eval $(gpg-agent --daemon)
GPG_TTY=$(tty)
export GPG_TTY
export GPG_ID=''

source <(gopass completion bash)

# To polecenie powinno być uruchamiane jako ostatnie w pliku ~/.bashrc
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"
