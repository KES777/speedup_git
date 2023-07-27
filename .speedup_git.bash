# Adjust your ./ssh/config to set up your remote editing
# host <host_alias>
#   user <user>
#   hostname <host or ip>
#   PreferredAuthentications publickey
#   port 22
#   Identityfile ~/.ssh/id
#   RemoteForward 52697 127.0.0.1:52698

if [ -z "$SSH_CLIENT" ]; then
	export EDITOR="code"
else
    export EDITOR_NOLINE=1
	export EDITOR="rsub --port 52697"
	export RMATE_PORT="52697"
fi

PSQL_EDITOR="$EDITOR -w"


_absolute(){ for arg in "$@"; do echo -n " $(pwd)/$arg"; done; }
alias SE='eval `make setenv`'

alias gn="git-number"
alias gh="gn follow"
alias gb="gn -c git blame"
# TODO: pass line parameter
alias ge="gn -c $EDITOR"
alias ga="gn add"
alias gr="gn -c git reset HEAD"
alias gap="GIT_EDITOR='$EDITOR -w' gn add -p"
alias gd="gn diff -b -w --ignore-blank-lines"
alias gdc="gn diff -b -w --ignore-blank-lines --color-words='\"[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+\"'"
alias gds="gd --staged"
# TODO: apply --autostash
# This is useful when you want to save part of current changes as branch and then switch back
alias gc="gn checkout"
alias gcf="git flow feature checkout"
# --full-history -- do not miss empty commits
# 'f(){ echo before "$@" after;  unset -f f; }; f'
alias gl='f(){ gn log -w -b -p --ignore-blank-lines --full-history $@; unset -f f; }; f'
alias glc="gl --color-words='\"[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+\"'"
alias gls="gl --stat"
alias cm="GIT_EDITOR='$EDITOR -w' git commit"
alias ca="GIT_EDITOR='$EDITOR -w' git commit --amend"
alias grb="GIT_EDITOR='$EDITOR -w' git rebase -v --autostash --rebase-merges -i"
alias grbc="GIT_EDITOR='$EDITOR -w' git rebase --continue"

# git fetch required to not lose changes on remote branch
# We can not do `git fetch origin` because origin may not exists
# https://habr.com/company/mailru/blog/318508/
alias gpf="git push --force-with-lease"

source ~/.git-completion.bash
# source <(kubectl completion bash)
__git_complete gn   _git
__git_complete ga   _git_add
__git_complete gap  _git_add
__git_complete gd   _git_diff
__git_complete gdc  _git_diff
__git_complete gds  _git_diff
__git_complete gc   _git_checkout
__git_complete gl   _git_log
__git_complete gh   _git_log
__git_complete glc  _git_log
__git_complete gls  _git_log
__git_complete cm   _git_commit
__git_complete ca   _git_commit
__git_complete grb  _git_rebase
__git_complete grbc _git_rebase


# TODO: We need to update autocompletion script, because 'gpf' alias does not work correct:
# kes@work ~/t $ git push --force TABTAB
# amazon   xcp

# kes@work ~/t $ git push --force xcp TABTAB
# amazon/country_schema                            cp_app
# amazon/create_schema                             v3.0.0-test
# amazon/Makefile                                  xcp/convertor_example
# amazon/openapi3                                  xcp/country_schema
# amazon/cp_app                                    xcp/deploy_project
# amazon/xproject                                  xcp/dev_hypermouse
# base_point                                       xcp/dev_hypermouse_andr_6
# convertor_example                                xcp/dev_hypermouse_mtemporal_update_old_way
# country_schema                                   xcp/dev_hypermouse_mtemporal_update_rotated
# create_schema                                    xcp/dev_melnik13
# dev_hypermouse                                   xcp/dev_melnik13_v2
# FETCH_HEAD                                       xcp/dev_melnik13_v3
# HEAD                                             xcp/gh-pages
# Makefile                                         xcp/openapi3
# openapi3                                         xcp/stables
# openapi3.back                                    xcp/v1.0.0-alpha
# ORIG_HEAD                                        xxx

# kes@work ~/t $ git push --force xcp openapi3^C
# kes@work ~/t $ gpf TABTAB
# amazon   xcp

# kes@work ~/t $ gpf amazon TABTAB
# amazon   xcp
__git_complete gpf _git_push


# Make complition works for git alias: _git_<alias_name>
_git_grb(){
	_git_rebase
}
_git_reauthor(){
  _git_diff
}


# change directory to parent bypassing symlinks.
alias cdf='cd $(pwd -P); echo "Leaving: $(basename $PWD)"; cd ..'

# change directory by number
gcd() {
    gn -c test -d "$(git list $1)" && cd $(git list $1)  || test -f "$(git list $1)" && cd $(dirname $(git list $1))
}
