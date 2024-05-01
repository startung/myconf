# General Linux Setup

Notes:

- OS: Nobara 39
- nvidia support
- sway window manager

Maybe add some more of the [stuff](https://mutschler.dev/linux/fedora-post-install)


## Install
- User: startung
- Device Name: beast-nobara
- Use encryption, same password for encryption and login, autologin
- Use swapfile


## Speed up updates

- `sudo nano /etc/dnf/dnf.conf`
- set `max_parallel_downloads=10`
- add `fastestmirror=true`


## From welcome app
- Allow the update, if it fails use nobara-sync
- Uncheck open on start up
- Install Discord
- Log in to Steam, then install Steam Game Fixups
- Proton-GE
- Add speedcoder and monkeytype web apps


## Admin stuff

- `sudo hostnamectl set-hostname "beast-nobara"`
- `sudo mkdir /mnt/data`
- `to /etc/fstab add UUID=0C00412A00411C58                     /mnt/data      ntfs    defaults,noatime,nls=utf8,umask=000,dmask=027,fmask=137,uid=1000,gid=1000,windows_names 0 2`


## Settings - Display

- Set Samsung to 100Hz
- Set Dell to left side and rotate to portrait right


## Fix login monitor

- `sudo cp ~/.config/monitors.xml /var/lib/gdm/.config/`
- `sudo chown gdm:gdm /var/lib/gdm/.config/monitors.xml`
- Restart


## Basics

`mkdir -p app-data code/data notes zotfiles`


## Increase swapfile size

```bash
cat /proc/swaps
sudo swapoff /swap/swapfile
sudo rm /swap/swapfile
sudo btrfs filesystem mkswapfile --size 200g --uuid clear /swap/swapfile
sudo swapon /swap/swapfile
cat /proc/swaps
```


## Create/Restore RSA Key:

```bash
ssh-keygen -t rsa -b 4096 -C "darren.rawlings@gmail.com"
eval "$(ssh-agent -s)"
ssh-add /home/startung/.ssh/id_rsa_beast_nobara
```


## Desktop Environments

- `sudo dnf install @sway-desktop-environment --allowerasing`
- `sudo dnf copr enable solopasha/hyprland`
- `sudo dnf install hyprland-nvidia`
- `sudo vim /usr/share/wayland-sessions/sway.desktop`
- edit so: `Exec=sway --unsupported-gpu`

### Fix Sway-Nvidia

Set /etc/environment to:

```
# Hardware cursors not yet working on wlroots
WLR_NO_HARDWARE_CURSORS=1

# Set wlroots renderer to Vulkan to avoid flickering
WLR_RENDERER=vulkan

# General wayland environment variables
XDG_SESSION_TYPE=wayland
QT_QPA_PLATFORM=wayland
QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Firefox wayland environment variable
MOZ_ENABLE_WAYLAND=1
MOZ_USE_XINPUT2=1

# OpenGL Variables
GBM_BACKEND=nvidia-drm
__GL_GSYNC_ALLOWED=0
__GL_VRR_ALLOWED=0
__GLX_VENDOR_LIBRARY_NAME=nvidia

# Xwayland compatibility
XWAYLAND_NO_GLAMOR=1
```

### Enable Gnome Keyring in Sway (from: https://major.io/p/use-gnome-keyring-with-sway)

```bash
systemctl daemon-reload --user
systemctl enable --now --user gnome-keyring-daemon
systemctl status --user gnome-keyring-daemon
```


## Dnf Installs

### Min list
sudo dnf install arandr bat btop calibre cowsay darktable eza firefox-wayland flameshot foot fuzzel fzf g++ gimp gnome-tweaks go hyprpaper keepassxc mc meson network-manager-applet no-more-secrets nvtop polkit-gnome qbittorrent qdirstat rpi-imager tldr wev wireguard-tools yad 


### Maybe list
sudo dnf install binwalk corectrl valac wireguard-tools


### Descriptions

- **arandr**: Graphical X RandR monitor configuration tool.
- **bat**: A cat (print) command for text files, but with syntax highlighting and git diff.
- **bemenu**: Interactive menu for Bash, with fuzzy finding and file previews.
- **binwalk**: Reverse-engineers binary files looking for embedded Linux kernels and shellcode.
- **btop**: Interactive, realtime Linux process viewer similar to top but with interactive controls.
- **build-essential**: Metapackage installing essential tools required for Debian packaging.
- **calibre**: Powerful e-book manager (library management, conversion, syncing, etc.).
- **cargo**: Rust package manager for building, testing and deploying Rust projects.
- **corectl**: Control and monitor systemd services and system information.
- **cowsay**: Display ASCII art cow sayings or messages.
- **curl**: Transfer data between a client and various servers using different protocols.
- **darktable**: Raw image processing software, similar to Lightroom.
- **du-dust**: A more intuitive version of du in rust.
- **eza**: Interactive terminal emulator with split views and mouse support.
- **firefox-wayland**: A web browser supporting multiple platforms, including Wayland compositors.
- **flameshot**: Simple screenshot tool that can capture regions, full screen or windows.
- **foot**: Terminal-based file manager for browsing and managing files.
- **fuzzel**: A Wayland-native application launcher, similar to rofi's drun mode.
- **fzf**: Interactive command-line fuzzy finder, enhancing the user experience of various applications.
- **g++**: Compiler for c++.
- **gimp**: Advanced image editor used for photo retouching, manipulation, and creation.
- **git**: Distributed version control system, facilitating collaboration and software development.
- **gnome-extensions-app**: GNOME shell extensions browser and installer.
- **gnome-tweaks**: Graphical settings editor for customizing the appearance and behavior of the GNOME desktop environment.
- **go**: Open-source programming language for building simple, efficient, and concurrent software.
- **gobject-introspection**: Code generation utility for producing language bindings for GLib objects.
- **gtk-doc-tools**: Generate HTML documentation from GTK+ application source code.
- **gtk-layer-shell-devel**: Development tools for the GTK+ 3.x graphical toolkit.
- **gtk3-devel**: GTK+ 3 development headers and libraries.
- **hyprland**: A dynamic, flexible, and extensible tiling window manager.
- **j4-dmenu-desktop**: Desktop application launcher based on the rofi dmenu interface.
- **keepassxc**: A password manager.
- **cairo-devel**: Development files for Cairo, a graphics library rendering vector and raster images. Required for nwg-bar.
- **cairo-gobject-devel**: Go development files for Cairo, a graphics library rendering vector and raster images. Required for nwg-bar.
- **libedit-devel**: Development headers for the editing library used by various applications.
- **libgirepository1.0-dev**: Libraries and headers required for introspection support.
- **glib2-devel**: Development files for Glib, a fundamental utility library in GNOME projects. Required for nwg-bar.
- **libgtk-3-devel**: GTK+ 3 development headers and libraries.
- **libpango1.0-dev**: Development files for Pango, a text rendering engine with OpenType features.
- **libusb**: User-space library to communicate with USB devices without requiring root privileges.
- **libusb-compat-0.1**: Compatibility layer providing a standard API for working with USB devices.
- **libusb-compat-0.1-devel**: Development files for the compatibility layer.
- **libwayland-dev**: Development headers and libraries for Wayland, a simple compositor.
- **mc**: Terminal-based file manager with text editor, FTP client, and various tools.
- **meson**: Build system for creating installable packages using C, Rust, or other languages.
- **neofetch**: Display terminal backgrounds based on system information.
- **neovim**: A modern, extensible text editor built upon Vim.
- **network-manager-applet**: System tray icon managing WiFi and VPN connections.
- **no-more-secrets**: Reveal hidden passwords in terminal output.
- **nvtop**: GPU monitor with realtime 3D overlay displaying system statistics.
- **polkit-gnome**: GNOME frontend for PolicyKit, allowing privileged actions from graphical applications.
- **pulseaudio-utils**: Utilities for managing and configuring the PulseAudio sound server.
- **python-is-python3**: Check if Python interpreter is version 3 or above.
- **qbittorrent**: Bittorrent client for downloading files using the BitTorrent protocol.
- **qdirstat**: File explorer with treeview and tabbed interface, providing quick access to directories.
- **sway**: A tiling window manager following i3wm workflow, using Wayland compositor.
- **swig**: Command  used  to  create wrapper code to connect C and C++ code to scripting languages like Python.
- **rg**: Ripgrep is a tool to allows the grepping of files including in subdirectories.
- **rpi-imager**: A tool for imaging images to microSD cards/usb devices, focused on the Raspberry Pi.
- **tldr**: Display terminal man pages in plain English.
- **valac**: Compile Vala source code into machine code for generating statically linked executables.
- **waybar**: System tray bar for Wayland with notifications, weather, and other features.
- **wayland-protocols-devel**: Contains Wayland protocols that add functionality not available in the Wayland core protocol. Required for dmenu-wl.
- **wireguard-tools**: Utilities for managing WireGuard VPN connections and configuration files.
- **wev**: Shows wayland events, useful for showing key codes for the sway bindings.
- **yad**: GTK+ graphical dialog application for handling various tasks such as file choosers, input boxes, and more.


## Flatpak Installs

- Gear Lever
- Extension Manager (by mjakeman, after removing existing)
- vlc
- spotify
- cozy (audiobook reader)
- blanket (ambient sounds)


## Extension Manager

- Espresso
- Fancy Tiling


## Gear Lever Settings

- Use executable name for integrated terminal apps: On
- Save appimages files without prefixes: On


## AppImages

- [pCloud](https://www.pcloud.com/how-to-install-pcloud-drive-linux.html?download=electron-64) (set sync app-data <-> Applications)
- [Obsidian](https://obsidian.md)
- [Arduino](https://www.arduino.cc/en/software)
- [PrusaSlicer](https://github.com/prusa3d/PrusaSlicer/releases)


## RPM install

- [Microsoft Edge](https://www.microsoft.com/en-us/edge/download)
- [Libation](https://github.com/rmcrackan/Libation)

## [VSCode](https://code.visualstudio.com/docs/setup/linux)

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code
```


## [Codium](https://vscodium.com/)

```bash
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium
```


### [ProtonVPN](https://protonvpn.com/support/official-linux-vpn-fedora)

```bash
wget https://repo.protonvpn.com/fedora-39-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.1-2.noarch.rpm
sudo dnf install ./protonvpn-stable-release-1.0.1-2.noarch.rpm
sudo dnf check-update && sudo dnf upgrade
sudo dnf install --refresh proton-vpn-gnome-desktop
```
Accept the two GPG Keys


## Rust Installs

- `curl https://sh.rustup.rs -sSf | sh`
- `cargo install du-dust`
- Atuin (history):
```sh
/bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)"
atuin login -u startung
atuin import auto
atuin sync
```


## ML

### [Miniconda](https://docs.anaconda.com/free/miniconda)

```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
conda create --name tf python=3.11
conda activate tf
conda install -c conda-forge tensorflow-gpu
sudo echo 0 | sudo tee -a /sys/bus/pci/devices/0000\:01\:00.0/numa_node
python -c "import tensorflow as tf; print(tf.config.list_physical_devices())"
conda install numpy pandas scikit-learn matplotlib seaborn ipykernel tqdm opencv dash
conda deactivate
conda create --name pt python=3.11
conda activate pt
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
conda install numpy pandas scikit-learn matplotlib seaborn ipykernel tqdm opencv dash
python -c "import torch as pt; print([pt.cuda.device(i) for i in range(pt.cuda.device_count())])"
conda deactivate
```


```bash
curl https://ollama.ai/install.sh | sh
ollama list
```

## Micro Controller etc...

Allow use of arduinos etc: sudo usermod -a -G dialout $USER


## Dotfiles

My dotfiles, tracked in a bare git repository. Borrowed from [Derrick Reimer's repo](https://github.com/derrickreimer/dotfiles), and [Nicola Paolucci's blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

- Add public rsa key to github.com
- Clone this repository into your home directory: `git clone --bare git@github.com:startung/myconf.git $HOME/.dotfiles`
- Checkout the content of the repository: `git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout`
- If there are conflicts with existing files, Git will let you know, be sure to back those up first before retrying
- Restart your shell session to pick up all the new aliases and configurations.
- Tell Git to ignore untracked files when running `git status`, since this repository will only manage certain hand-picked files in your home directory: dotfiles config --local status.showUntrackedFiles no

Usage

- See your proposed changes: `dotfiles status`
- Stage up your changes: `dotfiles add [files/directories]`
- `dotfiles commit -m "Message goes here"`
- Push to GitHub: `dotfiles push`
- You'll want to avoid running an "add all" command (like `dotfiles add .` or `dotfiles add -A`) since only some of the files in the home directory are tracked by Git. Instead use `dotfiles add -u` which will add all tracked files.


## Zotero

- Get [latest (min 7)](https://www.zotero.org/support/dev/zotero_7_for_developers)
- Extract and move to /opt/zotero
- run `sudo /opt/zotero/set_launcher_icon`
- `ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop`
- [better bibtex](https://retorque.re/zotero-better-bibtex/)

## Gnome shortcuts
- disable Super+p gsettings set org.gnome.mutter.keybindings switch-monitor '[]'
- add Super+Return short cut for terminal(foot)
- add Super+Shift+Return shortcut for firefox
- add Super+Shift+n shortcut for Nautilus
- add Super+p short cut for keepassxc
- add Super+Esc short cut for lock screen (disable restore shortcuts)


## Tweaks

- set theme to Dracula
- change caps for Esc but shift caps as regular
- add euro on 4
- disable middle click paste
- set Interface, Monospace, and Legacy to JetBrains Nerd Mono
- if the mouse cursor does not appear add `WLR_NO_HARDWARE_CURSORS=1` to `/etc/environment`



## Colour Palette

- #0e1419 Background - very dark grey
- #44475a Current line/Selection - dark grey
- #6272a4 Comment - dark blue
- #f8f8f2 Foreground - off white
- #ff5555 Red
- #ffb86c Orange
- #f1fa8c Yellow
- #50fa7b Green
- #8be9fd Cyan
- #bd93f9 Purple
- #ff79c6 Pink



