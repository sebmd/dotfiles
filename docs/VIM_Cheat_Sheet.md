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
* [Znajdź i zatąp](#znajd-i-zatp)
* [Sortowanie](#sortowanie)
* [Praca z powłoką systemową](#praca-z-powok-systemow)
* [Otworzenie pliku na konkretnej linii](#otworzenie-pliku-na-konkretnej-linii)
* [Powtórzenie ostatniej komendy](#powtórzenie-ostatniej-komendy)
* [Uruchomienie komendy Vim z rejestru czyli schowka Vim](#uruchomienie-komendy-vim-z-rejestru-czyli-schowka-vim)
* [Praca z oknami](#praca-z-oknami)
    * [Dzielenie okna](#dzielenie-okna)
    * [Zmiana rozmiaru okna](#zmiana-rozmiaru-okna)

<!-- vim-markdown-toc -->

## Przydatne strony pomocy

- obiekty tekstowe - `:help text-objects`

## Kilka przydatnych skrótów

  - `<ctrl-g>` - wyświetla informacje o pliku w tym jego nazwę
  - `g <ctrl-g>` - wyświetla trochę więciej informacji o pliku słów w pliku
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

Wszystkie te kombinację możemy poprzedzić liczbą powtórzej danej operacji. Na
przykład przwinięcie o 6 linii w dół:

```
6Ctrl-e
```

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

```
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

```
nnoremap yr $y^
```

## Znajdź i zatąp

Dostępne parametry

- `g` - global
- `e` - nie wyświetla błędów
- `c` - wymaga potwierdzenia
- `i` - nie zwraca uwagi na wielkość znaków zwraca

Zastępuje pierwsze wystąpienie szukanego wyrazu w bieżącej linii

```
:s/nnoremap/nmap
```

Zastępuje każde wystąpienie szukanego słowa w linii

```
:s/nnoremap/nmap/g
```

Zastąpienie tekstu w całym pliku wymaga dodania znaku `%` na początku komendy.

```
:%s/nnoremap/nmap
```

Potwierdzenie zastąpienia wymaga dodania `/c` na końcu polecenia.

```
:%s/nnoremap/nmap/c
```

- `&` w trybie normal powtarza poprzednie znajdź i zastąp
- `g&` powtarza ostatnie znajdź i zastąp w całym pliku
- `:&` powtarza ostatnie znajdź i zastąp w bieżącej linii, umożliwia dodanie
  dodatkowych flag np. `:&c`, będzie wymagać potwierdzenia.

## Sortowanie

- `:sort` - sortowanie tekstu
- `:sort!` - odwrotene sortowanie

## Praca z powłoką systemową

Wykonanie polecenia

```
:!ls -alh
```

Wykonanie polecenia `uniq` na całym pliku

```
:%!uniq -u
```

Wstawienie wyniku polecenia do edytowanego pliku

```
:r!ls -alh
```

Innym sposobem jest naciśnięcie dwukrotnie wykrzykniaka w trybie NORMAL

```
!!
```

Uruchomi się tryb COMMAND z poleceniem:

```
:.!
```

Teraz wprowadzamy komendę np. `ls`, efektem będzie zastąpienie bieżącej linii
wynikiem polecenia systemowego `ls`.

## Otworzenie pliku na konkretnej linii

Otworzenie pliku w linii 222

```
:e +222 nazwa_pliku.txt
```

```
$ vim +222 nazwa_pliku.txt
```

## Powtórzenie ostatniej komendy

```
@:
```

## Uruchomienie komendy Vim z rejestru czyli schowka Vim

Kopiując z bufora linię np. `:r!ls -al` zapisujemy ją w rejestrze `"`, możemy
użyć tego rejestru do uruchomienie skopiowanego polecenia za pomocą komendy

```
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
