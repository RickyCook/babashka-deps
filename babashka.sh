function babashka() {
    requires babashka_linked
}

function babashka_linked() {
    file_linked "$HOME/bin/babashka" "$HOME/.babashka/src/bin/babashka"
    process
}
