# dotfiles

<!-- vim-markdown-toc GFM -->

* [Wymagania](#wymagania)
    * [Instalacja wymaganych pakietów w systemie Fedora](#instalacja-wymaganych-pakietów-w-systemie-fedora)
* [Instalacja](#instalacja)
* [Informacje dodatkowe](#informacje-dodatkowe)

<!-- vim-markdown-toc -->

# Wymagania

  - bat
  - fzf
  - git
  - ripgrep (rg)
  - skim (sk)
  - tmux
  - vim

## Instalacja wymaganych pakietów w systemie Fedora

```
sudo dnf install bat fzf git ripgrep skim tmux vim
```

# Instalacja

**Pobranie repozytorium**

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
