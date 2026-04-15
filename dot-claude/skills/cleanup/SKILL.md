---
name: cleanup
description: 프로젝트 점검 (문서 일치 확인, 규칙 위반 검출, 미사용 코드 정리)
trigger: when the user asks to clean up the project or check for unused code and documentation consistency
---

$ARGUMENTS가 있으면 해당 파일만, 없으면 프로젝트 전체를 점검해줘:

1. 문서(README, 주석, CLAUDE.md)가 실제 코드와 일치하는지
2. CLAUDE.md에 정의된 코딩 규칙을 위반한 코드가 있는지
3. 사용하지 않는 코드(미사용 import, 데드코드, 빈 파일)가 있는지

각 항목별로 문제를 리스트업하고, 수정안을 제시해줘.
수정 시 기존 기능에 사이드이펙트가 없는지 반드시 확인해.
