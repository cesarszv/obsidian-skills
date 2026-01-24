#!/bin/sh
# Distribute skills to local agent directories.
set -eu

SRC="${SRC:-$HOME/developer/llm-skills/obsidian/skills/}"

for dest in \
    "$HOME/developer/obsidian-zarvent/.claude/skills/" \
    "$HOME/developer/obsidian-zarvent/.gemini/skills/" \
    "$HOME/developer/obsidian-zarvent/.github/skills/"
do
    [ -d "$dest" ] && rsync -a --delete "$SRC" "$dest"
done
