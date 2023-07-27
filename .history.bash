# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

# https://stackoverflow.com/a/19533853/4632019
# https://stackoverflow.com/a/19454838/4632019
# https://unix.stackexchange.com/a/18220/129967
# Also, you shouldn't preface HIST* commands with export —
# they are bash-only variables not environmental variables

# Be carefull with HISTSIZE=-1. It cause Bash v3 to take 100% CPU
HISTSIZE=-1
HISTFILESIZE=-1
HISTTIMEFORMAT="[%F %T] "

HISTFILE=~/.bash_history

HISTIGNORE='ls:bg:fg:history:history -w'


# https://unix.stackexchange.com/a/18443/129967
# don't put duplicate lines or lines starting with space in the history. See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
