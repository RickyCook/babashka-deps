function spacemacs() {
    requires emacs_installed
    requires spacemacs_installed
}
function emacs_installed() {
    requires emacs_plus_tapped
    requires emacs_plus_installed
    requires emacs_plus_linked
}
function emacs_plus_tapped() {
    brew_tapped d12frosted/emacs-plus
    process
}
function emacs_plus_installed() {
    install_package emacs-plus
    process
}
function emacs_plus_linked() {
  function is_met() {
      readlink /Applications/Emacs.app | grep '/emacs-plus/'
  }
  function meet() {
      info="$(brew info --json emacs-plus)"
      cellar="$(echo "$info" | jq -r '.[0].bottle.stable.cellar')"
      linked="$(echo "$info" | jq -r '.[0].linked_keg')"
      ln -s "$cellar/emacs-plus/$linked/Emacs.app" /Applications
  }
  process
}
function spacemacs_installed() {
    function is_met() {
        [[ -d ~/.emacs.d ]]
    }
    function meet() {
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    }
    process
}
