#!/bin/bash
# encoding=utf-8
# shellcheck disable=SC2044

set -x
set -e

fetch_all() {
    base_path="$1"
    for git_path in $(find "$base_path" -name ".git" -type d); do
        (cd "$(dirname "$git_path")" && git fetch --all -p)
    done
}

for path in "$@"; do
    echo "$path"
    [[ -d "$path" ]] || continue
    fetch_all "$path"
done
