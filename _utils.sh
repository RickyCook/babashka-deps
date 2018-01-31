export BABASHKA_DIR="$(cd "$(dirname "$0")"; pwd)/../.."
source "$BABASHKA_DIR/src/deps/package.sh"

function bin_installed() {
    which "$1" > /dev/null
}

function file_linked() {
    link_target="$1"
    if [[ -n "$2" ]]; then
        if [[ "${2:0:1}" == '/' ]]; then
            link_source="$2"
        else
            link_source="$HOME/.babashka/deps/files/$2"
        fi
    else
        link_source="$HOME/.babashka/deps/files/$(basename $1)"
    fi
    function is_met() {
        [ -L "$link_target" ]
        [ "$(readlink "$link_target")" == "$link_source" ]
    }
    function meet() {
        rm -f "$link_target"
        mkdir -p "$(dirname "$link_target")"
        ln -s "$link_source" "$link_target"
    }
}

function brew_tapped() {
    cask="$1"
    function is_met() {
        brew tap | grep -e "^$cask\$"
    }
    function meet() {
        brew tap "$cask"
    }
}
function cask_installed()  {
    full_package="$1"
    lite_package="$(basename "$full_package" .git)"
    function is_met() {
        brew cask list | grep -e "^$lite_package\$"
    }
    function meet() {
        brew cask install "$full_package"
    }
}
function clone_repo() {
    repo="$1"
    if [[ -z "$2" ]]; then
        repo_dir="$(basename "$repo" .git)"
    else
        repo_dir="$2"
    fi

    function is_met() {
        [ -d "$HOME/code/$repo_dir" ]
    }
    function meet() {
        /usr/local/bin/git clone "$repo" "$HOME/code/$repo_dir"
    }
}
function github_clone_repo() {
    clone_repo "git+ssh://git@github.com/$1.git" "$2"
}
function bbs_clone_repo() {
    github_clone_repo "BlueBikeSolutions/$1" "$2"
}

function safe_name() {
    echo "$1" | sed 's/[^a-zA-Z0-9_-]/_/g'
}
