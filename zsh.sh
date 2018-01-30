function zsh() {
    requires zsh_installed
    requires zsh_syntax_installed
    requires oh_my_zsh_installed
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
function oh_my_zsh_installed() {
    function is_met() {
        [[ -d ~/.oh-my-zsh ]]
    }
    function meet() {
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    }
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
