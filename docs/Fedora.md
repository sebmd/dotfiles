# Fedora

## Instalacja RPM Fusion

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## Instalacja tematu Yarn z Ubuntu dla Gnome

```
dnf install gnome-shell-theme-yaru yaru-theme
```

## Instalacja dodatku Tiling dla Gnome z Pop Os

```
dnf install gnome-shell-extension-pop-shell
```

## Ustawienie nazwy systemu

```
 hostnamectl set-hostname fedora.lan
```

## Kopia zapasowa zainstalowanych pakietów

Lista pakietów zainstalowaych przez użytkownika bez zależności.
```
dnf history userinstalled > pakiety-userinstalled.txt
```

Lista zainstalowanych pakietów
```
dnf list installed > pakiety-installed.txt
```

## Konfiguracja sieciowa

Lista urządzeń sieciowych oraz stan połączenia
```
nmcli device
DEVICE   TYPE      STATE          CONNECTION 
enp0s25  ethernet  połączono      enp0s25    
tap0     tun       połączono      tap0       
wlp3s0   wifi      rozłączono     --         
lo       loopback  niezarządzane  --         
```

## Konfiguracja adresu IP

```
nmcli connection modify enp0s25 ipv4.address 192.168.1.200/24
```

## Ustawienie adresu IP przez serwer DHCP

Dostępne opcje `ipv4.method` to `auto` dla DHCP i `manual` dla ustawienia
statycznego adresu IP

```
nmcli connection modify enp0s25 ipv4.method auto
```

## Ustawienie bramy sieciowej

```
nmcli connection modify enp0s25 ipv4.gateway 192.168.1.1
```

## Ustawienie serwerów DNS

```
nmcli connection modify enp0s25 ipv4.dns 192.168.1.1
```

## Informacje o połączeniu

```
nmcli device show enp0s25

GENERAL.DEVICE:                         enp0s25
GENERAL.TYPE:                           ethernet
GENERAL.HWADDR:                         00:00:00:00:00:01
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (połączono)
GENERAL.CONNECTION:                     enp0s25
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/4
WIRED-PROPERTIES.CARRIER:               włączone
IP4.ADDRESS[1]:                         192.168.6.200/24
IP4.ADDRESS[2]:                         192.168.1.200/24
IP4.GATEWAY:                            192.168.1.1
IP4.ROUTE[2]:                           dst = 192.168.1.1/32, nh = 0.0.0.0, mt = 100
IP4.ROUTE[3]:                           dst = 192.168.6.0/24, nh = 0.0.0.0, mt = 100
IP4.ROUTE[4]:                           dst = 192.168.1.0/24, nh = 0.0.0.0, mt = 100
IP4.ROUTE[5]:                           dst = 0.0.0.0/0, nh = 192.168.1.1, mt = 100
IP4.DNS[1]:                             192.168.1.1
```
