# 커스텀 명령어 (/dot-claude/commands)

| 명령어 | 설명 |
|--------|------|
| `/cleanup` | 문서 최신화, 규칙 위반 코드 정리, 미사용 코드 정리 |
| `/refactor 파일명` | 해당 파일 리팩토링 |
| `/review` | 변경된 파일 코드 리뷰 |
| `/test-gen 파일명` | 해당 파일의 테스트 생성 및 실행 |

---

# Shell 스크립트

| 스크립트 | 설명 |
|----------|------|
| `install.sh` | 신규 환경 세팅용. 저장소 파일을 Claude Code 경로에 복사. 기존 파일이 있으면 건너뜀 |
| `update.sh` | 저장소 파일을 Claude Code 경로에 덮어쓰기. 지침 수정 후 반영할 때 사용 |
| `check.sh` | install/update 후 파일이 정상 배치되었는지 확인 |