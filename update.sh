# update.sh - 전부 덮어쓰기
#!/bin/bash
mkdir -p ~/.claude/agents ~/.claude/commands

cp "$(pwd)/home/CLAUDE.md" ~/CLAUDE.md
echo "✅ 업데이트: ~/CLAUDE.md"

cp "$(pwd)/dot-claude/settings.json" ~/.claude/settings.json
echo "✅ 업데이트: ~/.claude/settings.json"

for f in dot-claude/commands/*.md; do
  [ -e "$f" ] || continue
  cp "$f" ~/.claude/commands/$(basename "$f")
  echo "✅ 업데이트: ~/.claude/commands/$(basename "$f")"
done

for f in dot-claude/agents/*.md; do
  [ -e "$f" ] || continue
  cp "$f" ~/.claude/agents/$(basename "$f")
  echo "✅ 업데이트: ~/.claude/agents/$(basename "$f")"
done