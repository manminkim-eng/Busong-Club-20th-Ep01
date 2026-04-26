# 📲 링크 공유 시 미리보기 이미지 자동 적용 가이드

> **목표**: 카카오톡·블로그·SNS에 INDEX 사이트 URL을 붙여넣을 때
> 「부송 20주년 EP1 31장의 기록」 카드 이미지가 자동으로 미리보기로 뜨게 하기

---

## 🎯 현재 적용된 내용

`index.html`에는 다음 메타 태그가 이미 적용되어 있습니다:

```html
<meta property="og:title" content="부송 20주년 EP1 「창단의 열정」 — 31장의 기록">
<meta property="og:description" content="2007~2010 익산 부송 배드민턴 클럽 창단 초기 사진 31장...">
<meta property="og:image" content="https://__SITE_URL__/og/share-card.jpg">
<meta property="og:image:width" content="1280">
<meta property="og:image:height" content="720">
<meta name="twitter:card" content="summary_large_image">
<meta name="thumbnail" content="...">
```

이 중 `__SITE_URL__` 부분만 본인의 실제 배포 주소로 바꾸면 끝입니다.

---

## 🛠 적용 절차 — 3단계

### ✅ Step 1. INDEX 사이트를 먼저 배포

OG 미리보기는 **공개된 https URL**이 있어야 작동합니다.
권장 무료 배포처:

| 플랫폼 | 장점 | URL 예시 |
|---|---|---|
| **GitHub Pages** ⭐ | 영구 무료, 빠름 | `manminkim-eng.github.io/...` |
| Netlify | 드래그앤드롭 배포, 즉시 | `xxx.netlify.app` |
| Cloudflare Pages | 빠른 CDN | `xxx.pages.dev` |

**GitHub Pages 권장 경로**:
```
https://manminkim-eng.github.io/Busong-Club-20th-Anniversary/EP1/
```

### ✅ Step 2. URL 교체

배포된 URL을 확인했다면, 두 가지 방법 중 선택:

#### 방법 A — 스크립트 사용 (간편)
1. `apply-site-url.sh` 파일을 텍스트 에디터로 열기
2. `SITE_URL="manminkim-eng.github.io/Busong-Club-20th-Anniversary/EP1"` 줄에서
   따옴표 안의 주소를 **본인의 실제 주소**로 수정 (https:// 제외, 끝 슬래시 제외)
3. 터미널에서 사이트 폴더로 이동 후 실행:
   ```bash
   bash apply-site-url.sh
   ```
4. "✅ 완료" 메시지 확인

#### 방법 B — 수동 편집 (간단)
1. `index.html`을 메모장·텍스트 에디터로 열기
2. **찾아 바꾸기** (Ctrl+H 또는 Cmd+H):
   - 찾을 내용: `__SITE_URL__`
   - 바꿀 내용: `manminkim-eng.github.io/Busong-Club-20th-Anniversary/EP1` *(본인 주소)*
3. 「모두 바꾸기」 클릭 → 5곳 교체됨
4. 저장

### ✅ Step 3. 다시 배포 + 캐시 갱신

수정된 `index.html`을 다시 GitHub Pages에 푸시(또는 Netlify 재업로드).

**카카오톡 캐시 강제 갱신** (필수):
1. 다음 페이지 접속 → **카카오 디버거**
   👉 https://developers.kakao.com/tool/debugger/sharing
2. 본인의 사이트 URL 입력 → 「디버그」 버튼
3. **「수집정보 초기화」** 클릭 (캐시 삭제)
4. 다시 「디버그」 → 미리보기 이미지가 새 카드로 보이면 성공

> ⚠️ 카카오톡은 한 번 본 URL의 미리보기를 30일 정도 캐시합니다.
> 디버거로 초기화하지 않으면 카톡방 친구들에게는 이전 이미지가 보일 수 있습니다.

---

## 🧪 적용 후 테스트 체크리스트

### 카카오톡
- [ ] 친구·본인 톡방에 사이트 URL 한 줄만 붙여넣기
- [ ] 미리보기 카드에 「31장의 기록」 이미지가 뜨는가
- [ ] 제목 「부송 20주년 EP1 — 31장의 기록」이 보이는가
- [ ] PC 카톡과 모바일 카톡 모두 확인

### 네이버 블로그
- [ ] 글쓰기에서 URL을 본문에 입력하면 자동으로 미리보기 카드가 뜨는가
- [ ] 「웹 미리보기 가져오기」 기능 시 카드 이미지가 적용되는가

### 페이스북·트위터·텔레그램
- [ ] 채팅·게시 시 카드 이미지가 자동 노출되는가

### 디버거 도구로 검증
- 카카오톡: https://developers.kakao.com/tool/debugger/sharing
- 페이스북: https://developers.facebook.com/tools/debug/
- 트위터: https://cards-dev.twitter.com/validator (deprecated, 2024년 이후 자동)

---

## 🚨 흔한 문제 해결

### 문제 1: 카톡에서 이미지가 안 뜨고 텍스트만 보임
**원인**: OG 이미지 절대경로가 잘못됨, 또는 https가 아닌 http
**해결**:
1. `index.html`을 열어 `og:image` 태그 확인
2. 값이 `https://`로 시작하고, 실제 접근 가능한 URL인지 브라우저로 직접 열어서 확인

### 문제 2: 옛날 이미지가 계속 보임
**원인**: 카카오톡 캐시
**해결**: 위 「Step 3」의 카카오 디버거에서 **수집정보 초기화** 필수

### 문제 3: GitHub Pages에 한글 파일명 사진이 안 보임
**원인**: 일부 한글 파일명이 URL 인코딩 문제 일으킴
**해결**: 이미 본 사이트의 사진들은 모두 영문·숫자 파일명으로 정리되어 있어 문제 없음. (`og/share-card.jpg`도 영문)

### 문제 4: 미리보기 이미지가 잘려 보임
**원인**: 카카오톡은 1.91:1 비율 권장. 본 카드는 16:9(1280x720, 1.78:1)라 살짝 다름
**현상**: 큰 문제 없음. 카톡은 자동 패딩 처리. 그래도 잘림이 신경 쓰이면 1200x630 버전 별도 제작 가능 (요청 시)

---

## 📍 미리보기 카드 디자인

이 사이트의 OG 이미지(`og/share-card.jpg`)는 다음 정보를 담고 있습니다:

- **좌측**: 핵심 사진 4장 콜라주 (회장취임식 → 1주년 → 2주년 → 부송클럽화이팅) + 「+27장 더 보기」 오버레이
- **우측**: 「31장의 기록 / 2007~2010」 타이틀 + 「31장 전체 보기 →」 골드 CTA 버튼
- **컬러**: 콘티북 표준 네이비 #0D1B33 + 골드 #C9A961

이미지 자체가 클릭 유도 카드 역할을 하므로,
카톡·블로그에서 누군가 URL을 보는 순간 페이지의 정체와 가치가 즉시 전달됩니다.

---

**기획 총괄** — 김만민 남부회장 (010-8287-1231)
