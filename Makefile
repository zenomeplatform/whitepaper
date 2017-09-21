TEX=lualatex -shell-escape -output-directory=build -interaction=nonstopmode


all:
	mkdir -p build/tex
	$(TEX) main.tex
	biber build/main
	mv build/main.pdf result.pdf


release:
	$(eval V := $(shell cat VERSION))
	$(eval V := $(shell echo $V+1 | bc) )
	$(eval VV := $(shell echo "scale=2; ${V}/100" | bc) )
	$(eval FILENAME := $(shell printf "WP_%.2f.pdf" ${VV}))
	@echo ${FILENAME}
	cp result.pdf pdf/${FILENAME}
	$(shell echo ${V} > VERSION)
