# $HOME/.bashrc.d/set-command-prompt.sh
# Set the command prompt.

prompt_prepend=""
case "$TERM" in
	*xterm*)
		prompt_prepend="\[\033]0;\u@\h:\w\007\]"
		;;
	*)
		# Do nothing.
		;;
esac

export PS1="${prompt_prepend}\h\\$ "

# Local Variables:
# mode:shell-script
# End:
