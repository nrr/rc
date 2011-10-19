# $HOME/.bashrc.d/golang.sh
# Go language support

case `uname -s` in
	*Linux*)
		export GOOS="linux"
		;;
	*FreeBSD*)
		export GOOS="freebsd"
		;;
	*Darwin*)
		export GOOS="darwin"
		;;
	*)
		# Do nothing.
		;;
esac

case `uname -m` in
	*x86_64* | \
	*amd64*)
		export GOARCH="amd64"
		;;
	*i*86*)
		export GOARCH="386"
		;;
	*)
		# Do nothing.
		;;
esac

if [ -n "$GOARCH" -a -n "$GOOS" ]
then
	export GOROOT=$HOME/opt/go/current
	export GOBIN=$GOROOT/bin
	export PATH=$GOBIN:$PATH
fi

# Local Variables:
# mode:shell-script
# End:
