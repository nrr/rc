DEPS=".bashrc.d/*.sh"
redo-ifchange $DEPS
cat $DEPS > $3