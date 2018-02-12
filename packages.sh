PACKAGES=(
    aria2
    automake
    diff-so-fancy
    httpie
    fzf
    gnupg
    jq
    libtool
    nmap
    packer
    parallel
    qt
    readline
    sassc
    socat
    sqlite
    the_silver_searcher
    tig
    tmux
    watch
    wireshark
    x264
    xhyve
    xz

    pyenv
    pyenv-virtualenv
    exenv
    nodenv
    rbenv
    rbenv-bundler
    autoenv

    erlang
    go
    rust

    libffi
    libgit2
)
function packages() {
    for package in "${PACKAGES[@]}"; do
        requires "${package}_installed"
    done
}

for package in "${PACKAGES[@]}"; do
    eval "
        function ${package}_installed() {
            install_package $package
            process
        }
    "
done
