PATH=$(PATH=/bin:/usr/bin getconf PATH)
export PATH

if [ -f /etc/bashrc ]
then
        source /etc/bashrc
fi

alias sl='ls' # because I tend to typo this one stupidly often
alias ls='ls -shF'
alias tqa='todo-add $TODOS_QUICKADD 0'

case $(uname -a) in
*Linux*)
	;;
*Darwin*)
	;;
*)
	;;
esac
