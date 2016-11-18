function git() {
    requires git_installed
}
function git_installed() {
    install_package git
    process
}
