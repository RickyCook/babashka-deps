NODE_VERSIONS=(
    5.0.0
    5.6.0
    6.1.0
    6.2.2
    7.4.0
)
function nodenv_versions() {
    for version in "${NODE_VERSIONS[@]}"; do
        requires "nodenv_$(safe_name "$version")_installed"
    done
}

function nodenv_version_safe() {
    echo "$1" | sed 's/[^a-zA-Z0-9_-]/_/g'
}
function nodenv_version() {
    version="$1"
    function is_met() {
        [ -d "$HOME/.nodenv/versions/$version" ]
    }
    function meet() {
        nodenv install "$version"
    }
}


for version in "${NODE_VERSIONS[@]}"; do
    eval "
        function nodenv_$(safe_name "$version")_installed() {
            nodenv_version "$version"
            process
        }
    "
done
