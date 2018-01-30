try_source ~/.profile
try_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
try_source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
try_source ~/.travis/travis.sh
try_source ~/.fzf.zsh
#try_source ~/google-cloud-sdk/path.zsh.inc
#try_source ~/google-cloud-sdk/completion.zsh.inc
try_source ~/.iterm2_shell_integration.zsh
try_source /usr/local/bin/aws_zsh_completer.sh

has_bin pyenv  && eval "$(pyenv init -)"
has_bin exenv  && eval "$(exenv init -)"
has_bin nodenv && eval "$(nodenv init -)"
has_bin rbenv  && eval "$(rbenv init -)"

has_bin kubectl && source <(kubectl completion zsh)
has_bin kops    && source <(kops completion zsh)
has_bin helm    && source <(helm completion zsh)
