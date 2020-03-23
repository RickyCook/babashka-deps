function casks() {
    requires fonts_tapped
    requires font_fira_code_installed
    requires docker_installed
    requires alfred_installed
    requires little_snitch_installed
    requires pdvorak_installed
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
function docker_installed() {
    cask_install docker
    process
}
function alfred_installed() {
    cask_install alfred
    process
}
function little_snitch_installed() {
    cask_install little-snitch
    process
}
function pdvorak_installed {
    cask_install programmer-dvorak
    process
}
