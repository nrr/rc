WORKSPACE="$HOME/w/git/chromium.googlesource.com"
DEPOT_TOOLS_ROOT="$WORKSPACE/chromium/tools/depot_tools"

if [ -e "$DEPOT_TOOLS_ROOT"/git-map-branches ]
then
	export PATH="$PATH":"$DEPOT_TOOLS_ROOT"
fi
