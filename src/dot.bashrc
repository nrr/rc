# $HOME/.bashrc
# Personal environment file for interactive bash subshells.

for customization in ${HOME}/.bashrc.d/*
do
    if [ -f $customization -a -x $customization ]
    then
        source $customization
    fi
end

# Local Variables:
# mode:shell-script
# End:
