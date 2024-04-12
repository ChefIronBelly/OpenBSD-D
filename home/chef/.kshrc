#!/bin/sh
# ~/.kshrc
#

# use vim if it's installed, vi otherwise
case "$(command -v nvim)" in
  */vim) VIM=nvim ;;
  *)     VIM=vi  ;;
esac

export EDITOR=$VIM
export FCEDIT=$EDITOR
export PAGER=less
export LESS='-iMRS -x2'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
HISTFILE=$HOME/.ksh_history
HISTSIZE=20000

#### SAFETY ####

alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'

# use colorls if it's installed, plain old ls otherwise
if command -v colorls > /dev/null ; then
  LS='colorls'
else
  LS='ls'
fi
alias ls="$LS -FHh"
alias ll='ls -l'
alias la='ls -lA'
alias ..='cd ..'
alias ...='cd ...'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -ch'
alias weather='curl http://wttr.in/Detroit'
alias md='mkdir -p -v'
alias rd='rmdir -v'
alias h='fc -l'
alias p='pwd'
alias manb='man -H'
#alias grep='grep --color=auto'
#alias curl='curl -C - -LO'
alias add='doas pkg_add'
alias del='doas pkg_delete'
alias upd='doas pkg_add -Uu'
#alias upg='doas pkg upgrade'
alias search='doas pkg_info -Q'
alias clean='doas pkg_delete -a'
alias syupg='doas syspatch'
#alias freeupg='doas freebsd-update install'

# REBOOT/SHUTDOWN
alias reboot='doas reboot'
alias poweroff='doas poweroff'
alias shutdown='doas shutdown -ph now'

# Space on drive
alias disk='du -h | sort -n -r |more'

alias preview='feh -g 450x300+500+200 -R .01 --zoom fill'
#alias rec='ffmpeg -f x11grab -s 1280x800 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'
alias rec='ffmpeg -f x11grab -s 1920x1080 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'
alias info='info.sh'
alias todo='nvim ~/todo'
alias zzz='doas acpiconf -s 3'
alias shootme='DISPLAY=:0 import -window root ~/Pictures/scrots/scrot-$(date +%m-%d-%Y-%H-%M-%S).png'
alias free='top -n 1 | head -n 5 | tail -n 2'
alias ping='ping -c3'
alias mc='mc -a'
alias g='git'
alias gc='git commit -m "adds and tweaks"'
alias umount='doas umount /mnt/$1'
alias view='imlib2_view'
alias grab='imlib2_grab'
alias stime='doas ntpd -dnq -p pool.ntp.org'
#suspalias rnet='doas /etc/init.d/networking restart'
alias mp3='youtube-dl -x --embed-thumbnail --audio-format mp3'

PS1=""
 case `id -u` in
 	0) PS1="${PS1}# ";;
 	*) PS1="${PS1}$ ";;
 esac

#paleta -r

#doas() {
#    su -c "$*"
#}
