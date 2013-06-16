exec >&2
redo-ifchange _all

DESTDIR="${HOME}/lib/github.com/nrr/rc-bash"

(
	cd "${HOME}"
	ln -sf /dev/null .bash_history
	ln -sf "${DESTDIR}"/current/src/.bash_logout "${HOME}"/.bash_logout
	ln -sf "${DESTDIR}"/current/src/.bash_history "${HOME}"/.bash_history
	ln -sf "${DESTDIR}"/current/src/.bash_profile "${HOME}"/.bash_profile
	ln -sf "${DESTDIR}"/current/src/.inputrc "${HOME}"/.inputrc
	ln -sf "${DESTDIR}"/current/src/.bash_login "${HOME}"/.bash_login
	ln -sf "${DESTDIR}"/current/src/.bashrc "${HOME}"/.bashrc
	ln -sf "${DESTDIR}"/current/src/.profile "${HOME}"/.profile
)

