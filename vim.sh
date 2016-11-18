function vim() {
    requires vim_installed
    requires vim_rc
}
function vim_installed() {
    install_package vim
    process
    install_package macvim
    process
}
function vim_rc() {
    file_linked ~/.vimrc
    process
}
