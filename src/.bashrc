# $HOME/.bashrc
# Personal environment file for interactive bash subshells.

PATH=$(PATH=/bin:/usr/bin getconf PATH)
export PATH

if [ -f /etc/bashrc ]
then
	source /etc/bashrc
fi

for i in ${HOME}/.bashrc.d/*.sh
do
	if [ -r "$i" ]
	then
		if [ "$PS1" ]
		then
			source "$i"
		else
			source "$i" > /dev/null 2>&1
		fi
	fi
done
unset i

# Local Variables:
# mode:shell-script
# End:
