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
