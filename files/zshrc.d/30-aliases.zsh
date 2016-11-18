alias sshu="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scpu="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias gdone='GDONEWITH=$(git rev-parse --abbrev-ref HEAD); git checkout master && git pull && git branch -d $GDONEWITH'
