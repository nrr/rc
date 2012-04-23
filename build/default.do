mkdir -p $(dirname $1)
redo-ifchange ../src/$1
cat ../src/$1 > $3
