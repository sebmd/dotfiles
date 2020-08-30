# VIM Cheat Sheet


<!-- vim-markdown-toc GFM -->

* [Przydatne strony pomocy](#przydatne-strony-pomocy)
* [Kilka przydatnych skrótów](#kilka-przydatnych-skrótów)
* [Wyrównanie paragrafu na szerokość 80 znaków lub wartość parametru `textwidth`](#wyrównanie-paragrafu-na-szeroko-80-znaków-lub-warto-parametru-textwidth)
* [Wprowadzanie znaków UTF-8](#wprowadzanie-znaków-utf-8)
* [Poruszanie się w linii](#poruszanie-si-w-linii)
* [Poruszanie się pomiędzy wyrazami](#poruszanie-si-pomidzy-wyrazami)
* [Poruszanie się pomiędzy obiektami tekstowymi](#poruszanie-si-pomidzy-obiektami-tekstowymi)
* [Poruszanie się pomiędzy liniami](#poruszanie-si-pomidzy-liniami)
* [Poruszanie się po ekranie](#poruszanie-si-po-ekranie)
* [Przewijanie pliku](#przewijanie-pliku)
* [Poruszanie się pomiędzy buforami](#poruszanie-si-pomidzy-buforami)
* [Wyrównanie bieżącej linii względem ekranu](#wyrównanie-biecej-linii-wzgldem-ekranu)
* [Edycja](#edycja)
    * [Obiekty tekstowe](#obiekty-tekstowe)
    * [Mnożnik i zakresy](#mnonik-i-zakresy)
    * [Praca w linii](#praca-w-linii)
    * [Przykłady edycji](#przykady-edycji)
* [Kopiuj / wklej](#kopiuj--wklej)
* [Wprowadzanie tekstu](#wprowadzanie-tekstu)
* [Makra](#makra)
* [Kopiowani tekstu z bufora / pliku do linii komend:](#kopiowani-tekstu-z-bufora--pliku-do-linii-komend)
* [Skopiowanie słowa pod kursorem do linii komend](#skopiowanie-sowa-pod-kursorem-do-linii-komend)
* [Otworzenie wszystkich plików z bieżącego katalogu](#otworzenie-wszystkich-plików-z-biecego-katalogu)
* [Skopiowanie całej linii bez znaku końca linii](#skopiowanie-caej-linii-bez-znaku-koca-linii)
* [Znajdź i zastąp](#znajd-i-zastp)
* [Sortowanie](#sortowanie)
* [Praca z powłoką systemową](#praca-z-powok-systemow)
* [Otworzenie pliku na konkretnej linii](#otworzenie-pliku-na-konkretnej-linii)
* [Powtórzenie ostatniej komendy](#powtórzenie-ostatniej-komendy)
* [Uruchomienie komendy Vim z rejestru czyli schowka Vim](#uruchomienie-komendy-vim-z-rejestru-czyli-schowka-vim)
* [Praca z oknami](#praca-z-oknami)
    * [Dzielenie okna](#dzielenie-okna)
    * [Zmiana rozmiaru okna](#zmiana-rozmiaru-okna)
* [Kodowanie ROT13](#kodowanie-rot13)
* [Rejestry](#rejestry)
* [Przeniesienie bieżącej linii na początek / koniec pliku](#przeniesienie-biecej-linii-na-pocztek--koniec-pliku)
* [Skopiowanie wybranej linii do bieżącej lokalizacji kursora](#skopiowanie-wybranej-linii-do-biecej-lokalizacji-kursora)
* [Otworzenie wszystkich plików w katalogu](#otworzenie-wszystkich-plików-w-katalogu)
* [Operacje arytmetyczne](#operacje-arytmetyczne)
    * [Kalkulator w linii komend](#kalkulator-w-linii-komend)
    * [Wstawienie do bufora wyniku działania matematycznego](#wstawienie-do-bufora-wyniku-dziaania-matematycznego)
    * [Wstawienie do bufora zakresu liczb w kolumnie](#wstawienie-do-bufora-zakresu-liczb-w-kolumnie)
* [Podmienienie znaku w całym pliku](#podmienienie-znaku-w-caym-pliku)
* [Zmiana kierunku zaznaczania w trybie VISUAL](#zmiana-kierunku-zaznaczania-w-trybie-visual)
* [Zmiana wielkości znaków](#zmiana-wielkoci-znaków)
* [Wyświetlenie historii komend](#wywietlenie-historii-komend)
* [Wklejanie w trybie INSERT](#wklejanie-w-trybie-insert)
* [Przeszukiwanie pomocy edytora Vim](#przeszukiwanie-pomocy-edytora-vim)
* [Dodanie treści innego pliku](#dodanie-treci-innego-pliku)
* [Usunięcie wszystkich linii](#usunicie-wszystkich-linii)
* [Test uruchomienia edytora Vim](#test-uruchomienia-edytora-vim)
* [Lista pluginów i plików startowych](#lista-pluginów-i-plików-startowych)
* [Zapis pracy edytora i uruchamianych funkcji dla analizy problemów](#zapis-pracy-edytora-i-uruchamianych-funkcji-dla-analizy-problemów)
* [Otworzenie pliku w tle](#otworzenie-pliku-w-tle)
* [Przechodzenie pomiędzy znalezionymi błędami pisowni](#przechodzenie-pomidzy-znalezionymi-bdami-pisowni)
* [Usunięcie co drugą linię](#usunicie-co-drug-lini)
* [Usunięcie linii zawierających wyrażenie](#usunicie-linii-zawierajcych-wyraenie)
* [Formatowanie całego pliku](#formatowanie-caego-pliku)
* [Wprawadzenie wielokrotnie znaku](#wprawadzenie-wielokrotnie-znaku)
* [Usunięcie wszystkich linii nie zawierających wyrażenia](#usunicie-wszystkich-linii-nie-zawierajcych-wyraenia)
* [Wyświetlenie skrótów klawiszowych](#wywietlenie-skrótów-klawiszowych)
* [Plugin tpope/vim-abolish](#plugin-tpopevim-abolish)
* [Zliczenie wystąpień wyrażenia](#zliczenie-wystpie-wyraenia)
* [Automatyczne uzupełnianie](#automatyczne-uzupenianie)
* [Usunięcie linii które zaczynają się od znaku komentarza](#usunicie-linii-które-zaczynaj-si-od-znaku-komentarza)
* [Przejście do poprzednio zaznaczonego tekstu w trybie VISUAL](#przejcie-do-poprzednio-zaznaczonego-tekstu-w-trybie-visual)

<!-- vim-markdown-toc -->

## Przydatne strony pomocy

- obiekty tekstowe - `:help text-objects`

## Kilka przydatnych skrótów

  - `<ctrl-g>` - wyświetla informacje o pliku w tym jego nazwę
  - `g <ctrl-g>` - wyświetla trochę więcej informacji o pliku słów w pliku
  - `:x` - zapisanie pliku i wyjście
  - `:term` - uruchomienie terminala systemowego
  - `:e ++ff=dos` - zamienia znak końca linii (`^M`) DOS2Unix
  - `:retab` - zamiana znaków TAB na spacje w całym pliku
  - `gi` - przechodzi do miejsca ostatniej edycji, jednocześnie wchodząc w tryb
    INSERT
  - `` `^ `` - przechodzi do miejsca ostatniej edycji, ale pozostaje w trybie NORMAL
 
## Wyrównanie paragrafu na szerokość 80 znaków lub wartość parametru `textwidth`

Ustawienie długości linii `:set textwidth=70`

- `gqap` w trybie **NORMAL** formatuje paragraf
- `gwap` w trybie **NORMAL** formatuje paragraf, kursor zostaje w miejscu gdzie wywołaliśmy polecenie
- `gq` w trybie **VISUAL** formatuje zaznaczenie

## Wprowadzanie znaków UTF-8

W trybie INSERT naciskamy `Ctrl-v` a następnie `uXXXX` gdzie `XXXX` jest to numer
znaku w tabeli UTF-8 np.

```
Ctrl-v u25B8
▸
```

## Poruszanie się w linii

- `h` - jeden znak w lewo
- `l` - jeden znak w prawo
- `12l` - 12 znaków w prawo
- `12h` - 12 znaków w lewo
- `12|` - przejście do 12 kolumny wiersza
- `0` - początek linii
- `$` - koniec linii
- `g0` - w przypadku zawijanych linii przechodzi na początek danej linii, inaczej
  niż `0`
- `g$` - w przypadku zawijanych linii przechodzi na koniec danej linii, inaczej
  niż `$`
- `g^` - przechodzi do pierwszego znaku w linii pomijając spacje i znak
   tabulatora
- `g_` - przechodzi do ostatniego znaku w linii ignoruje spacje i tabulatory na
  końcu linii
- `f`<znak> - przechodzi do pierwszego wystąpienia znaku
- `F`<znak> - przechodzi do poprzedniego wystąpienia znaku
- `t`<znak> - przechodzi znak wcześniej w prawo
- `T`<znak> - przechodzi znak wcześniej w lewo
- `;` - przechodzi do kolejnego wystąpienia szukanego wcześniej znaku za pomocą
   `t/T/f/F`
- `,` - przechodzi do poprzedniego wystąpienia szukanego wcześniej znaku za
   pomocą `t/T/f/F`

## Poruszanie się pomiędzy wyrazami

- `w` - przechodzi na początek kolejnego wyrazu
- `W` - przechodzi na początek kolejnego WYRAZU
- `e` - przechodzi na koniec kolejnego wyrazu
- `E` - przechodzi na koniec kolejnego WYRAZU
- `b` - przechodzi na początek poprzedniego wyrazu
- `B` - przechodzi na początek poprzedniego WYRAZU
- `ge` - przechodzi na koniec poprzedniego wyrazu
- `gE` - przechodzi na koniec poprzedniego WYRAZU

## Poruszanie się pomiędzy obiektami tekstowymi

- `(, )` - poruszanie się pomiędzy zdaniami
- `{, }` - poruszanie się pomiędzy paragrafami
- `%` - poruszanie się pomiędzy otwarciem i zamknięciem nawiasów `{}()[]`

## Poruszanie się pomiędzy liniami

- `j` - linia w dół
- `k` - linia w górę
- `12j` - 12 linii w dół
- `12k` - 12 linii w górę
- `gg` - pierwsza linia pliku
- `G` - ostatnia linia pliku
- `12%` - przechodzi do 12% długości pliku

## Poruszanie się po ekranie

W przypadku `H` i `L` ma znaczenie parametr `set scrolloff` gdzie ustalamy
offset przy przewijaniu ekranu, czyli ile linii dodatkowo widać podczas
przewijania ekranu.

- `H` - przechodzi na górę ekranu
- `M` - przechodzi na środek ekranu
- `L` - przechodzi na dół ekranu

## Przewijanie pliku

- `Ctrl-e` - przewija o jedną linię w górę
- `Ctrl-y` - przewija o jedną linię w dół
- `Ctrl-d` - przewija o pół ekranu w dół
- `Ctrl-u` - przewija o pół ekranu w górę
- `Ctrl-f` - przewija o cały ekran w dół
- `Ctrl-b` - przewija o cały ekran w górę

Wszystkie te kombinację możemy poprzedzić liczbą powtórzeń danej operacji. Na
przykład przewinięcie o 6 linii w dół:

```
6Ctrl-e
```

## Poruszanie się pomiędzy buforami

- `:bn` - następny bufor
- `:bp` - poprzedni bufor
- `:bm` - kolejny bufor, który był modyfikowany
- `:ls` - lista otwartych buforów

Plugin `fzf.vim` posiada funkcę `Buffers`, dzięki której możemy szybko poruszać
się pomiędzy buforami.

## Wyrównanie bieżącej linii względem ekranu

- `zt` - ustawia linię na górze ekranu
- `zz` - ustawia linię po środku ekranu
- `zb` - ustawia linię na dole ekranu


## Edycja

### Obiekty tekstowe

Pomoc: `:help text-objects`

- `w` - wyraz
- `W` - WYRAZ
- `s` - zdanie
- `p` - paragraf
- `()[]{}` - blok

### Mnożnik i zakresy

- `2yy` - kopiuje 2 linie
- `d2aw` / `diw`

### Praca w linii

- `yy` - kopiuje całą linię
- `dd` - usuwa całą linię
 - `cc` - wycina całą linię i przechodzi w tryb **INSERT**
 
 Określenie obiektu na którym chcemy wykonać operację

- `dw` - usunięcie od kursora do końca wyrazu
- `dW` - usunięcie od kursora do końca WYRAZU
- `dap` - usunięcie całego paragrafu + dodatkowa linia
- `dip` - usunięcie całego paragrafu

Koniec i początek linii

- `d$` - usunięcie od kursora do końca linii
- `d^` - usunięcie od kursora do początku linii
- `D`  - usunięcie od kursora do końca linii zamiennik `d$`
- `C`  - usunięcie od kursora do końca linii wejście w tryb INSERT
- `Y`  - ten skrót standardowo nie działa i trzeba go zmapować samodzielnie

Mapowanie `Y` do działania zgodnego z podobnymi skrótami tj. `D` czy `C`.

```vim
nnoremap Y y$
```

### Przykłady edycji

- `x` - usuwa jeden znak znajdujący się pod kursorem
- `dd` - usuwa całą linię
- `D` - usuwa od kursora do końca linii
- `daw` - usuwa wyraz + spacja
- `diw` - usuwa wyraz
- `caw` - usuwa wyraz + spacja i wchodzi w tryb **INSERT**
- `ciw` - usuwa wyraz i wchodzi w tryb **INSERT**
- `dap` - usuwa cały paragraf
- `di"` - usuwa wszystko w bloku `""`
- `dt"` - usuwa od kursora do pierwszego wystąpienia znaku `"`
- `dt<spacja>` - usuwa od kursora do znaku spacji
- `dT"` - usuwa od kursora do poprzedniego wystąpienia znaku `"`
- `di{` - usuwa wszystko pomiędzy znakami `{}`
- `J` - łączenie dwóch linii
- `cc` - wycina całą linię i wchodzi w tryb **INSERT**
- `~` - zamienia wielkość liter pod kursorem np. z małej na Wielką
- `r` - zamienia znak pod kursorem np. `ra` zamienia znak pod kursorem na `a`
 - `xp` - zamienia dwie litery miejscami

## Kopiuj / wklej

- `yy` - kopiuje całą linię niezależnie od miejsca w którym się znajdujemy
- `cc` - wycina całą linię i wchodzi w tryb **INSERT**
- `p` - wkleja za kursorem
- `P` - wkleja przed kursorem

## Wprowadzanie tekstu

Przejście w tryb wprowadzania tekstu czyli do trybu INSERT:

- `i` - zaczyna wprowadzać tekst przed kursorem 
- `a` - zaczyna wprowadzać tekst za kursorem
- `I` - zaczyna wprowadzać tekst na początku linii
- `A` - zaczyna wprowadzać tekst na końcu linii
- `o` - zaczyna wprowadzać tekst w linii poniżej
- `O` - zaczyna wprowadzać tekst w linii powyżej

## Makra

- `qa` - nagrywa makro w rejestrze `a`
- `q` - zatrzymuje nagrywanie makra
- `@a` - uruchamia makro `a`
- `@@` - ponownie uruchamia poprzednio odtworzone makro

## Kopiowani tekstu z bufora / pliku do linii komend:

1. Kopiujemy tekst np. `yiw`
2. Wklejamy do linii komend `:`, `Ctrl-r`, `"`

Zamiast `Ctrl-r "` możemy używać `Ctrl-r 0`.

## Skopiowanie słowa pod kursorem do linii komend

W trybie komend wprowadzamy polecenie np. `:e` następnie naciskamy kombinację
klawiszy `<C-r><C-a><C-a>` w ten sposób słowo pod kursorem zostanie wklejone do
linii komend.

## Otworzenie wszystkich plików z bieżącego katalogu

W trybie komend wprowadzamy komendę `:e` następnie wprowadzamy kombinację
klawiszy `<C-a><C-a>` do linii komend zostaną wprowadzone wszystkie pliki z
bieżącego katalogu.

## Skopiowanie całej linii bez znaku końca linii

Standardowo kopiując linię za pomocą `yy` będzie ona zawierała znak końca linii.
Jeśli chcemy skopiować linię bez tego znaku np. chcąc wkleić linię pomiędzy
wyrazy lub do linii komend możemy posłużyć się kombinacją: `$y^` dla ułatwienia
możemy ją zmapować:

```vim
nnoremap yr $y^
```

## Znajdź i zastąp

Dostępne parametry

- `g` - global
- `e` - nie wyświetla błędów
- `c` - wymaga potwierdzenia
- `i` - nie zwraca uwagi na wielkość znaków zwraca

Zastępuje pierwsze wystąpienie szukanego wyrazu w bieżącej linii

```vim
:s/nnoremap/nmap
```

Zastępuje każde wystąpienie szukanego słowa w linii

```vim
:s/nnoremap/nmap/g
```

Zastąpienie tekstu w całym pliku wymaga dodania znaku `%` na początku komendy.

```vim
:%s/nnoremap/nmap
```

Potwierdzenie zastąpienia wymaga dodania `/c` na końcu polecenia.

```vim
:%s/nnoremap/nmap/c
```

Zastąpienie tekstu z zachowaniem wielkości znaków

```vim
:%S/nnoremap/nmap/gi
```

Czyli jeśli Vim znajdzie `Nnoremap` zastąpi go `Nmap`, jeśli znajdzie `NNOREMAP`
zastąpi go `NMAP`.

Powtórzenie operacji

- `&` w trybie normal powtarza poprzednie znajdź i zastąp
- `g&` powtarza ostatnie znajdź i zastąp w całym pliku
- `:&` powtarza ostatnie znajdź i zastąp w bieżącej linii, umożliwia dodanie
  dodatkowych flag np. `:&c`, będzie wymagać potwierdzenia.

## Sortowanie

- `:sort` - sortowanie tekstu
- `:sort!` - odwrotnie sortowanie
- `:sort i` - ignoruje wielkość znaków
- `:sort u` - sortuje i usuwa duplikaty

## Praca z powłoką systemową

Wykonanie polecenia

```vim
:!ls -alh
```

Wykonanie polecenia `uniq` na całym pliku

```vim
:%!uniq -u
```

Wstawienie wyniku polecenia do edytowanego pliku

```vim
:r!ls -alh
```

Innym sposobem jest naciśnięcie dwukrotnie wykrzyknika w trybie NORMAL

```vim
!!
```

Uruchomi się tryb COMMAND z poleceniem:

```vim
:.!
```

Teraz wprowadzamy komendę np. `ls`, efektem będzie zastąpienie bieżącej linii
wynikiem polecenia systemowego `ls`.

## Otworzenie pliku na konkretnej linii

Otworzenie pliku w linii 222

```vim
:e +222 nazwa_pliku.txt
```

```vim
$ vim +222 nazwa_pliku.txt
```

## Powtórzenie ostatniej komendy

```vim
@:
```

## Uruchomienie komendy Vim z rejestru czyli schowka Vim

Kopiując z bufora linię np. `:r!ls -al` zapisujemy ją w rejestrze `"`, możemy
użyć tego rejestru do uruchomienie skopiowanego polecenia za pomocą komendy

```vim
:@"
```

Rejestr `"` jest to ostatnio skopiowany tekst, możemy użyć innego rejestru np.
rejestru `0` używając tej samej składni `:@0`, rejestry możemy przeglądać za
pomocą komendy `:reg`

## Praca z oknami

### Dzielenie okna

- `Ctrl-w s` - dzielenie okna w poziomie
- `Ctrl-w v` - dzielenie okna w pionie
- `Ctrl-w q` - zamknięcie okna

### Zmiana rozmiaru okna

- `Ctrl-w +` - powiększenie okna
- `Ctrl-w -` - zmniejszenie okna
- `Ctrl-w =` - wrócenie do równego podziału
- `:resize 10` - zmienia wielkość okna na 10 linii

## Kodowanie ROT13

```vim
g??
```

```
Tekst niezakodowany
```

Po użyciu `g??`

```
Grxfg mnxbqbjnal
```

## Rejestry

Vim posiada kilka rejestrów w których przechowuje kopiowany tekst oraz inne
wartości np. nazwę edytowanego pliku / bufora.

```vim
:h registers

1. The unnamed register ""
2. 10 numbered registers "0 to "9
3. The small delete register "-
4. 26 named registers "a to "z or "A to "Z
5. Three read-only registers ":, "., "%
6. Alternate buffer register "#
7. The expression register "=
8. The selection and drop registers "*, "+ and "~ 
9. The black hole register "_
10. Last search pattern register "/
```

Wartość poszczególnych rejestrów można wyświetlić za pomocą komendy

```vim
:reg
```

W linii komend można każdy z rejestrów wkleić poprzedzając go kombinacja `Ctrl-r`
np. `Ctrl-r %` wstawi rejestr `%` czyli nazwę edytowanego pliku.

## Przeniesienie bieżącej linii na początek / koniec pliku

Przeniesienie na koniec pliku

```vim
:.m$
```

Przeniesienie na początek pliku, tutaj używamy numeru linii czyli `0` jednak
można użyć dowolnej wartości i linia zostanie przeniesiona do linii, którą
wybierzemy np. `:.m22` przeniesie linię do linii 22.

```vim
:.m0
```

## Skopiowanie wybranej linii do bieżącej lokalizacji kursora

Kopiuje linie `33` do bieżącej linii

```vim
:33co.
```

Oczywiście zamiast kropki `.` możemy użyć numeru linii i w ten sposób skopiujemy
wybraną linię do innej linii.

Kopiuje linię `33` do linii `100`.

```vim
:33co100
```

## Otworzenie wszystkich plików w katalogu

Otwiera wszystkie pliki w bieżącej lokalizacji

```vim
:args <ctrl-a><ctrl-a>
```

lub

```vim
:args *.md
```

Otworzenie plików w wybranej ścieżce

```vim
:args docs/*.md
```

## Operacje arytmetyczne

- `Ctrl-a` zwiększa wartość pod kursorem o 1
- `Ctrl-x` zmniejsza wartość pod kursorem o 1

Jeśli mamy w linii `18` najeżdżając kursorem na tą wartość przyciskamy `Ctrl-a`
lub `Ctrl-x`, zwiększając lub zmniejszając wartość o `1`.

### Kalkulator w linii komend

```vim
:<ctrl-r> = 2+2
:4
```

### Wstawienie do bufora wyniku działania matematycznego

```vim
:put=(2+2)*2
8
```

### Wstawienie do bufora zakresu liczb w kolumnie

```vim
:put=range(11,15)
11
12
13
14
15
```

## Podmienienie znaku w całym pliku

```vim
:%norm cs'"
```

- `%` wszystkie linie
- `norm` - tryb wprowadzania komend trybu NORMAL
- `c` - zmień
- `s` - otaczane
- `'` - znak `'`
- `"` - znakiem `"`

## Zmiana kierunku zaznaczania w trybie VISUAL

Podczas zaznaczania należy nacisnąć `o` żeby zmienić kierunek zaznaczania.

## Zmiana wielkości znaków

- `gu` - zmienia znak na mały
- `gU` - zmienia znak na wielki
- `g~` - zamienia znak z wielkiego na mały i odwrotnie

Przykłady

- `guu` - zmienia znaki na małe w całej linii
- `gUiw` - zmienia znaki na wielkie w wyrazie pod kursorem
- `g~ip` - zmienia wielkość znaków w całym paragrafie

## Wyświetlenie historii komend

W trybie NORMAL naciskamy `q:`
W trybie COMMAND naciskamy `Ctrl-f`

Po znalezieniu komendy możemy ją uruchomić naciskając `ENTER` lub skopiować np
`yy`.

## Wklejanie w trybie INSERT

Będąc w trybie INSERT należy użyć `Ctrl-r nr-rejestru` standardowo rejestr `0`
jest ostatnim skopiowanym obiektem tekstowym.

## Przeszukiwanie pomocy edytora Vim

```vim
helpgrep ctrl-r
```

W rezultacie uzyskamy od 0 do kilku wyników, za pomocą komend `:cnext` oraz
`:cprev` możemy się poruszać pomiędzy wynikami. A komenda `:copen` otwiera listę

## Dodanie treści innego pliku

```vim
:!cat nazwa_pliku.txt
```

```vim
:r nazwa_pliku.txt
```

## Usunięcie wszystkich linii

```vim
:1,$d
```

lub

```vim
ggdG
```

## Test uruchomienia edytora Vim

```bash
$ vim --startuptime startup.log
```

## Lista pluginów i plików startowych

```vim
:scriptnames
```

## Zapis pracy edytora i uruchamianych funkcji dla analizy problemów

Uruchomienie

```vim
:profile start profile.log
:profile func *
:profile file *
```

Zatrzymanie

```vim
:profile pause
```

## Otworzenie pliku w tle

Plik zostanie otwarty w następnym buforze

```vim
:bad nazwa_pliku.txt
```

## Przechodzenie pomiędzy znalezionymi błędami pisowni

```vim
:set spell
```

Poruszanie się pomiędzy kolejnymi błędami w pisowni

- `]s` - przeskakuje do następnego błędu
- `[s` - przeskakuje do poprzedniego błędu

## Usunięcie co drugą linię

Używając funkcji `global` usuniemy co drugą linię w pliku.

```vim
:g/^/+d
```

## Usunięcie linii zawierających wyrażenie

```vim
:g/nazwa_pliku\.txt/d
```

## Formatowanie całego pliku

```vim
gg=G
```

## Wprawadzenie wielokrotnie znaku

Wstawienie 80 znaków `#`

```vim
80i#<ESC>
```

## Usunięcie wszystkich linii nie zawierających wyrażenia

Komenda `:v` to skrót od `:vglobal` a ta jest równoznaczna z `:g!`

```vim
:v/wyrażenie/d
```

## Wyświetlenie skrótów klawiszowych

```vim
:map
```

Plugin `fzf.vim` posiada funkcę `:Maps`, która umożliwia wyszukiwanie.

## Plugin tpope/vim-abolish

- `crc` - zamienia `nazwa_pliku` na `nazwaPliku`

## Zliczenie wystąpień wyrażenia

Zliczenie linii w których występuje `wyrażenie`

```vim
:%s/wyrażenie//n
```

Zliczenie wszystkich wystąpień słowa `wyrażenie` czyli zliczy też kilkukrotne
wystąpienie słowa w jeden linii.

```vim
:%s/wyrażenie//gn
```

## Automatyczne uzupełnianie

- `Ctrl-x Ctrl-l` - pozwala uzupełnić całą linię
- `Ctrl-x Ctrl-f` - pozwala uzupełnić nazwę pliku
- `Ctrl-n` lub `Ctrl-j` - następna podpowiedź
- `Ctrl-p` lub `Ctrl-k` - poprzednia podpowiedź

## Usunięcie linii które zaczynają się od znaku komentarza

W tym wypadku to znak `#`

```vim
:g/^\s*#/d
```

## Przejście do poprzednio zaznaczonego tekstu w trybie VISUAL

```vim
gv
```
