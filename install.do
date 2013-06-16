exec >&2
redo-ifchange _all

DESTDIR="${HOME}/lib/github.com/nrr/rc-bash"
TAG="$(date -u +%Y%m%d%H%M%S)"

mkdir -p "${DESTDIR}"/HEAD-"${TAG}"
rsync -rPv ./. "${DESTDIR}"/HEAD-"${TAG}"/.

(
	cd "${DESTDIR}"
	[ -L previous ] && rm -f previous
	[ -L current ] && mv -f current previous
	ln -s "HEAD-${TAG}" current
)

