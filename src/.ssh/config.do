DEPS="config.d/*.ssh_config"
redo-ifchange $DEPS
cat $DEPS > $3
