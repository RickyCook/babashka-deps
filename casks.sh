function casks() {
    requires fonts_tapped
    requires font_fira_code_installed
}
function fonts_tapped() {
    brew_tapped homebrew/cask-fonts
    process
}
function font_fira_code_installed() {
    cask_install font-firacode-nerd-font
    process
    cask_install font-firacode-nerd-font-mono
    process
}
