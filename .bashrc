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

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more aliases
alias la='ls -la'
alias l='ls -la'
alias ls='ls -h --color --group-directories-first' 
alias lsa='ls -A'           # affiche les fichiers cachés
alias ll='ls -lh'           # affiche en mode liste détail
alias lla='ls -Al'          # affiche en mode liste détail + fichiers cachés
alias lx='ls -lXB'          # tri par extension
alias lk='ls -lSr'          # tri par taille, le plus lourd à la fin
alias lc='ls -ltcr'         # tri par date de modification, la pus récente à la fin
alias lu='ls -ltur'         # tri par date d’accès, la pus récente à la fin
alias lt='ls -ltr'          # tri par date, la pus récente à la fin
alias lm='ls -al | more'    # Pipe a travers 'more'
alias lr='ls -lR'           # ls récurssif
#alias tree='tree -Csu'      # affiche sous forme d'arborescence, nécessite le paquet "tree"
alias du='du -kh'
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
alias ppa='sudo add-apt-repository'
alias autoremove='sudo apt-get autoremove && sudo apt-get autoclean'
# cf. aussi : sudo dpkg -P `dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2`
alias purge='sudo apt-get remove --purge `deborphan`'
alias purgeall='sudo apt-get --purge remove `deborphan -n --guess-all`'
alias menage='find . -name "*~" -exec rm {} \;'
alias menagesvn='find . -name ".svn" -exec rm -rf {} \;'
alias menagegit='find . -name ".git" -exec rm -rf {} \;'
alias menagemac='find . -name "._*" -exec rm -rf {} \;'
alias menageup='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove'
alias arbre='tree -ugsapD'
alias taille='du -chs'
alias chch='sudo chmod 775 * -R && sudo chown ronan:www-data * -R'
alias semaine='date '+%U''
alias combien='ls -l | grep -v ^l | wc -l'
alias chercher="echo \"find . -name '*' -exec grep -Hn '/MaChaine/' {} \;\""
alias trouver="find . -type f -print0 | xargs -0 grep " # usage : trouver 'exec(' 
alias screencast='ffmpeg -f x11grab -r 25 -s wxga -i :0.0 /tmp/outputFile.mpg'
alias lastmodified='find -type f -print0 | xargs -r0 stat -c %y\ %n | sort'
alias gtr='php ~/Bin/shell/googleTranslate.php'
alias realtimemodifiedfiles="watch -d -n 2 'df; ls -FlAt;'"
alias jobeet='cd /opt/web/symfony/jobeet'
alias work='cd ~/Workspace'
alias sf="symfony"
alias vimvim="vim ~/.vimrc"
alias vimbashrc="vim ~/.bashrc"
alias rebashrc=". ~/.bashrc"
alias svim="sudo vim"
alias git2cl='git log --graph --pretty=medium --color=never > CHANGELOG'
alias gitinfo='. /home/ronan/Bin/shell/gitinfo.sh'
alias gitignore='cat .gitignore'
alias gpom='git push origin master'
alias svndifff="svn diff | view -"
alias svnlogg="svn log -v -r{`date '+%Y-%m-01'`}:{`date '+%Y-%m-31'`} | colordiff"
alias svn2ch="~/Bin/shell/svn2cl-0.13/svn2cl.sh -o CHANGELOG"
alias ssarl="sudo service apache2 reload"
alias ssars="sudo service apache2 restart"
alias ssms="sudo service mongod start"
alias shistory='history | grep '
alias sshmemo="history | grep 'ssh '"
alias sshlist=". ~/Bin/shell/sshlist.sh"
alias svnmemo="history | grep 'svn '"
alias vimmemo="history | grep 'vim '"
alias gitmemo="history | grep 'git '"
alias svncommitmemo="history | grep 'svn commit '"
alias sfmemo="history | grep 'symfony '"
alias mybackup="cd /opt/backup/manual/ && php backup.php && cd -"
alias jsstyle="seed ~/Bin/js/jslint.js"
alias lotro=". ~/Bin/lotro.sh"
alias c='clear'
alias apache2routes='. ~/Bin/shell/apache2routes.sh'
alias googleBackup='/opt/backup/googledocs/gdatacopier-2.1.2/gcp.py -o -u rguilloux@toog.fr:/all ~/Documents/GoogleDocs/'
alias getcomposer='curl -s http://getcomposer.org/installer | php'
alias whereisraspberrypi="sudo nmap -sV --open 192.168.1.0/25 -p22 | grep 'raspberry'"

# add alias to get latest version of mongo cheatsheet
 alias mongocheat='curl -s http://cheat.errtheblog.com/s/mongo | groovy -e "@Grab(group=/net.sourceforge.nekohtml/, module=/nekohtml/, version=/1.9.14/)import org.cyberneko.html.parsers.SAXParser;println new XmlSlurper(new SAXParser()).parseText(System.in.text).depthFirst().find{ it.@class == /sheet/}.text()"'

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

HISTSIZE=10000
HISTFILESIZE=10000

# fortune /usr/share/games/fortunes/fr/tolkien_fr

export HISTTIMEFORMAT="%d/%m/%y %T "
#export HISTTIMEFORMAT="%h/%d – %H:%M:%S "
export PATH=$PATH:$GOBIN

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
#PS1="\[\033[01;31m\][\u@\h\[\033[00m\]:\[\033[01;34m\]\w]\[\033[00m\]\$ "

# colorized man, needs to isntall most
export PAGER=most

# Node.js
export PATH=$HOME/local/bin:$PATH
# Android
export PATH=/home/ronan/Bin/android-sdk-linux_x86/tools:${PATH}
export PATH=/home/ronan/Bin/android-sdk-linux_x86/platform-tools:${PATH}

# usage : genpasswd 8
genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=20
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}



