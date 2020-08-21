# Aliasy

## ...

Przechodzi dwa katalogi wyżej

```
cd ../..
```

## ..

Przechodzi jeden katalog wyżej

```
cd ..
```

## .a

Edycja aliasów `$HOME/.aliases`
 
 ```
 vim $HOME/.aliases && source $HOME/.aliases
 ```

## .b

Edycja pliku `$HOME/.bashrc`

```
vim $HOME/.bashrc
```

## .bs

Edycja pliku konfiguracyjnego BSPWM `$HOME/.config/bspwm/bspwmrc`

```
vim $HOME/.config/bspwm/bspwmrc
```

## .d

Przechodzi do katalogu `$HOME/git/dotfiles`

```
cd $HOME/git/dotfiles
```

| `.s`               | `vim $HOME/.ssh/config`                                   |
| `.sx`              | `vim $HOME/.config/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd` |
| `.t`               | `vim $HOME/.tmux.conf"`                                   |
| `.v`               | `vim -c 'e \$MYVIMRC'"`                                   |
| `.z`               | `vim $HOME/.zshrc"`                                       |
| `batt`             | `$HOME/bin/batt`                                          |
| `cdb`              | `source ~/bin/cdb && cdb"`                                |
| `cdba`             | `source ~/bin/cdba && cdba"`                              |
| `cdbd`             | `source ~/bin/cdbd && cdbd"`                              |
| `cdbe`             | `vim ~/.config/bmdirs"`                                   |
| `cdf`              | `source $HOME/bin/cdf`                                    |
| `clear-gpg-passwd` | `gpg-connect-agent reloadagent /bye`                      |
| `df`               | `df -h`                                                   |
| `ff`               | `firefox`                                                 |
| `free`             | `free -m`                                                 |
| `g`                | `git`                                                     |
| `ga`               | `$HOME/bin/ga`                                            |
| `gp`               | `$HOME/bin/gp`                                            |
| `h`                | `history`                                                 |
| `l`                | `ll`                                                      |
| `ll`               | `exa -al --group-directories-first --git --header`        |
| `more`             | `less`                                                    |
| `n`                | `vim -c "e $HOME/notes"`                                  |
| `p`                | `pass`                                                    |
| `pwgen`            | `pwgen -c -s -n -y -1 32`                                 |
| `q`                | `exit`                                                    |
| `so`               | `source`                                                  |
| `t`                | `tmux`                                                    |
| `ta`               | `tmux atta`                                               |
| `v`                | `vim`                                                     |
| `vimrc`            | `vrc`                                                     |
| `vrc`              | `vim $HOME/.vim/vimrc`                                    |
