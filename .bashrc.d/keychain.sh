KEYCHAIN=$(which keychain)

if [ -d $HOME/j/sciolist ]
then
	export PATH=$HOME/j/sciolist/bin:$PATH
fi

if [ -x "$KEYCHAIN" ]
then
	eval $("$KEYCHAIN" --eval)

	for key in ~/.ssh/id_rsa $(find -L ~/.ssh/keys '(' -type f -o -type l ')' -iname 'id_rsa')
	do
		askpass_script=$(mktemp /tmp/askpass.XXXXXX)
		chmod +x "$askpass_script"
		cat <<EOF >"$askpass_script"
#! /usr/bin/env bash
s6t ssh-askpass "$key"
EOF

		env DISPLAY= SSH_ASKPASS="$askpass_script" ssh-add $key </dev/null &>/dev/null

		rm "$askpass_script"
	done
fi
