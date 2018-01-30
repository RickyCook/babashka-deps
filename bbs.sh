BBS_REPOS=(
    core-infra
    crissp-extractor
    dutyofcare
    dutyofcare-website
    ggv-forms
    ico
    kitchen-sync
    kubernetes-vault-wrapper
    status
)

function bbs() {
    requires code_dir
    requires bbs_repos_cloned
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
function bbs_repos_cloned() {
    for repo in "${BBS_REPOS[@]}"; do
        requires "bbs_${repo}_cloned"
    done
}

for repo in "${BBS_REPOS[@]}"; do
    eval "
        function bbs_${repo}_cloned() {
            bbs_clone_repo "$repo"
            process
        }
    "
done
