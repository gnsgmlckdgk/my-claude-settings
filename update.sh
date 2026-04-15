# update.sh - 전부 덮어쓰기
#!/bin/bash
mkdir -p ~/.claude/agents ~/.claude/skills

cp "$(pwd)/home/CLAUDE.md" ~/CLAUDE.md
echo "✅ 업데이트: ~/CLAUDE.md"

cp "$(pwd)/dot-claude/settings.json" ~/.claude/settings.json
echo "✅ 업데이트: ~/.claude/settings.json"

# 이전 플랫 파일 형식(.md) 정리
for f in "$HOME"/.claude/skills/*.md; do
  [ -f "$f" ] || continue
  rm "$f"
  echo "🗑️  삭제(이전 형식): $f"
done

for d in dot-claude/skills/*/; do
  [ -d "$d" ] || continue
  skill=$(basename "$d")
  rm -rf "$HOME/.claude/skills/$skill"
  cp -r "$d" "$HOME/.claude/skills/$skill"
  echo "✅ 업데이트: ~/.claude/skills/$skill"
done

for f in dot-claude/agents/*.md; do
  [ -e "$f" ] || continue
  cp "$f" ~/.claude/agents/$(basename "$f")
  echo "✅ 업데이트: ~/.claude/agents/$(basename "$f")"
done