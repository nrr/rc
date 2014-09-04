# Plan 9's sam/acme
if which E
then
	EDITOR=E
	unset FCEDIT VISUAL
else
	EDITOR=vi
fi
export EDITOR

