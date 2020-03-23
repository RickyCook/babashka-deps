function vim() {
    requires vim_installed
    requires vim_rc
    requires vim_plugins_installed
}
function vim_installed() {
    install_package vim
    process
}
function vim_rc() {
    file_linked ~/.vimrc
    process
}
function vim_plugins_installed() {
    function is_met() {
        [ -d ~/.vim/plugged ]
    }
    function meet() {
        /usr/local/bin/vim --not-a-term -c 'PlugInstall | qa!'
    }
    process
}
