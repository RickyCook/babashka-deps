if has_bin mvim; then
    export EDITOR=mvim
elif has_bin gvim; then
    export EDITOR=gvim
elif has_bin vim; then
    export EDITOR=vim
fi
