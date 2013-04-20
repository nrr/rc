DEPS="config.d/individual-hosts/*.ssh_config config.d/wildcards/*.ssh_config config.d/default"
redo-ifchange $DEPS
cat $DEPS > $3
