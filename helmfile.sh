HELMFILE_VERSION='0.18.0'
HELMFILE_GITHUB_FN="helmfile_darwin_amd64"
HELMFILE_FULL_FN="${HELMFILE_GITHUB_FN}-${HELMFILE_VERSION}"
HELMFILE_BIN_FN="helmfile"
HELMFILE_DEST_PATH="$HOME/bin"
HELMFILE_FULL_PATH="$HELMFILE_DEST_PATH/$HELMFILE_FULL_FN"
HELMFILE_BIN_PATH="$HELMFILE_DEST_PATH/$HELMFILE_BIN_FN"

function helmfile() {
  requires helmfile_downloaded
  requires helmfile_executable
  requires helmfile_linked
}

function helmfile_downloaded() {
  function is_met() {
    [ -f "$HELMFILE_FULL_PATH" ]
  }
  function meet() {
    curl -L "https://github.com/roboll/helmfile/releases/download/v$HELMFILE_VERSION/$HELMFILE_GITHUB_FN" -o "$HELMFILE_FULL_PATH"
  }
  process
}

function helmfile_executable() {
  function is_met() {
    [ -x "$HELMFILE_FULL_PATH" ]
  }
  function meet() {
    chmod +x "$HELMFILE_FULL_PATH"
  }
  process
}

function helmfile_linked() {
  function is_met() {
    [ "$(readlink $HELMFILE_BIN_PATH)" == "$HELMFILE_FULL_PATH" ]
  }
  function meet() {
    ln -Fs "$HELMFILE_FULL_PATH" "$HELMFILE_BIN_PATH"
  }
  process
}
