# ~/.bash_aliases
#
shopt -s expand_aliases

alias cp="cp -i"                          # confirm before overwriting something
alias mv="mv -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Darren's customisations------------------------------------------------------------------

# automatically cd when entering just a path
shopt -s autocd

# set aliases and functions pretending to be aliases
alias t='todo.sh'
alias dotfiles='/usr/bin/git --git-dir=/home/darren/.dotfiles/ --work-tree=/home/darren'
alias kp='kpcli --readonly --kdb=/home/darren/Applilcations/Keepass2Android/main.kdbx'
alias dm='icmbuild program && \cp -f tmp/bin/binary ${PWD##*/} && ./${PWD##*/}'
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'
alias gita='find . -maxdepth 1 -type d -name "[!.]*" -print -execdir git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
alias gitp='find . -maxdepth 1 -type d -name "[!.]*" -print -execdir git --git-dir={}/.git --work-tree=$PWD/{} push \;'
alias gits='find . -maxdepth 1 -type d -name "[!.]*" -print -execdir git --git-dir={}/.git --work-tree=$PWD/{} status \;'
kpx() { 
  kpcli --readonly --kdb=/home/darren/Applications/Keepass2Android/main.kdbx --command "xp main/$1";
}
kpu() { 
  kpcli --readonly --kdb=/home/darren/Applications/Keepass2Android/main.kdbx --command "xu main/$1";
}

