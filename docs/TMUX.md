# Tmux skróty klawiszowe

<!-- vim-markdown-toc GFM -->

* [Prefix](#prefix)
* [Wejście do trybu komend](#wejcie-do-trybu-komend)
* [Odłączenie się od bieżącej sesji](#odczenie-si-od-biecej-sesji)
* [Dzielenie okna na panele](#dzielenie-okna-na-panele)
* [Poruszanie się pomiędzy panelami](#poruszanie-si-pomidzy-panelami)
* [Utworznie nowego okna](#utworznie-nowego-okna)
* [Zmiana nazwy okna](#zmiana-nazwy-okna)
* [Przechodzenie pomiędzy oknami](#przechodzenie-pomidzy-oknami)
* [Zarządzanie oknami](#zarzdzanie-oknami)
* [Użycie Shift-Strzałki do zmiany sesji](#uycie-shift-strzaki-do-zmiany-sesji)
* [Przeładowanie konfiguracji tmux](#przeadowanie-konfiguracji-tmux)
* [Uruchomienie tmux z wybraną nazwą sesji](#uruchomienie-tmux-z-wybran-nazw-sesji)
* [Lista sesji](#lista-sesji)
* [Podłączenie do wybranej sesji](#podczenie-do-wybranej-sesji)
* [Przełączanie się pomiędzy sesjami](#przeczanie-si-pomidzy-sesjami)
* [Zamkninięcie wybranej sesji](#zamkninicie-wybranej-sesji)
* [Zamknięcie wszystkich sesji](#zamknicie-wszystkich-sesji)
* [Uruchomienie polecenia przy uruchomieniu nowej sesji](#uruchomienie-polecenia-przy-uruchomieniu-nowej-sesji)

<!-- vim-markdown-toc -->

# Prefix

Tmux standardowo jako prefiksu używa skrótu `ctrl-b` natomiast Ci, którzy są
przyzwyczajeni do programu `screen` używają skrótu `ctrl-a`, w tej konfiguracji
jako prefiks jest ustawiony skrót `ctrl-a`.

# Wejście do trybu komend

  * `Prefix-:`

# Odłączenie się od bieżącej sesji

  * `Prefix-d`


# Dzielenie okna na panele

  * `Prefix-\` - dzielenie okna pionowo
  * `Prefix--` - dzielenie okna poziomo

# Poruszanie się pomiędzy panelami

Użycie klawisza `Alt`

  * `Alt-Left`  - przejście do panelu po lewej
  * `Alt-Right` - przejście do panelu po prawej
  * `Alt-Down`  - przejście do panelu na dole
  * `Alt-Up`    - przejście do panelu na górze

Użycie prefiksu + hjkl

  * `Prefix-h` - przechodzi do panelu po lewej
  * `Prefix-j` - przechodzi do panelu na dole
  * `Prefix-k` - przechodzi do panelu na górze - aktualnie nie działa
  * `Prefix-l` - przechodzi do panelu po prawej

# Utworznie nowego okna

  * `Prefix-c` - tworzy nowe okno

# Zmiana nazwy okna

  * `Prefix-:` - zmiana nazwy bieżącego okna

# Przechodzenie pomiędzy oknami

Użycie Ctrl-Strzałki do zmiany okna

  * `Ctrl-Left` - poprzednie okno
  * `Ctrl-Right` - następne okno
  * `Ctrl-Up` - ostatie okno
  * `Ctrl-Down` - lista wyboru okna

# Zarządzanie oknami

  * `Prefix-k` - zamknij okno - wymaga potwierdzenia
  * `Prefix-K` - zamknij okno

# Użycie Shift-Strzałki do zmiany sesji

  * `Shift-Left` - poprzednia sesja
  * `Shift-Right` - następna sesja
  * `Shift-Up` - ostatnia sesja
  * `Shift-Down` - wybór sesji

# Przeładowanie konfiguracji tmux

  * `Prefix-r` przeładowanie konfiguracji tmux

# Uruchomienie tmux z wybraną nazwą sesji

```
tmux new -s nazwa_sesji
```

# Lista sesji

```
tmux ls
```

# Podłączenie do wybranej sesji

```
tmux a -t nazwa_sesji
```

# Przełączanie się pomiędzy sesjami

```
tmux switch -t nazwa_sesji
```


# Zamkninięcie wybranej sesji

```
tmux kill-session -t nazwa_sesji
```

# Zamknięcie wszystkich sesji

```
tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill
```

# Uruchomienie polecenia przy uruchomieniu nowej sesji

Dodatkowo po uruchomienie nowej sesji zostaje otwarte kolejne okno z kolejnym
poleceniem.

```
tmux new-session -s OpenVPN -d '/usr/local/sbin/openvpn --cd /etc/openvpn --client-config-dir /etc/openvpn/ccd --config server.conf'
tmux new-window -t OpenVPN '~/bin/log.sh'
```
