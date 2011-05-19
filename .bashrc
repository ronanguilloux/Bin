# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more aliases
alias ll='ls -lh'
alias la='ls -la'
alias l='ls -la'
alias untar="tar xvf"
alias ungz="gunzip"
alias unzip2="bzip2 -d"
alias untargz="tar zxvf"
alias untarbz1="tar jxvf"
alias ifif='sudo ifdown wlan0 && sudo ifup wlan0'
alias upup='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
alias upupg='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
alias sagi='sudo apt-get install'
alias sacs='sudo apt-cache search'
alias autoremove='sudo apt-get autoremove && sudo apt-get autoclean'
# cf. aussi : sudo dpkg -P `dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2`
alias purge='sudo apt-get remove --purge `deborphan`'
alias purgeall='sudo apt-get --purge remove `deborphan -n --guess-all`'
alias menage='find . -name "*~" -exec rm {} \;'
alias menagesvn='find . -name ".svn" -exec rm -rf {} \;'
alias menageup='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove'
alias eZPurge='php bin/php/ezcache.php --clear-all --purge && php bin/php/ezpgenerateautoloads.php -p'
alias arbre='tree -ugsapD'
alias taille='du -chs'
alias WWWfy='sudo chmod 775 * -R && sudo chown ronan:www-data * -R'
alias semaine='date '+%U''
alias combien='ls -l | grep -v ^l | wc -l'
alias trouver="echo \"find . -name '*' -exec grep -Hn '/MaChaine/' {} \;\""
alias screencast='ffmpeg -f x11grab -r 25 -s wxga -i :0.0 /tmp/outputFile.mpg'
alias lastmodified='find -type f -print0 | xargs -r0 stat -c %y\ %n | sort'
alias gtr='php ~/shell/googleTranslate.php'
alias realtimemodifiedfiles="watch -d -n 2 'df; ls -FlAt;'"
alias jobeet='cd /opt/web/symfony/jobeet'
alias vimvim="vim ~/.vimrc"


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

HISTSIZE=10000
HISTFILESIZE=10000

#fortune /usr/share/games/fortunes/fr/tolkien_fr

#export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH=$PATH:$GOBIN

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

