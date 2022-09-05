# noto-kr-var-distilled

용량을 각각 0.3MB, 0.7MB로 줄인 NotoSans-KR, NotoSerif-KR 가변 폰트.

원본:

- [NotoSansKR-VF.ttf](https://github.com/googlefonts/noto-cjk/blob/main/Sans/Variable/TTF/Subset/NotoSansKR-VF.ttf)
- [NotoSerifKR-VF.ttf](https://github.com/googlefonts/noto-cjk/blob/main/Serif/Variable/TTF/Subset/NotoSerifKR-VF.ttf)

변환 과정:

1. 일상에서 쓰이는 한글 자모 조합과 ASCII의 출력 가능한 문자들만 추출
2. TTF를 WOFF2로 변환

구체적인 방법은 [Makefile](./Makefile)을 참고하세요. 단, 다음 소프트웨어/라이브러리가 설치되어 있어야 합니다.

- Python 3 및 fonttools 라이브러리 (`pip install fonttools`)
- woff2 유틸리티 (`brew install woff2`)
