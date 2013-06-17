PATH=$(PATH=/bin:/usr/bin getconf PATH)
export PATH

if [ -f /etc/bashrc ]
then
        source /etc/bashrc
fi

