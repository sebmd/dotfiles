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

Edycja pliku BSPWM `$HOME/.config/bspwm/bspwmrc`

```
vim $HOME/.config/bspwm/bspwmrc
```

## .d

Przechodzi do katalogu `$HOME/git/dotfiles`

```
cd $HOME/git/dotfiles
```

## .s

Edycja pliku `$HOME/.ssh/config`

```
vim $HOME/.ssh/config
```

## .sx


```
vim $HOME/.config/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd
```

## .t

Edycja pliku `$HOME/.tmux.comf`

```
vim $HOME/.tmux.conf
```

## .v

Edycja pliku edytora Vim

```
vim -c 'e \$MYVIMRC'
```

## .z

Edycja pliku `$HOME/.zshrc`

```
vim $HOME/.zshrc
```

##  batt

Wyświetlenie stanu baterii laptopa

```
$HOME/bin/batt
 ```
 
## cdb

Przechodzenie pomiędzy katalogami znajdującymi się w pliku `$HOME/.config/bmdirs`

```
source ~/bin/cdb && cdb"
```

## cdba

Dodatnie bieżącego katalogu do pliku `$HOME/.config/bmdirs`

```
source ~/bin/cdba && cdba"
```

## cdbd

Usunięcie bieżącego katalogu z pliku `$HOME/.config/bmdirs`

```
source ~/bin/cdbd && cdbd
```

## cdbe

Edycja pliku `$HOME/.config/bmdirs`

```
vim ~/.config/bmdirs
```

## cdf

Poruszanie się pomiędzy katalogami za pomocą FZF

```
source $HOME/bin/cdf
```

## clear-gpg-passwd

Czyści zapamiętane hasło przez agenta GPG

```
gpg-connect-agent reloadagent /bye"
```

## df

Wyświetla wolną przestrzeń na dyskach w bardziej ludzki sposób

```
df -h
```

## f

Wyświetla liczbę katalogów w bieżącej lokalizacji

```
ls -A|wc -l
```

## ff

Uruchamia Firefoxa

```
firefox
```

## free

Wyświetla informacje dotyczące pamięci operacyjnej RAM i pliku wymiany w bardziej ludzki sposób

```
free -m
```

## g

Uruchamia polecenie `git`

```
git
```

## ga

Uruchamia skrypt `$HOME/bin/ga`

```
~/bin/ga
```

Źródło:

```
#!/usr/bin/env bash

DATA=$(date +%F-%T)

git add -A && git commit -m $DATA
```

## gl

Uruchamia skrypt `$HOME/bin/gl` - wyświetlający zmiany w repozytorium Git

Źródło:

```
git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
```

## gp

Uruchamia skrypt `$HOME/bin/gp`

Źródło:

```
#!/usr/bin/env bash

DATA=$(date +%F-%T)

git add -A && git commit -m $DATA && git push
```

## h

Uruchamia polecenie `history`

```
history
```

## l / ll

Uruchamia polecenie `exa` z dodatkowymi parametrami

```
exa -al --group-directories-first --git --header
```

## lsx

 Pokazuje pliki wykonywalne w bieżącej lokalizacji
 
```
ls -F | grep '*$'
```

## more

Zastępuje program `more` programem `less`

## n

Otwiera edytor Vim w lokalizacji `$HOME/notes`

```
vim -c "e $HOME/notes"
```

## p / pass

Uruchamia program `pass` bez zapisywania polecenia w historii

## pg

Wyszukuje procesów uruchamiając polecenie `psgrep`

Przykład:

```
$ pg vim
```

## pu

Uruchamia polecenie `git pull`

## push

Uruchamia polecenie `git push`

## pwgen

Generuje hasła od długości 32 znaków


```
pwgen -c -s -n -y -1 32"
```

## q

Uruchamia polecenie `exit`

## so

Uruchamia polecenie `source`


## t

Uruchamia polecenie `tmux`

## ta

Uruchamia polecenie `tmux atta`

## tree

Zastępuje polecenie `tree` polecenie `exa`

```
exa -l -a -h -g --git --tree"
```

## v

Uruchamia program `vim`

## vimrc / vrc

Alias do `.v` - edycja pliku konfiguracyjnego edytora Vim
