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
