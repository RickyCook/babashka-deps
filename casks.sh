function casks() {
    requires cask_installed
    requires font_fira_code_installed
}
function cask_installed() {
    brew_tapped cask
    process
}
function font_fira_code_installed {
    cask_installed caskroom/fonts/font-firacode-nerd-font
    process
    cask_installed caskroom/fonts/font-firacode-nerd-font-mono
    process
}
