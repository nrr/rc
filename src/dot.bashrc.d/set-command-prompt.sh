# $HOME/.bashrc.d/set-command-prompt.sh
# Set the command prompt.

prompt_prepend=""

case "$TERM" in
	*xterm*| \
	*screen*)
		prompt_prepend="\[\033]0;[\u@\h T\l L$SHLVL C\!] \w\007\]"
		;;
	*)
		# Do nothing.
		;;
esac

export PS1="${prompt_prepend}\h\\$ "

unset prompt_prepend

# Local Variables:
# mode:shell-script
# End:
