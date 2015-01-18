$HOME/bin/keyboard &
xrdb -load $HOME/.Xdefaults &
/opt/pixelclock/embedded/bin/pixelclock 23:00 05:30 &

exec ratpoison
