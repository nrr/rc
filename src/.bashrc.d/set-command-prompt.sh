# $HOME/.bashrc.d/set-command-prompt.sh
# Set the command prompt.

prompt_prepend=""
color_prepend=""
color_append=""

case "$TERM" in
	*xterm*| \
	*screen*)
		prompt_prepend="\[\033]0;[\u@\h T\l L$SHLVL C\!] \w\007\]"
		color_prepend="\[\033[1;37;44m\]"
		color_append="\[\033[0m\]"
		;;
	*)
		# Do nothing.
		;;
esac

export PS1="${prompt_prepend}${color_prepend}\h${color_append}\\$ "

unset prompt_prepend

# Local Variables:
# mode:shell-script
# End:
