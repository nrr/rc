# dotfiles from a curmudgeon

this is part of a series.

## what is this?

these are my customizations for the various tools that i use on a
regular basis, with some exceptions like bash and emacs. you can find
those customizations elsewhere.

of note, i keep customizations for the following here in various
states of completeness:

*  irssi
*  tinyfugue
*  RPM build environment
*  SSH configuration
*  GNU Privacy Guard configuration
*  Bazaar configuration
*  CVS configuration
*  Git configuration
*  Mercurial configuration
*  tmux configuration
*  SQLite monitor configuration

## my method to the madness

this is how i install an archive from github:

	DIR="${HOME}/lib/github.com/nrr/dotfiles"
	URL="https://api.github.com/repos/nrr/dotfiles/tarball"
	ARCHIVE="${DIR}/nrr-dotfiles-master.tar.gz"
	
	mkdir -p "${DIR}"
	curl -LsSf "${URL}" > "${ARCHIVE}"
	rm -rf /tmp/nrr-dotfiles*
	tar -C /tmp -axvf "${ARCHIVE}"
	cd /tmp/nrr-dotfiles*
	redo install
	
this is how i clone the repository for working on it:

	WORKSPACE="${HOME}/w/git/github.com/nrr/dotfiles"
	REMOTE="git@github.com:nrr/dotfiles"
	mkdir -p "${WORKSPACE}"
	git clone "${REMOTE}" "${WORKSPACE}"

this is how i install an archive from my local working copy:

	WORKSPACE="${HOME}/w/git/github.com/nrr/dotfiles"
	cd "${WORKSPACE}"
	redo install

this is how i link these things as my actual dotfiles in `$HOME`:

	redo link

