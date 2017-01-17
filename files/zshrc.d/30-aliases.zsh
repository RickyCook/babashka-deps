alias sshu="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scpu="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias gdone='GDONEWITH=$(git rev-parse --abbrev-ref HEAD); GDEFAULTBR=$(git name-rev --name-only $(git rev-parse origin/HEAD)); git checkout "$GDEFAULTBR" && git pull && git branch -d "$GDONEWITH"'
