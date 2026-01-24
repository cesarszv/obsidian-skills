#!/bin/sh
# Sync all skills from kepano/obsidian-skills dynamically.
set -eu

command -v curl >/dev/null || { echo >&2 "curl required"; exit 1; }

SKILLS_DIR="${SKILLS_DIR:-$HOME/developer/llm-skills/obsidian/skills}"
API="https://api.github.com/repos/kepano/obsidian-skills/contents/skills"
RAW="https://raw.githubusercontent.com/kepano/obsidian-skills/main/skills"

# Fetch skill directories from API (handles JSON with whitespace)
skills=$(curl -sSL "$API" | tr -d ' \n' | grep -oE '"name":"[^"]+"' | cut -d'"' -f4)

for skill in $skills; do
    files=$(curl -sSL "$API/$skill" | tr -d ' \n' | grep -oE '"name":"[^"]+"' | cut -d'"' -f4)
    for file in $files; do
        dest="$SKILLS_DIR/$skill/$file"
        mkdir -p "${dest%/*}"
        curl -sSLz "$dest" "$RAW/$skill/$file" -o "$dest"
    done
done
