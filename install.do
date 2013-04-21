exec >&2
redo-ifchange _all

DESTDIR="${HOME}/lib/github.com/nrr/dotfiles"
TAG="$(date -u +%Y%m%d%H%M%S)"

mkdir -p "${DESTDIR}"/HEAD-"${TAG}"
rsync -rPv ./. "${DESTDIR}"/HEAD-"${TAG}"/.

(
	cd "${DESTDIR}"
	[ -L previous ] && rm -f previous
	[ -L current ] && mv -f current previous
	ln -s "HEAD-${TAG}" current
)

(
	cd "${HOME}"
	ln -sf /dev/null .mysql_history
	ln -sf /dev/null .psql_history
	ln -sf /dev/null .sqlite_history
	ln -sf "${DESTDIR}"/current/src/.ssh/config "${HOME}"/.ssh/config
	ln -sf "${DESTDIR}"/current/src/.tmux.conf "${HOME}"/.tmux.conf
)

