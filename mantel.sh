function mantel() {
    requires code_dir
}
function code_dir() {
    function is_met() {
        [ -d ~/code ]
    }
    function meet() {
        mkdir -p ~/code
    }
    process
}
