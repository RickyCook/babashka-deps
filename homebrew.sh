function homebrew() {
    requires homebrew_installed
    requires homebrew_cask_installed
}
function homebrew_installed() {
    function is_met() {
        bin_installed brew
    }
    function meet() {
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    }
    process
}
function homebrew_cask_installed() {
    install_package cask
    install_package brew-cask-completion
    process
}
function homebrew_up_to_date() {
    updated_file=~/.babashka/.updated_homebrew_ts

    function is_met() {
        if [[ "$(uname -s)" == 'Darwin' ]]; then
            tsmin="$(date -v -1d +%s)"
        else
            tsmin="$(-d '1 day ago' +%s)"
        fi
        if [[ -f "$updated_file" ]]; then
            tslast="$(cat "$updated_file")"
        else
            tslast=0
        fi

        [ $tslast -gt $tsmin ]
    }
    function meet() {
        brew update
        echo "$(date +%s)" > "$updated_file"
    }

    process
}
