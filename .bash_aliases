# ~/.bash_aliases
#
shopt -s expand_aliases
shopt -s globstar

alias cp="cp -i"                       # confirm before overwriting something
alias mv="mv -i"                       # confirm before overwriting something
alias df='df -h'                       # human-readable sizes
alias free='free -m'                   # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias ls='ls --color=auto'             # add some colour
alias grep='grep --color=auto'         # add some colour
alias fgrep='fgrep --color=auto'       # add some colour
alias egrep='egrep --color=auto'       # add some colour
alias diff='diff --color=auto'         # add some colour

# make man pages more colourful
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# use LSD rather than ls
command -v lsd &> /dev/null && alias ls='lsd --group-dirs first'

# ex - archive extractor, usage: ex <file>
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
gitr() {
    git pull && git add . && git commit -m "$1" && git push;
}
kpx() { 
  kpcli --readonly --kdb=/home/darren/pCloudDrive/Applications/Keepass2Android/main.kdbx --command "xp main/$1";
}
kpu() { 
  kpcli --readonly --kdb=/home/darren//pCloud/Drive/Applications/Keepass2Android/main.kdbx --command "xu main/$1";
}
end() {
    kill $(ps aux | grep "$1" | grep -v grep | awk '{print $2}');
}

