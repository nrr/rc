exec >&2
redo-ifchange _all

(
	cd "${HOME}"
	ln -sf /dev/null .mysql_history
	ln -sf /dev/null .psql_history
	ln -sf /dev/null .sqlite_history
	ln -sf "${DESTDIR}"/current/src/.ssh/config "${HOME}"/.ssh/config
	ln -sf "${DESTDIR}"/current/src/.tmux.conf "${HOME}"/.tmux.conf
)

