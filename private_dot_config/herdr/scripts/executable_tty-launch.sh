#!/bin/sh
# Alacritty entrypoint: attach to herdr, live-handing the server off to the
# new binary after a mise upgrade (old server would otherwise keep running
# from a deleted exe and break plugin callbacks via HERDR_BIN_PATH).

# GUI-launched alacritty has no mise shell activation; mise itself lives in
# a system path, so resolve herdr through `mise x`.
MISE=$(command -v mise || echo /usr/local/bin/mise)
LOCK="$HOME/.config/herdr/handoff.lock"

if "$MISE" x -- herdr --version >/dev/null 2>&1; then
    if "$MISE" x -- herdr status 2>/dev/null | grep -q 'restart_needed: yes'; then
        # -n: if another window is already handing off, skip instead of queueing
        flock -n "$LOCK" "$MISE" x -- herdr server live-handoff || true
    fi
    # No startup jump to the λ workspace: the client rewrites the whole
    # workspace set when it restores session.json (~9s after the server
    # socket is up), which discarded anything created before that. Use the
    # f12+1 binding once the session is up instead.
    exec "$MISE" x -- herdr
fi

# herdr unavailable — still give the user a shell
exec /bin/zsh -l
