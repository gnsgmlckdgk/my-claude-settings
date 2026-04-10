#!/bin/bash
copy_safe() {
  if [ -e "$2" ]; then
    echo "⚠️  이미 존재: $2 (건너뜀)"
  else
    cp "$1" "$2"
    echo "✅ 복사: $2"
  fi
}

mkdir -p ~/.claude/agents ~/.claude/commands
copy_safe "$(pwd)/CLAUDE.md" ~/CLAUDE.md
copy_safe "$(pwd)/settings.json" ~/.claude/settings.json

for f in agents/*.md; do
  copy_safe "$f" ~/.claude/agents/$(basename "$f")
done

for f in commands/*.md; do
  copy_safe "$f" ~/.claude/commands/$(basename "$f")
done