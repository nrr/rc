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
