부송 20주년 EP1 — 링크 공유용 패키지
===================================

[포함 파일]
- index.html         : 메인 페이지
- EP1_thumbnail.jpg  : 카톡/페북/트위터 등 링크 공유 시 미리보기 이미지

[사용 방법]
1) 두 파일을 반드시 같은 폴더에 함께 올려주세요.
   (index.html이 ./EP1_thumbnail.jpg 경로로 이미지를 참조합니다)

2) 호스팅 추천:
   - Netlify Drop  (https://app.netlify.com/drop)  ← 폴더 통째로 드래그 한 번이면 끝
   - GitHub Pages
   - Vercel
   - 기타 정적 웹 호스팅 어디든 가능

3) 업로드 후, 그 사이트 주소를 카톡 등에 공유하면
   EP1 썸네일이 미리보기 이미지로 표시됩니다.

[주의]
- 처음 카카오톡에서 미리보기가 안 뜨거나 이전 이미지가 남아있다면,
  카카오 캐시 초기화 도구를 이용하세요:
  https://developers.kakao.com/tool/clear/og
- 페이스북도 비슷하게 디버거가 있습니다:
  https://developers.facebook.com/tools/debug/

[선택 사항 — og:url 정확히 맞추기]
index.html 22번째 줄에 og:url이 placeholder로 남아 있습니다:
  <meta property="og:url" content="https://__SITE_URL__/">
배포 후 실제 사이트 주소가 정해지면 이 부분을 그 주소로 바꿔주시면
링크 공유 정확도가 더 높아집니다. (안 바꿔도 미리보기 자체는 뜹니다)
