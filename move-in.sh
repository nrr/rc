#!/bin/sh
#
# General dotfiles.
#
# See the README for usage.
#

TD=`mktemp -d XXXXXXX`
REPO_OWNER="nrr"
REPO_NAME="dotfiles"

pull_files_from_git() {
	# This relies on TD above.

	repo_host="github.com"
	repo_path="${REPO_OWNER}/${REPO_NAME}"
	archive_path="tarball/master"
	url="https://${repo_host}/${repo_path}/${archive_path}"

	curl ${CURL_OPTS-""} -LsSf $url | tar -C $TD -xvzf -
}

install_into_HOME() {
	# This relies on TD above.

	cp -Rf $TD/$REPO_NAME-*/src/.???* $HOME/
	rm -rf $TD
}

pull_files_from_git
install_into_HOME
