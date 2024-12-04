## Initial

Ensure secure boot is disabled
install fedora 41
sudo dnf update
set user to autologin

## Setup home

```bash
mkdir .ssh appdata bin code notes
# mkdir ~/.fonts
```

## Create/Restore RSA Key:

```bash
ssh-keygen -t rsa -b 4096 -C "darren.rawlings@gmail.com"
eval "$(ssh-agent -s)"
ssh-add /home/startung/.ssh/id_rsa_tuf_fedora
```

## Nvidia

sudo dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf makecache
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda nvtop

## Desktop Environments

```bash
sudo dnf install @swaywm-extended
sudo vim /usr/share/wayland-sessions/sway.desktop
add --unsupported-gpu
```

## VM enviroment

sudo dnf install @virtualization
sudo nano /etc/libvirt/libvirtd.conf
uncomment unix_sock_group = "libvirt"
set unix_sock_ro_perms = "0770"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo usermod -a -G libvirt $(whoami)

## Other Software

- download: https://www.microsoft.com/en-us/edge/download

```sh
sudo dnf install gnome-tweaks arandr qbittorrent cowsay no-more-secrets pulseaudio-utils yad gtk3-devel gtk-layer-shell-devel golang btop wireguard-tools j4-dmenu-desktop bemenu libedit-devel gimp corectrl libusb libusb-compat-0.1 libusb-compat-0.1-devel binwalk eza bat tldr fzf qdirstat flameshot mc calibre darktable polkit nwg-bar keepassxc vim-enhanced fuzzel alacritty trash

sudo dnf install @c-development

curl -fsSL https://repo.librewolf.net/librewolf.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
sudo dnf install librewolf

sudo dnf install ./microsoft-edge-*

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code

```
### flatpak

- gnome extensions manager (from Matthew Jakeman)
- gear lever (set naming convention to on)
- vlc
- spotify
- protonvpn

### appimages

- pCloud from https://www.pcloud.com/download-free-online-cloud-file-storage.html

### Gnome Extensions

- Caffeine

Atuin (history):
```sh
/bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)"
atuin login -u startung
atuin import auto
atuin sync
```

cargo install du-dust



## Dotfiles

My dotfiles, tracked in a bare git repository. Borrowed from [Derrick Reimer's repo](https://github.com/derrickreimer/dotfiles), and [Nicola Paolucci's blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

- Add public rsa key to github.com
- Clone this repository into your home directory: git clone --bare git@github.com:startung/myconf.git $HOME/.dotfiles
- Checkout the content of the repository: git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
- If there are conflicts with existing files, Git will let you know, be sure to back those up first before retrying
- Restart your shell session to pick up all the new aliases and configurations.
- Tell Git to ignore untracked files when running `git status`, since this repository will only manage certain hand-picked files in your home directory: dotfiles config --local status.showUntrackedFiles no

Usage

- See your proposed changes: dotfiles status
- Stage up your changes: dotfiles add .bashrc
- dotfiles commit -m "Message goes here"
- Push to GitHub: dotfiles push
- You'll want to avoid running an "add all" command (like `dotfiles add .` or `dotfiles add -A`) since only some of the files in the home directory are tracked by Git. Instead use `dotfiles add -u` which will add all tracked files.


## Committing new changes

Suppose you just made a change to your `.bashrc` file and would like to commit it
to your dotfiles repo.

```sh
# See your proposed changes
dotfiles status

# Stage up your changes
dotfiles add .bashrc

# Commit it
dotfiles commit -m "Message goes here"

# Push it up
dotfiles push
```

You'll want to avoid running an "add all" command (like `dotfiles add .` or `dotfiles add -A`) since only some of the files in the home directory are tracked by Git. Instead use `dotfiles add -u` which will add all tracked files.

## Allow use of arduinos etc...
sudo usermod -a -G dialout $USER

## ML

curl https://ollama.ai/install.sh | sh
ollama pull llama3.2
ollama pull qwen2.5-coder:3b
ollama pull phi3.5	
ollama pull qwen2-math:1.5b

```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
conda create --name tf python=3.12
conda activate tf
pip install tensorflow[and-cuda]
# sudo echo 0 | sudo tee -a /sys/bus/pci/devices/0000\:01\:00.0/numa_node
python -c "import tensorflow as tf; print(tf.config.list_physical_devices())"
pip install numpy pandas scikit-learn matplotlib seaborn ipykernel
conda deactivate
conda create --name pt python=3.12
conda activate pt
pip install torch torchvision torchaudio
python -c "import torch as pt; print([pt.cuda.device(i) for i in range(pt.cuda.device_count())])"
pip install numpy pandas scikit-learn matplotlib seaborn ipykernel
conda deactivate
conda create --name kaggle python=3.12
conda activate kaggle
pip install torch torchvision torchaudio
python -c "import torch as pt; print([pt.cuda.device(i) for i in range(pt.cuda.device_count())])"
pip install numpy pandas scikit-learn matplotlib seaborn ipykernel kaggle
conda deactivate
```

## Enable Gnome Keyring in Sway (from: https://major.io/p/use-gnome-keyring-with-sway)

```sh
systemctl daemon-reload --user
systemctl enable --now --user gnome-keyring-daemon
systemctl status --user gnome-keyring-daemon
```

## Tweaks

- set theme to Dracula???
- change caps for Esc but shift caps as regular
- add euro on 4
- disable middle click paste
- set Interface, Monospace, and Legacy to JetBrains Nerd Mono
- add to /etc/fstab //192.168.0.11/media /mnt/media cifs username=media,password=bpULiQ8mcVWgbZFmg1lxfDJneuzwkv,_netdev 0  0

## Docker

```bash
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
docker run hello-world
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```


## Maybe

- rpi pico dev env: https://github.com/johnwalicki/RaspPi-Pico-Examples-Fedora
- Brave Browser - https://brave.com/linux/
- Secure brave - https://www.privacyguides.org/en/desktop-browsers/#brave
