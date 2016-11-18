if has_bin mvim; then
    export EDITOR=mvim
    alias vim=mvim
    alias vi=mvim
elif has_bin gvim; then
    export EDITOR=gvim
    alias vim=gvim
    alias vi=gvim
elif has_bin vim; then
    export EDITOR=vim
fi
