#! /usr/bin/env bash
#
# General dotfiles.
#
# See the README for usage.
#

set -e
set -x

DIR="${HOME}/lib/github.com/nrr/dotfiles"
URL="https://api.github.com/repos/nrr/dotfiles/tarball"
ARCHIVE="${DIR}/nrr-dotfiles-master.tar.gz"

error()
{
    echo "$@" >&2
    exit 1
}

make_deployment_directory_tree()
{
    mkdir -p "${DIR}"
}

grab_archive()
{
    curl -LsSf "${URL}" > "${ARCHIVE}"
}

extract_archive_and_link_as_next()
{
    [ -f "${ARCHIVE}" ] || error "No archive!"

    local revision="$(tar tavf "${ARCHIVE}" | head -n 1 | perl -pe 's/.*([[:alnum:]]+).$/$1/g')"
    cd "${DIR}"
    tar axvf "${ARCHIVE}"
    mv "nrr-dotfiles-${revision}" "${revision}"
    ln -sf "${revision}" next
}

swing_symlinks()
{
    cd "${DIR}"
    unlink previous
    mv current previous
    mv next current
}

ensure_link() {
    local source=$1
    local target=$2

    ln -sf "${HOME}/${source}" "${HOME}/${target}"
}

ensure_absent() {
    local target=$1

    rm -f "${HOME}/${target}"
}

ensure_null_link()
{
    local target=$1

    ln -sf /dev/null "${HOME}/${target}"
}

create_links() {
    ensure_link "lib/github.com/nrr/dotfiles/current/.bazaar" ".bazaar"
    ensure_link "lib/github.com/nrr/dotfiles/current/.cvsrc" ".cvsrc"
    ensure_link "lib/github.com/nrr/dotfiles/current/.dzil" ".dzil"
    ensure_link "lib/github.com/nrr/dotfiles/current/.gitconfig" ".gitconfig"
    ensure_link "lib/github.com/nrr/dotfiles/current/.gnupg" ".gnupg"
    ensure_link "lib/github.com/nrr/dotfiles/current/.hgrc" ".hgrc"
    ensure_link "lib/github.com/nrr/dotfiles/current/.irbrc" ".irbrc"
    ensure_link "lib/github.com/nrr/dotfiles/current/.irssi" ".irssi"
    ensure_link "lib/github.com/nrr/dotfiles/current/.rpmmacros" ".rpmmacros"
    ensure_link "lib/github.com/nrr/dotfiles/current/.sqliterc" ".sqliterc"
    ensure_link "lib/github.com/nrr/dotfiles/current/.ssh" ".ssh"
    ensure_link "lib/github.com/nrr/dotfiles/current/.tfrc" ".tfrc"
    ensure_link "lib/github.com/nrr/dotfiles/current/.tfrc.d" ".tfrc.d"
    ensure_link "lib/github.com/nrr/dotfiles/current/.tmux.conf" ".tmux.conf"
    ensure_link "lib/github.com/nrr/dotfiles/current/.Xdefaults" ".Xdefaults"
    ensure_null_link ".bash_history"
}

move_in()
{
    grab_archive
    extract_archive_and_link_as_next
    create_links
}

is_subshell "$0" && move_in
