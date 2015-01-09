EDITOR=ed

# Plan 9's acme
if which E >/dev/null
then
	VISUAL=E
	unset FCEDIT
else
	VISUAL=vi
fi

export EDITOR VISUAL
