# zshrc

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.aliases_prv ]]; then
    source ~/.aliases_prv
fi

if [[ -f "$HOME/.zsh/host/$(hostname -s)" ]]; then
    source "$HOME/.zsh/host/$(hostname -s)"
fi

export GOPATH=${HOME}/go
export PATH=$PATH:~/.local/bin
export PATH="$HOME/nvim/bin:$PATH"
export TERM=xterm-256color
export MANPAGER='less -X'  # nie czyści ekranu po wyjściu z man
export EDITOR="vim"

if [ $DISPLAY ]; then
    setxkbmap -option caps:escape         # ustawia caps lock jako ESC
    # xmodmap -e "keycode 62 = Shift_Lock"  # ustawia prawy Shift jako Shift Lock
    # xmodmap -e "keycode 62 = Caps_Lock"  # ustawia prawy Shift jako Caps Lock
    xset r rate 280 40
fi

# get more info: $man zshoptions
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS        # pound sign in interactive prompt
HISTFILE=~/.zsh_history            # where to save zsh history
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE='([bf]g *|cd ..|cd|l[alsh]#( *)#|less *|vim# *)'

setopt extendedglob
unsetopt caseglob

# Klawisz Del
bindkey '\e[3~' delete-char

# Działanie klawisza Home i End
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# włączenie trybu vim
bindkey -v

# edycja bieżącej komendy w edytorze za pomocą Esc+v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# no delay entering normal mode
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=1

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
# bindkey -a '^R' redo  # conflicts with history search hotkey
bindkey -a '^T' redo
bindkey '^?' backward-delete-char   #backspace
# bindkey '^H' vi-backward-delete-char  # backspace in vim

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# use cursor blinker color as indicator of vi mode
# http://andreasbwagner.tumblr.com/post/804629866/zsh-cursor-color-vi-mode
# http://reza.jelveh.me/2011/09/18/zsh-tmux-vi-mode-cursor

# bug; 112 ascii randomly showing up

 zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    if [[ $TMUX = '' ]]; then
      echo -ne "\033]12;Red\007"
    else
      printf '\033Ptmux;\033\033]12;red\007\033\\'
    fi
  else
    if [[ $TMUX = '' ]]; then
      echo -ne "\033]12;Grey\007"
    else
      printf '\033Ptmux;\033\033]12;grey\007\033\\'
    fi
  fi
}
zle-line-init () {
  zle -K viins
  echo -ne "\033]12;Grey\007"
}
zle -N zle-keymap-select
zle -N zle-line-init

autoload -U compinit && compinit        # enable autocompletion
fpath+=(~/.zsh/completion)              # set path to custom autocompletion
zstyle ':completion:*' menu select      # to activate the menu, press tab twice
unsetopt menu_complete                  # do not autoselect the first completion entry
setopt completealiases                  # autocompletion CLI switches for aliases
zstyle ':completion:*' list-colors ''   # show colors on menu completion

setopt complete_in_word                 # tab completion from both ends
setopt glob_complete                    # wildcard completion eg. *-tar

# setopt auto_menu         # show completion menu on succesive tab press
# setopt always_to_end

# show dots if tab compeletion is taking long to load
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# autocomplete case-insensitive (all),partial-word and then substring
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# when new programs is installed, auto update autocomplete without reloading shell
zstyle ':completion:*' rehash true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.zsh

fzf_history() { zle -I; eval $(history | fzf +s | sed 's/ *[0-9]* *//') ; }; zle -N fzf_history
fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_killps
fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR" ; }; zle -N fzf_cd
fzf-dmenu() { selected="$(ls /usr/share/applications | fzf -e)"; nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -l | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1& }
fzf_surfraw() { zle -I; surfraw $(cat ~/.config/surfraw/bookmarks | fzf | awk 'NF != 0 && !/^#/ {print $1}' ) ; }; zle -N fzf_surfraw

bindkey '^W' fzf_surfraw
bindkey '^F' fzf_history 
bindkey '^Q' fzf_killps
bindkey '^E' fzf_cd
bindkey -s '^O' "fzf-dmenu\n"

# export FZF_DEFAULT_OPTS='--inline-info --layout=reverse --border'
# export FZF_DEFAULT_OPTS='--inline-info --layout=reverse --exact'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--inline-info --layout=reverse'

# Options
setopt AUTO_CD           # instead of 'cd folder' if you could just type 'folder'
# setopt MULTIOS           # now we can pipe to multiple outputs!
# setopt CORRECT           # spell check commands!  (Sometimes annoying)
setopt AUTO_PUSHD        # This makes cd=pushd
# setopt AUTO_NAME_DIRS    # This will use named dirs when possible
#
# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL
#
# beeps are annoying
setopt NO_BEEP

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# partial history search using up and down arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Bang! Previous Command Hotkeys
# print previous command but only the first nth arguments
# Alt+1, Alt+2 ...etc
# http://www.softpanorama.org/Scripting/Shellorama/bash_command_history_reuse.shtml#Bang_commands
bindkey -s '\e1' "!:0 \t"        # last command
bindkey -s '\e2' "!:0-1 \t"      # last command + 1st argument
bindkey -s '\e3' "!:0-2 \t"      # last command + 1st-2nd argument
bindkey -s '\e4' "!:0-3 \t"      # last command + 1st-3rd argument
bindkey -s '\e5' "!:0-4 \t"      # last command + 1st-4th argument
bindkey -s '\e`' "!:0- \t"       # all but the last argument
bindkey -s '\e9' "!:0 !:2* \t"   # all but the 1st argument (aka 2nd word)

# copy current command to clipboard (Ctrl+X)
# https://www.reddit.com/r/commandline/comments/4fjpb0/question_how_to_copy_the_command_to_clipboard/
zle -N copyx; copyx() { echo -E $BUFFER | xsel -ib }; bindkey '^X' copyx

# Use "cbt" capability ("back_tab", as per `man terminfo`), if we have it:
if tput cbt &> /dev/null; then
  bindkey "$(tput cbt)" reverse-menu-complete # make Shift-tab go to previous completion
fi
unset SSH_AGENT_PID

pgrep gpg-agent > /dev/null
if [ $? = 1 ]; then
    eval $(gpg-agent --daemon --enable-ssh-support)
    # gpg-connect-agent /bye
fi

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

GPG_TTY=$(tty)
export GPG_TTY

#echo $TTY | grep tty > /dev/null
#if [ $? = 0 ]; then
    #startx
#fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/minio/mc mc

# autoload -U add-zsh-hook

export COLORTERM=truecolor

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

# source ~/.base16_theme

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' disable-patterns "${(b)HOME}/code/portal(|-ee)(|/*)"
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
