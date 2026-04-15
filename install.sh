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

mkdir -p ~/.claude/agents ~/.claude/skills

copy_safe "$(pwd)/home/CLAUDE.md" ~/CLAUDE.md
copy_safe "$(pwd)/dot-claude/settings.json" ~/.claude/settings.json

# 이전 플랫 파일 형식(.md) 정리
for f in "$HOME"/.claude/skills/*.md; do
  [ -f "$f" ] || continue
  rm "$f"
  echo "🗑️  삭제(이전 형식): $f"
done

for d in dot-claude/skills/*/; do
  [ -d "$d" ] || continue
  skill=$(basename "$d")
  if [ -d "$HOME/.claude/skills/$skill" ]; then
    echo "⚠️  이미 존재: ~/.claude/skills/$skill (건너뜀)"
  else
    cp -r "$d" "$HOME/.claude/skills/$skill"
    echo "✅ 복사: ~/.claude/skills/$skill"
  fi
done

for f in dot-claude/agents/*.md; do
  [ -e "$f" ] || continue
  copy_safe "$f" ~/.claude/agents/$(basename "$f")
done