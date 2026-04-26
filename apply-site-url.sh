#!/bin/bash
# ===================================================================
# OG 메타 태그 URL 일괄 교체 스크립트
# 사용법:
#   1. INDEX 사이트를 GitHub Pages 등에 먼저 배포
#   2. 배포된 URL을 확인 (예: manminkim-eng.github.io/Busong-Club-20th-Anniversary/EP1)
#   3. 이 스크립트의 SITE_URL 변수를 자신의 URL로 수정
#   4. 실행:  bash apply-site-url.sh
# ===================================================================

# ★ 여기를 자신의 배포 URL로 변경하세요 (https:// 제외, 끝 슬래시 제외) ★
SITE_URL="manminkim-eng.github.io/Busong-Club-20th-Anniversary/EP1"

# ===================================================================

if [ ! -f "index.html" ]; then
  echo "❌ index.html을 찾을 수 없습니다. 사이트 폴더 안에서 실행하세요."
  exit 1
fi

# 백업
cp index.html index.html.bak
echo "✓ 백업 생성: index.html.bak"

# URL 교체
sed -i "s|__SITE_URL__|${SITE_URL}|g" index.html
COUNT=$(grep -c "${SITE_URL}" index.html)
echo "✓ ${COUNT}개 위치에서 URL이 [${SITE_URL}]로 교체되었습니다."

# 확인
echo ""
echo "=== OG 메타 태그 확인 ==="
grep -E 'og:(image|url)' index.html | head -5

echo ""
echo "✅ 완료. 이제 변경된 파일을 다시 배포하세요."
echo "   배포 후 카카오톡 디버거에서 캐시를 새로 갱신하세요:"
echo "   https://developers.kakao.com/tool/debugger/sharing"
