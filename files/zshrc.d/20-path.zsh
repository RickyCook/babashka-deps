PATH=""

while read dir; do
    [ -d "$dir" ] && PATH="$PATH:$dir"
done <<END
    ~/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    /usr/local/bin
    /usr/local/sbin
END

# Don't check for existance
PATH="$PATH:node_modules/.bin"

export PATH
export GOPATH=~/.go
