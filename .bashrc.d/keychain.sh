KEYCHAIN=$(which keychain)

if [ -x "$KEYCHAIN" ]
then
	eval $("$KEYCHAIN" --eval `find -L ~/.ssh/keys '(' -type f -o -type l ')' -iname 'id_rsa'` ~/.ssh/id_rsa)
fi
