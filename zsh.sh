function zsh() {
    requires zsh_installed
    requires zsh_syntax_installed
    requires zsh_rc
    requires zsh_theme
}
function zsh_installed() {
    install_package zsh
    process
}
function zsh_syntax_installed() {
    install_package zsh-syntax-highlighting
    process
}
function zsh_rc() {
    file_linked ~/.zshrc
    process
}
function zsh_theme() {
    file_linked ~/.oh-my-zsh/custom/themes/kphoen-thatpanda.zsh-theme
    process
}
