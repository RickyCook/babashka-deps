OP_VERSION='0.3'
OP_ZIP_FN="op_darwin_amd64_v$OP_VERSION.zip"
OP_ZIP_PATH="$HOME/Downloads/$OP_ZIP_FN"

function op_cli() {
  requires op_cli_installed
}

function op_cli_downloaded() {
  function is_met() {
    [ -f "$OP_ZIP_PATH" ]
  }
  function meet() {
    curl "https://cache.agilebits.com/dist/1P/op/pkg/v$OP_VERSION/$OP_ZIP_FN" -o "$OP_ZIP_PATH"
  }
  process
}

function op_cli_installed() {
  function is_met() {
    [ -f "$HOME/bin/op" ] && [[ "$("$HOME/bin/op" --version)" == "$OP_VERSION" ]]
  }
  function meet() {
    requires op_cli_downloaded
    unzip "$OP_ZIP_PATH" -d "$HOME/bin"
  }

  process
}
