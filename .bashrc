# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

# wyłączenie ctrl-s i ctrl-q
stty -ctlecho

# ustawinie esc na capslocku
if [ $DISPLAY ]; then
    setxkbmap -option caps:escape
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

TEMPDIR=$HOME/tmp
