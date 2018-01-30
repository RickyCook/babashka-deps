PATH=""

while read dir; do
    [ -d "$dir" ] && PATH="$PATH:$dir"
done <<END
    $HOME/bin
    $HOME/.local/bin
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

# OpenSSL fixes for homebrew
export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openssl/include"
export CFLAGS="$CFLAGS -I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig"
