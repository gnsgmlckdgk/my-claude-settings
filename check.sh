#!/bin/sh
# check.sh - Claude Code 경로에 파일이 정상 배치되었는지 확인

echo "=== Claude Code 파일 배치 확인 ==="
echo ""

fail=0
check_file() {
  if [ -e "$1" ]; then
    echo "✅ $1"
  else
    echo "❌ $1"
    fail=1
  fi
}

check_file "$HOME/CLAUDE.md"
check_file "$HOME/.claude/settings.json"

for f in dot-claude/commands/*.md; do
  [ -e "$f" ] || continue
  check_file "$HOME/.claude/commands/$(basename "$f")"
done

for f in dot-claude/agents/*.md; do
  [ -e "$f" ] || continue
  check_file "$HOME/.claude/agents/$(basename "$f")"
done

echo ""
if [ "$fail" -eq 0 ]; then
  echo "모든 파일 정상 배치 완료"
else
  echo "⚠️  누락된 파일이 있습니다"
fi