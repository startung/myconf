# myconf

My dotfiles, tracked in a bare git repository.

Borrowed from
* [Derrick Reimer's repo](https://github.com/derrickreimer/dotfiles)
* [Nicola Paolucci's blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Installation

### Install the pre-requisites
```sh
sudo apt install git curl vim caffeine kpcli keepassxc cowsay build-essential
```

Install pCloud from https://www.pcloud.com/download-free-online-cloud-file-storage.html

Install No-More-Secrets
```sh
git clone https://github.com/bartobri/no-more-secrets.git
cd ./no-more-secrets
make nms
make sneakers             ## Optional
sudo make install
```

Fix the clipboard on Xclip

```sh
perl -MCPAN -e install HTML::Template 
cd ~/perl5/lib/perl5
curl -O https://www.av8n.com/security/Xclip.pm
curl -O http://search.cpan.org/CPAN/authors/id/P/PE/PEREINAR/File-Which-0.05.tar.gz
ex File-Which-0.05.tar.gz
cd File-Which-0.05
perl Makefile.PL INSTALLSITELIB=~/perl5/lib/perl5
make && make install
```
... make the following changes to /usr/bin/kpcli:
```sh
44a45,46
> use Xclip;
>
1702c1704
<     Clipboard->copy('');
---
>     Xclip::copy2('');
1734c1736
<     Clipboard->copy($to_copy);
---
>     Xclip::copy2($to_copy);
```

### Clone the repository into home directory

This repository contains a `.bashrc` file, which you will want to override the
default file created by bash. If you need to retain your existing `.bashrc` file,
move it to a different spot:

```sh
cd ~
mv .bashrc .bashrc.pre-dotfiles
```

Then, clone this repository into your home directory:

```sh
git clone --bare https://github.com/startung/myconf.git $HOME/.dotfiles
```

Checkout the content of the repository into `$HOME`:

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

If there are conflicts with existing files, Git will let you know like this:

```
error: The following untracked working tree files would be overwritten by checkout:
    .gitconfig
Please move or remove them before you can switch branches.
Aborting
```

Be sure to back those up first before moving forward.

Restart your shell session to pick up all the new aliases and configurations.

### Finish setup
Fix vim by installing pathogen and vim-plug

```sh
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
open vim and type
```sh
:PlugInstall
```
Install Nerd Font (Hack) and LSD
https://www.nerdfonts.com/font-downloads
https://github.com/Peltoche/lsd
Download the latest .deb package from the release page and install it via:
```sh
sudo dpkg -i lsd_7.2.0_amd64.deb  # adapt version number and architecture
```

You'll want to tell Git to ignore untracked files when running `git status`,
since this repository will only manage certain hand-picked files in your
home directory:

```sh
dotfiles config --local status.showUntrackedFiles no
```

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

You'll want to avoid running an "add all" command (like `dotfiles add .` or `dotfiles add -A`)
since only some of the files in the home directory are tracked by Git. Instead use `dotfiles add -u` which will add all tracked files.
