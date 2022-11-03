# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM
export PKG_PATH="https://cdn.openbsd.org/%m/"

umask 027

if [ -n $SSH_AUTH_SOCK ]; then 
  ln -sf $SSH_AUTH_SOCK ~/.ssha
fi

if groups | grep -q wheel; then
  export PS1="$(hostname -s)# "
else
  export PS1="$(hostname -s)$ "
fi

set -o vi
if [ -f /usr/local/bin/vim ]; then
  alias vim="vim -i NONE"
  alias vi="vim -i NONE"
  export EDITOR="vim -i NONE"
else
  export EDITOR=vi
fi

if [ -x /usr/games/fortune ]; then
  echo ""
  /usr/games/fortune
fi

if [ -x /usr/games/pom ]; then
  echo ""
  /usr/games/pom
fi

echo ""
