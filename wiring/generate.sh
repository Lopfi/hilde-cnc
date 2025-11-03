#!/usr/bin/env bash
set -euo pipefail

# Run from the script directory (assumes this script lives in wiring/)
cd "$(dirname "$0")"

out_dir="../docu/images/wiring"
mkdir -p "$out_dir"

shopt -s nullglob
files=( *.yml *.yaml )
if [ ${#files[@]} -eq 0 ]; then
    echo "No .yml/.yaml files found in $(pwd)"
    exit 0
fi

render_file() {
    local f="$1" out="$2"

    if eval "wireviz $f -f s -o $out" 2>/dev/null; then
        return 0
    fi

    return 1
}

for f in "${files[@]}"; do
    name="${f%.*}"
    out="$out_dir"
    printf 'Rendering: %s -> %s\n' "$f" "$out"
    if render_file "$f" "$out"; then
        printf 'OK: %s\n' "$out"
    else
        printf 'ERROR: failed to render %s (ensure wireviz is installed or use npx)\n' "$f" >&2
    fi
done