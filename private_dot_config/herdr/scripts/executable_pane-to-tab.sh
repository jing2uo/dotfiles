#!/bin/sh
# herdr CLI: prefer the server-injected binary, else resolve through mise
herdr_cmd() {
    if [ -x "$HERDR_BIN_PATH" ]; then
        "$HERDR_BIN_PATH" "$@"
    else
        "$(command -v mise || echo /usr/local/bin/mise)" x -- herdr "$@"
    fi
}

p="$(herdr_cmd pane current | jq -r '.result.pane.pane_id')"
[ -z "$p" ] && exit 1
herdr_cmd pane move "$p" --new-tab --focus
