exec >&2
redo-ifchange _all

DESTDIR="${HOME}/lib/github.com/nrr/dotfiles"
TAG="$(date -u +%Y%m%d%H%M%S)"

mkdir -p "${DESTDIR}"
[ -d "HEAD-${TAG}" ] && rm -rf "HEAD-${TAG}"
git archive --format=tar --prefix="HEAD-${TAG}/" HEAD | tar -C "${DESTDIR}" -xf -
(
	cd "${DESTDIR}"
	[ -L previous ] && rm -f previous
	[ -L current ] && mv -f current previous
	ln -s "HEAD-${TAG}" current
)

