if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

alias dc="docker compose"

export WINEARCH=win32
export PATH=$PATH:/usr/local/go/bin

export LANGUAGE=en
export LC_MESSAGES=en_US.UTF-8
#export LC_TIME=en_US.UTF-8


#export PERLDB_OPTS='RemotePort=keswork:9001'
#export PERL5DB='BEGIN { require "Devel/KillPrint.pm" }'
#export PERL5OPT='d:DebugHooks::Server'

#export PERL_MB_OPT="--install_base \"/home/kes/perl5\""
#export PERL_MM_OPT="INSTALL_BASE=/home/kes/perl5"
#export PERL5LIB='/home/kes/work/projects/perl_libs/lib:/home/kes/perl5/lib/perl5:${PERL5LIB}'
#export PATH=$HOME/perl5/perlbrew/bin:$PATH

if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
  source ~/perl5/perlbrew/etc/perlbrew-completion.bash
  alias pb="perlbrew"
  complete -F _perlbrew_compgen pb
fi


export LESS='-RFXSx5,9'
export TZ='America/Toronto'
export PGTZ='America/Toronto'

