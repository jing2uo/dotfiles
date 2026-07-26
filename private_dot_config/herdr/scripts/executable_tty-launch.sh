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
    # Land on the home λ workspace once the server is reachable
    # (covers both cold start and re-attach; same logic as the f12+1 binding).
    (
        i=0
        while [ "$i" -lt 50 ]; do
            if "$MISE" x -- herdr workspace list >/dev/null 2>&1; then
                "$HOME/.config/herdr/scripts/home-space.sh"
                exit 0
            fi
            sleep 0.2
            i=$((i + 1))
        done
    ) >/dev/null 2>&1 &
    exec "$MISE" x -- herdr
fi

# herdr unavailable — still give the user a shell
exec /bin/zsh -l
