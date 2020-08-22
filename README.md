# dotfiles

<!-- vim-markdown-toc GFM -->

* [Instalacja](#instalacja)
* [Informacje dodatkowe](#informacje-dodatkowe)

<!-- vim-markdown-toc -->

# Instalacja

**Pobranie repozytorium**

```
curl https://git.io/JUvRG -fLo $HOME/git/dotfiles.zip --create-dirs
cd git
unzip dotfiles.zip
rm dotfiles.zip
mv dotfiles-master dotfiles
```

Sklonowanie repozytorium

```
mkdir -p $HOME/git
git clone https://github.com/sebmd/dotfiles $HOME/git/dotfiles --depth 1
```

**Uruchomienie instalatora**

Instalator utworzy linki sysmboliczne do repozytorium 'dotfiles'.
Wszystkie pliki, które już istnieją zostaną przeniesione do katalogu
`~/.backup`.

```
cd $HOME/git/dotfiles
./install.sh
```

# Informacje dodatkowe

   - [Vim](docs/VIM.md)
   - [Aliasy Shell](docs/ALIASY.md)
   - [Tmux](docs/TMUX.md)
