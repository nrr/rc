##
# the PATH
#
PATH="$(PATH=/bin:/usr/bin:/sbin:/usr/sbin getconf PATH)"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$HOME/bin:$PATH"
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
while false; do
	if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
		. $HOME/.nix-profile/etc/profile.d/nix.sh
	fi
done

##
# aliases
#
alias sl='ls' # because I tend to typo this one stupidly often
alias ls='ls -shF'

##
# sundry environment variables
#
EDITOR=ed

if which emacsclient >/dev/null; then
	VISUAL=emacsclient
	unset FCEDIT
else
	VISUAL=vi
fi

VERSION_CONTROL="numbered"
GIT_TEMPLATE_DIR="$HOME/.git_template"

export GIT_TEMPLATE_DIR VERSION_CONTROL EDITOR VISUAL

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
