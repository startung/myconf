# Setup - Ubuntu 22.04 + i3
Install Ubuntu 22.04

?? modprobe.blacklist=nouveau

Setting > Appearance > Dark & Colour Red

## Setup basics
## Notes: Syncthing https://apt.syncthing.net
## Notes: i3 - https://kifarunix.com/install-i3-windows-manager-on-ubuntu/
## Notes: Alacritty Terminal
```bash
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update && sudo apt upgrade -y
```

## Install Lambda Stack - https://scaomath.github.io/blog/build-machine-learning-pc-gpu-cuda-only/
wget -nv -O- https://lambdalabs.com/install-lambda-stack.sh | sh -
sudo reboot

sudo nala install libfuse2  alacritty curl git build-essential flatpak keepassxc vim net-tools cowsay tigervnc-viewer ttf-mscorefonts-installer fonts-hack-ttf ubuntu-restricted-extras dialog python3-pip python-is-python3 hexedit virtualbox cifs-utils vlc qbittorrent gnome-tweaks samba-client samba-common libdvd-pkg nvidia-prime nvidia-settings i3 nitrogen picom caffeine shutter syncthing gnome-software-plugin-flatpak gnome-software ranger pavucontrol virtualbox python-venv nvtop flameshot gimp atool plocate tesseract-ocr ocrmypdf neovim btop

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

## Create/Restore RSA Key:
```bash
ssh-keygen -t rsa -b 4096 -C "darren.rawlings@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git config --global user.email "darren.rawlings@gmail.com"
git config --global user.name "Darren Rawlings"
```


## Setup home
```bash
mkdir ~/{bin,data,code,notes,.fonts}
```

touch .config/i3/`hostname`.conf
touch .config/i3status/`hostname`.conf
add public key to github

## Fix firefox extensions
flatpak permission-set webextensions net.downloadhelper.coapp snap.firefox yes
flatpak permission-set webextensions org.keepassxc.keepassxc_browser snap.firefox yes

## Install appimages to ~/bin
* pCloud - https://www.pcloud.com/download-free-online-cloud-file-storage.html (set up sync data to Applications)
* prusaSlicer - https://www.prusa3d.com/page/prusaslicer_424/
* balanaEtcher - https://www.balena.io/etcher#download-etcher
* Obsidian - https://obsidian.md
* mullvad browser - https://mullvad.net/en/download/browser/linux (check signature ```gpg --verify mullvad-browser-*.asc``` move to bin then run ```./start-mullvad-browser.desktop --register-app```)
## Other
todotxt
```bash
git clone https://github.com/todotxt/todo.txt-cli.git
```

## Install Using Apt
* #tilix
* #librewolf (https://librewolf.net/installation/debian/)
* vs code - (Download: https://code.visualstudio.com/)
* protonvpn (https://protonvpn.com/support/linux-ubuntu-vpn-setup/)
* raspberry pi installer (https://www.raspberrypi.com/software/)
* nvtop (https://github.com/Syllo/nvtop/)

# Snap Store
* // notepad++
* // arduino ide
* Spotify

# flatpak
* //Tangram (webapp browser) - flatpak install flathub re.sonny.Tangram
* flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
* flatpak install zotero
* git clone git@github.com:startung/obsidian-main-vault.git

## Additional Setup
* Clone dotfiles 
* // Install JetBrains Mono font hack font https://www.jetbrains.com/lp/mono/#how-to-install
* // Install Gidole and Monoid fonts https://larsenwork.com/projects/
* // Intsall Comic Mono font https://dtinth.github.io/comic-mono-font/
* Install Comic Code font (copy to ~/.fonts)
* // In Nautilus pin code and data on rpiomv.local
* Go through gnome-tweaks: Caps->Esc
* // Adjust clock for dual boot: timedatectl set-local-rtc 1 --adjust-system-clock
* add to /etc/fstab /192.168.1.5/media /mnt/media cifs username=media,password=s69CqdyHTFs69CqdyHTF,_netdev 0  0
* install tor https://www.torproject.org/download/


## ASUS TUF Specific
## Kernel 6.1
```bash
sudo add-apt-repository ppa:cappelikan/ppa
sudo nala update
sudo nala install -y mainline
```
Choose kernel 6.1

### Asus-linux (https://gitlab.com/asus-linux/asusctl)
```bash
sudo nala install libgtk-3-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libglib2.0-dev cmake libclang-dev libudev-dev libayatana-appindicator3-1
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
git clone https://gitlab.com/asus-linux/asusctl.git
cd asusctl
make
sudo make install
```

