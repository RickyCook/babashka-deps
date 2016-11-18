rc_d=~/.babashka/deps/files/zshrc.d
for f in $(ls "$rc_d"); do
    source "$rc_d/$f"
done
