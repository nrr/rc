# $HOME/.bashrc.d/perlbrew.sh
# Install the perlbrew environment.

# env PERLBREW_ROOT=$HOME/.perlbrew perlbrew init

PERLBREW_ROOT=$HOME/.perlbrew

[[ -s "$HOME/.perlbrew/etc/bashrc" ]] && source "$HOME/.perlbrew/etc/bashrc"

export PERLBREW_ROOT

# Local Variables:
# mode:shell-script
# End:

