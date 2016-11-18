function syncthing() {
    requires syncthing_installed
    requires syncthing_inotify_installed
    requires qsyncthingtray_installed
}
function syncthing_installed() {
    install_package syncthing
    process
}
function syncthing_inotify_installed() {
    install_package syncthing-inotify
    process
}
function qsyncthingtray_installed() {
    function is_met() {
        brew cask list 2>/dev/null | grep -e '^qsyncthingtray$'
    }
    function meet() {
        brew cask install qsyncthingtray
    }
    process
}
