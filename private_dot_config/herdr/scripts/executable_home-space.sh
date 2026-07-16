#!/bin/sh
# herdr CLI: prefer the server-injected binary, else resolve through mise
herdr_cmd() {
    if [ -x "$HERDR_BIN_PATH" ]; then
        "$HERDR_BIN_PATH" "$@"
    else
        "$(command -v mise || echo /usr/local/bin/mise)" x -- herdr "$@"
    fi
}

ws="$(herdr_cmd workspace list | jq -r '.result.workspaces[]|select(.label=="Terminal")|.workspace_id' | head -1)"
if [ -n "$ws" ]; then
    herdr_cmd workspace focus "$ws"
else
    herdr_cmd workspace create --cwd "$HOME" --label Terminal --focus
fi
