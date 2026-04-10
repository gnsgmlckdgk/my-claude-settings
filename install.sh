# install.sh - 없는 파일만 복사
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

copy_safe "$(pwd)/home/CLAUDE.md" ~/CLAUDE.md
copy_safe "$(pwd)/dot-claude/settings.json" ~/.claude/settings.json

for f in dot-claude/commands/*.md; do
  [ -e "$f" ] || continue
  copy_safe "$f" ~/.claude/commands/$(basename "$f")
done

for f in dot-claude/agents/*.md; do
  [ -e "$f" ] || continue
  copy_safe "$f" ~/.claude/agents/$(basename "$f")
done