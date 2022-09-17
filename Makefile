all: sites/index.html

sites/index.html: build/NotoSansKR-VF-distilled.woff2 build/NotoSerifKR-VF-distilled.woff2 build/PretendardKR-VF-distilled.woff2 build/Hahmlet-VF-distilled.woff2 build/glyphs.txt index.html LICENSE
	rm -rf sites
	mkdir -p sites
	cp build/NotoSansKR-VF-distilled.woff2 sites/
	cp build/NotoSerifKR-VF-distilled.woff2 sites/
	cp build/PretendardKR-VF-distilled.woff2 sites/
	cp build/Hahmlet-VF-distilled.woff2 sites/
	cp build/glyphs.txt sites/
	cp index.html sites/
	cp LICENSE sites/
	touch sites/.nojekyll

build/NotoSansKR-VF-distilled.woff2: build/NotoSansKR-VF-distilled.ttf
	woff2_compress build/NotoSansKR-VF-distilled.ttf

build/NotoSerifKR-VF-distilled.woff2: build/NotoSerifKR-VF-distilled.ttf
	woff2_compress build/NotoSerifKR-VF-distilled.ttf

build/PretendardKR-VF-distilled.woff2: build/PretendardKR-VF-distilled.ttf
	woff2_compress build/PretendardKR-VF-distilled.ttf

build/Hahmlet-VF-distilled.woff2: build/Hahmlet-VF-distilled.ttf
	woff2_compress build/Hahmlet-VF-distilled.ttf

build/NotoSansKR-VF-distilled.ttf: build/glyphs.txt build/NotoSansKR-VF.ttf
	pyftsubset build/NotoSansKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/NotoSansKR-VF-distilled.ttf

build/NotoSerifKR-VF-distilled.ttf: build/glyphs.txt build/NotoSerifKR-VF.ttf
	pyftsubset build/NotoSerifKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/NotoSerifKR-VF-distilled.ttf

build/PretendardKR-VF-distilled.ttf: build/glyphs.txt build/PretendardKR-VF.ttf
	pyftsubset build/PretendardKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/PretendardKR-VF-distilled.ttf

build/Hahmlet-VF-distilled.ttf: build/glyphs.txt build/Hahmlet-VF.ttf
	pyftsubset build/Hahmlet-VF.ttf --text-file=build/glyphs.txt --output-file=build/Hahmlet-VF-distilled.ttf

build/glyphs.txt: generate_glyphs.py
	mkdir -p build
	python generate_glyphs.py > build/glyphs.txt

build/NotoSansKR-VF.ttf:
	wget https://raw.githubusercontent.com/googlefonts/noto-cjk/main/Sans/Variable/TTF/Subset/NotoSansKR-VF.ttf -qO build/NotoSansKR-VF.ttf

build/NotoSerifKR-VF.ttf:
	wget https://raw.githubusercontent.com/googlefonts/noto-cjk/main/Serif/Variable/TTF/Subset/NotoSerifKR-VF.ttf -qO build/NotoSerifKR-VF.ttf

build/PretendardKR-VF.ttf:
	wget https://raw.githubusercontent.com/orioncactus/pretendard/main/packages/pretendard/dist/public/variable/PretendardVariable.ttf -qO build/PretendardKR-VF.ttf

build/Hahmlet-VF.ttf:
	wget https://raw.githubusercontent.com/hyper-type/hahmlet/master/fonts/variable/Hahmlet%5Bwght%5D.ttf -qO build/Hahmlet-VF.ttf
