exec >&2
redo-ifchange _all

: ${INSTALL:=install}
: ${DESTDIR:=}
: ${PREFIX:=$HOME}

echo "Installing to: $DESTDIR$PREFIX"

# make dirs
find ./build/. -type d -exec $INSTALL -d '{}' \;

# binaries
find ./build/. -type f -exec $INSTALL -m 0644 '{}'
