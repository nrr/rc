##
# start off on a good PATH
#
PATH="$(PATH=/bin:/usr/bin:/sbin:/usr/sbin getconf PATH)"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

##
# the system bashrc
#
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

##
# the nix package manager
#
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

##
# aliases
#
alias cd='cd -P'
alias sl='ls' # because I tend to typo this one stupidly often
alias ls='ls -shF'

##
# sundry environment variables
#
EDITOR=ed
VISUAL=vi
ALTERNATE_EDITOR=""
unset FCEDIT

if command -v emacsclient >/dev/null; then
    EDITOR=emacsclient
fi

VERSION_CONTROL="numbered"

export VERSION_CONTROL EDITOR VISUAL ALTERNATE_EDITOR

##
# fasd
#
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

##
# rbenv
#
if [ -d "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if command -v rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

##
# keychain
#
if command -v keychain >/dev/null; then
    eval "$(keychain --agents gpg,ssh --eval)"
fi

##
# shell prompt
#
prompt_prepend=""
color_prepend=""
color_append=""

case "$TERM" in
    *xterm*|*screen*)
        prompt_prepend="\[\033]0;[\u@\h T\l L$SHLVL C\!] \w\007\]"
        color_prepend="\[\033[1;37;44m\]"
        color_append="\[\033[0m\]"
        ;;
    *)
        # Do nothing.
        ;;
esac

export PS1="${prompt_prepend}(\$?)${color_prepend}\h${color_append}\\$ "

unset prompt_prepend

# Local Variables:
# mode:shell-script
# End:
