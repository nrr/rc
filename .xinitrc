add_to_fontpath() {
	addition="${1:-}"
	[ -n "${addition}" ] || return 110

	separator=","
	[ -z "${fontpath}" ] && separator=""
	fontpath="${fontpath}${separator}${addition}"
}

merge_in_resources() {
	resources="${1:-}"
	[ -n "${resources}" ] || return 110

	maybe_no_cpp="-nocpp"

	if [ -f "${resources}" ]
	then
		[ -x /usr/bin/cpp ] && maybe_no_cpp=""
		xrdb "${maybe_no_cpp}" -merge "${resources}"
	fi      

}

export USERWM=$(which ratpoison)
export USERWM=$(which xquartz)

for p in /opt/X11 /usr/X11
do
	if [ -d $p ]
	then
		X11="${path}"
		break
	fi
done

userresources=$HOME/.Xresources
sysresources=$X11/lib/X11/xinit/.Xresources

for r in "$sys_resources" "$user_resources"
do
	merge_in_resources "$r"
done

if [ -x $X11/bin/xset ]
then
	add_to_fontpath "$X11/lib/X11/fonts/misc/"
	add_to_fontpath "$X11/lib/X11/fonts/TTF/"
	add_to_fontpath "$X11/lib/X11/fonts/OTF/"
	add_to_fontpath "$X11/lib/X11/fonts/Type1/"
	add_to_fontpath "$X11/lib/X11/fonts/75dpi/:unscaled"
	add_to_fontpath "$X11/lib/X11/fonts/100dpi/:unscaled"
	add_to_fontpath "$X11/lib/X11/fonts/75dpi/"
	add_to_fontpath "$X11/lib/X11/fonts/100dpi/"

	[ -e "$HOME"/.fonts/fonts.dir ] && add_to_fontpath "$HOME/.fonts"
	[ -e "$HOME"/Library/Fonts/fonts.dir ] && add_to_fontpath "$HOME/Library/Fonts"
	[ -e /Library/Fonts/fonts.dir ] && add_to_fontpath "/Library/Fonts"
	[ -e /System/Library/Fonts/fonts.dir ] && add_to_fontpath "/System/Library/Fonts"

	xset fp= "${fontpath}"
	unset fontpath
fi

exec $USERWM
