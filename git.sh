function git() {
    requires git_installed
    requires git_configured
}
function git_installed() {
    install_package git
    process
}
function git_configured() {
    file_linked ~/.gitconfig
    process
}
