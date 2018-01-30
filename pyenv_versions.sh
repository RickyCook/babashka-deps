PYTHON_VERSIONS=(
    3.6.2
    3.5.1
    3.4.3
)
function pyenv_versions() {
    for version in "${PYTHON_VERSIONS[@]}"; do
        requires "pyenv_$(safe_name "$version")_installed"
    done
}

function pyenv_version_safe() {
    echo "$1" | sed 's/[^a-zA-Z0-9_-]/_/g'
}
function pyenv_version() {
    version="$1"
    function is_met() {
        [ -d "$HOME/.pyenv/versions/$version" ]
    }
    function meet() {
        pyenv install "$version"
    }
}


for version in "${PYTHON_VERSIONS[@]}"; do
    eval "
        function pyenv_$(safe_name "$version")_installed() {
            pyenv_version "$version"
            process
        }
    "
done
