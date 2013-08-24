# dotfiles from a curmudgeon

this is part of a series.

## what is this?

these are my customizations for the various tools that i use on a
regular basis, with some exceptions like bash and the plan 9 tools. you
can find those customizations elsewhere.

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

this is vaguely how i install an archive from github:

	DIR="${HOME}/lib/github.com/nrr/dotfiles"
	URL="https://api.github.com/repos/nrr/dotfiles/tarball"
	ARCHIVE="${DIR}/nrr-dotfiles-master.tar.gz"
	
	mkdir -p "${DIR}"
	curl -LsSf "${URL}" > "${ARCHIVE}"
	rm -rf /tmp/nrr-dotfiles*
	tar -C /tmp -axvf "${ARCHIVE}"
	cd /tmp/nrr-dotfiles*
	redo install
	
this is vaguely how i clone the repository for working on it:

	WORKSPACE="${HOME}/w/git/github.com/nrr/dotfiles"
	REMOTE="git@github.com:nrr/dotfiles"
	mkdir -p "${WORKSPACE}"
	git clone "${REMOTE}" "${WORKSPACE}"

this is vaguely how i install an archive from my local working copy:

	WORKSPACE="${HOME}/w/git/github.com/nrr/dotfiles"
	cd "${WORKSPACE}"
	redo install

this is how i link these things as my actual dotfiles in `$HOME`:

	redo link

## things to come

i want to keep fleshing this out as much as i can.

### get rid of the sourcery

i hope to make some of the actual development work for this suck less
since, well, it's kinda terrible at the moment. one thought is to do the
following:

    git clone --no-checkout github.com:nrr/rc.git
    git config core.worktree="../../"
    git checkout master

this has a number of benefits, namely

* changes to dotfiles are known to git without any sort of extra
  sourcery
* new files become known to git when they're created, again without any
  extra sourcery
* my home directory will itself not be a git repository, but it will
  nonetheless be versioned

### abuse git subtree

i do actually dislike the multi-repository madness that i have going on
between `rc`, `rc-bash`, and `rc-plan9`, but i also prefer it to having
everything under one giant repository.

at some point, i'd like to look at abusing `git subtree` to this end and
seeing what sort of extra sourcery it'll require to get to a workable
state.

