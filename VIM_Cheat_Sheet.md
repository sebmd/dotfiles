# VIM Cheat Sheet

## Przydatne strony pomocy

- obiekty tekstowe - `:help text-objects`

## Kilka przydatnych skrótów

  - `xp` - zamienia dwie litery miejscami
  - `g <ctrl-g>` - wyświetla informacje o pliku takie jak liczba wierszy czy
    słów w pliku
  - `:x` - zapisanie pliku i wyjście
  - `:term` - uruchomienie terminala systemowego

## Kopiowani tekstu z bufora / pliku do linii komend:

1. Kopiujemy tekst np. `yiw`
2. Wklejamy do linii komend `:`, `Ctrl-r`, `"`

## Wyrównanie paragrafu na szerokość 80 znaków lub wartość parametru `textwidth`

Ustawienie długości linii `:set textwidth=70`

- `gqap` w trybie **NORMAL** formatuje paragraf
- `gwap` w trybie **NORMAL** formatuje paragraf, kursor zostaje w miejscu gdzie wywołaliśmy polecenie
- `gq` w trybie **VISUAL** formatuje zaznaczenie

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

## Poruszanie się pomiędzy wyrazami

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

- `x` - usunięcie jednego znaku pod kursorem
- `dd` - usuwa całą linię
- `D` - usuwa od kursora do końca linii
- `daw` - usunięcie wyrazu + spacja
- `diw` - usunięcie wyrazu
- `caw` - usunięcie wyrazu + spacja i wejście w tryb **INSERT**
- `ciw` - usunięcie wyrazu i wejście w trym **INSERT**
- `dap` - usunięcie całego paragrafu
- `di"` - usunięcie wszystkiego w bloku ""
- `dt"` - usunięcie od kursora do pierwszego wystąpienia znaku "
- `dT"` - usunięcie od kursora do poprzedniego wystąpienia znaku "
- `di{` - usunięcie wszystkiego pomiędzy znakami `{}`
- `J` - łączenie dwóch linii
- `cc` - wycina całą linię i wchodzi w tryb **INSERT**
- `~` - zamienia wielkość liter pod kursorem np. z małej na Wielką
- `r` - zamienia znak pod kursorem np. `ra` zamienia znak pod kursorem na `a`

## Kopiuj / wklej

- `yy` - kopiuje całą linię niezależnie od miejsca w którym się znajdujemy
- `cc` - wycina całą linię i wchodzi w tryb **INSERT**
- `p` - wkleja za kursorem
- `P` - wkleja przed kursorem

## Makra

- `qa` - nagrywa makro w rejestrze `a`
- `q` - zatrzymuje nagrywanie makra
- `@a` - uruchamia makro `a`
- `@@` - ponownie uruchamia poprzednio odtworzone makro
