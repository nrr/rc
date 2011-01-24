#!/bin/sh
#
# Download the bash environment from fossil.moyi.us and install them to $HOME.
#
# Usage: curl -LsSf http://fossil.moyi.us/nrr-dotfiles-bash-environment/doc/trunk/move-in.sh | sh -
#

TD=`mktemp -d XXXXXXX`
REPO_NAME="nrr-dotfiles-bash-environment"

maybe_create_ssh_directory() {
	if [ ! -d $HOME/.ssh ]
	then
		mkdir $HOME/.ssh
		chmod u=rwx,og-rwx $HOME/.ssh
	fi
}

kill_bash_history() {
	ln -svf /dev/null $HOME/.bash_history
}

pull_files_from_fossil() {
	# This relies on TD above.

	repo_host="fossil.moyi.us"
	repo_name=${REPO_NAME}
	repo_path="/zip/${repo_name}-tip.zip?uuid=tip"
	url="http://${repo_host}/${repo_name}/zip/${repo_name}-tip.zip?uuid=tip"

	curl -LsSf $url > $TD/${repo_name}-tip.zip

	pushd $TD
	unzip nrr-dotfiles-bash-environment-tip.zip
	popd
}

install_into_HOME() {
	# This relies on TD above.

	pushd $TD/$REPO_NAME-tip/src
	for f in dot.*
	do
		mv -nv $f $HOME/${f#dot}
	done
	popd
}

pull_files_from_fossil
install_into_HOME
maybe_create_ssh_directory
kill_bash_history
