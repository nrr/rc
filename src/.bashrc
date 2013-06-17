PATH=$(PATH=/bin:/usr/bin getconf PATH)
export PATH

if [ -f /etc/bashrc ]
then
        source /etc/bashrc
fi

# $HOME/.bashrc.d/emacs.sh
# Emacs support

export PATH=/opt/emacs/current/bin:$PATH

# Local Variables:
# mode:shell-script
# End:
# $HOME/.bashrc.d/gnu.sh
# Set some GNU environment variables

VERSION_CONTROL="numbered"

export VERSION_CONTROL

# Local Variables:
# mode:shell-script
# End:

# $HOME/.bashrc.d/golang.sh
# Go language support

case `uname -s` in
	*Linux*)
		export GOHOSTOS="linux"
		;;
	*FreeBSD*)
		export GOHOSTOS="freebsd"
		;;
	*Darwin*)
		export GOHOSTOS="darwin"
		;;
	*)
		# Do nothing.
		;;
esac

case `uname -m` in
	*x86_64* | \
	*amd64*)
		export GOHOSTARCH="amd64"
		;;
	*i*86*)
		export GOHOSTARCH="386"
		;;
	*)
		# Do nothing.
		;;
esac

if [ -n "$GOHOSTARCH" -a -n "$GOHOSTOS" ]
then
	export GOROOT=$HOME/opt/go/current
	export GOBIN=$GOROOT/bin
	export PATH=$GOBIN:$PATH
fi

# Local Variables:
# mode:shell-script
# End:
# $HOME/.bashrc.d/java.sh
# Install the Java JDK environment.

PATH="${HOME}/opt/java/jdk/current/bin:${PATH}"

export PATH

# Local Variables:
# mode:shell-script
# End:

# $HOME/.bashrc.d/perlbrew.sh
# Install the perlbrew environment.

# env PERLBREW_ROOT=$HOME/.perlbrew perlbrew init

PERLBREW_ROOT=$HOME/.perlbrew

[[ -s "$HOME/.perlbrew/etc/bashrc" ]] && source "$HOME/.perlbrew/etc/bashrc"

export PERLBREW_ROOT

# Local Variables:
# mode:shell-script
# End:

export PERL_LOCAL_LIB_ROOT="$HOME/perl5";
export PERL_MB_OPT="--install_base $HOME/perl5";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";
export PERL5LIB="$HOME/perl5/lib/perl5/x86_64-linux-thread-multi:$HOME/perl5/lib/perl5";
export PATH="$HOME/perl5/bin:$PATH";
# $HOME/.bashrc.d/pkgsrc.sh
# Support for NetBSD's pkgsrc package collection

if [ -d /usr/pkgsrc ]
then
	PATH=$PATH:/usr/pkg/bin:/usr/pkg/sbin
	MANPATH=$MANPATH:/usr/pkg/man
fi

export PATH MANPATH

# Local Variables:
# mode:shell-script
# End:
# $HOME/.bashrc.d/plan9port.sh
# Support for Plan 9 from User Space

PLAN9=$HOME/opt/plan9port/current export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

# Local Variables:
# mode:shell-script
# End:
# $HOME/.bashrc.d/pythonbrew.sh
# Install the pythonbrew environment.

[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# Local Variables:
# mode:shell-script
# End:

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
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

export PS1="${prompt_prepend}(\$?)${color_prepend}\h${color_append}\\$ "

unset prompt_prepend

# Local Variables:
# mode:shell-script
# End:
# $HOME/.bashrc.d/zy-usr-local-bin.sh.sh
# Add /usr/local/bin and friends to the $PATH.

PATH="/usr/local/bin:${PATH}"

export PATH

# Local Variables:
# mode:shell-script
# End:
# $HOME/.bashrc.d/zz-home-bin.sh
# Stash utilities in $HOME/bin

PATH="${HOME}/bin:${PATH}"

export PATH

# Local Variables:
# mode:shell-script
# End:

