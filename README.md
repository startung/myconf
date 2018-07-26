# myconf

My dotfiles, tracked in a bare git repository.

Borrowed from
* [Derrick Reimer's repo](https://github.com/derrickreimer/dotfiles)
* [Nicola Paolucci's blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Installation

### Clone the repository into home directory

This repository contains a `.bashrc` file, which you will want to override the
default file created by bash. If you need to retain your existing `.bashrc` file,
move it to a different spot:

```sh
cd ~
mv .bashrc .bashrc.pre-dotfiles
```

Next, ensure that your `.dotfiles` directory will be ignored by Git (to eliminate
recursion issues) by adding to `.gitignore`:

```sh
touch .gitignore
echo ".dotfiles" >> .gitignore
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
since only some of the files in the home directory are tracked by Git.
