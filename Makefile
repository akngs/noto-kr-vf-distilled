all: sites/index.html

sites/index.html: build/NotoSansKR-VF-distilled.woff2 build/NotoSerifKR-VF-distilled.woff2 build/glyphs.txt index.html LICENSE
	rm -rf sites
	mkdir -p sites
	cp build/NotoSansKR-VF-distilled.woff2 sites/
	cp build/NotoSerifKR-VF-distilled.woff2 sites/
	cp build/glyphs.txt sites/
	cp index.html sites/
	cp LICENSE sites/
	touch sites/.nojekyll

build/NotoSansKR-VF-distilled.woff2: build/NotoSansKR-VF-distilled.ttf
	woff2_compress build/NotoSansKR-VF-distilled.ttf

build/NotoSerifKR-VF-distilled.woff2: build/NotoSerifKR-VF-distilled.ttf
	woff2_compress build/NotoSerifKR-VF-distilled.ttf

build/NotoSansKR-VF-distilled.ttf: build/glyphs.txt build/NotoSansKR-VF.ttf
	pyftsubset build/NotoSansKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/NotoSansKR-VF-distilled.ttf

build/NotoSerifKR-VF-distilled.ttf: build/glyphs.txt build/NotoSerifKR-VF.ttf
	pyftsubset build/NotoSerifKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/NotoSerifKR-VF-distilled.ttf

build/glyphs.txt: generate_glyphs.py
	mkdir -p build
	python generate_glyphs.py > build/glyphs.txt

build/NotoSansKR-VF.ttf:
	wget https://raw.githubusercontent.com/googlefonts/noto-cjk/main/Sans/Variable/TTF/Subset/NotoSansKR-VF.ttf -qO build/NotoSansKR-VF.ttf

build/NotoSerifKR-VF.ttf:
	wget https://raw.githubusercontent.com/googlefonts/noto-cjk/main/Serif/Variable/TTF/Subset/NotoSerifKR-VF.ttf -qO build/NotoSerifKR-VF.ttf
