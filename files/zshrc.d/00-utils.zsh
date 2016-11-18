function try_source {
	[ -f "$1" ] && source "$1"
}
function has_bin {
    which "$1" > /dev/null
}
