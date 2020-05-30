PREF=2020-NaaktgeborenC+AndradeFN-BravLatNam

clean:
	for EXT in log aux blg bbl out toc dvi; do \
		rm -vf ${PREF}.$$EXT; \
	done

cc/%.pdf: cc/%.svg
	inkscape \
		--export-type=pdf \
		--export-pdf-version=1.4 \
		--export-filename=$@ \
		$<

fig/%.pdf: fig/%.svg
	inkscape \
		--export-type=pdf \
		--export-pdf-version=1.4 \
		--export-filename=$@ \
		$<

%.ps: fig/%.pdf
	inkscape \
		--export-type=ps \
		--export-filename=$@ \
		$<

${PREF}.dvi: ${PREF}.tex 0*tex \
		cc/by.pdf \
		bibfile.bib
	latex ${PREF}.tex
	bibtex ${PREF}
	latex ${PREF}.tex
	latex ${PREF}.tex

${PREF}.pdf: ${PREF}.dvi
	dvipdf ${PREF}.dvi

