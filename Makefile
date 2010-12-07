# Build Tools
MP     = mpost
TEX    = latex
BIB    = bibtex
DVIPDF = dvipdf

# Project Specifics
PROJECT  = lab3
DIAGRAMS = 

default: $(PROJECT).pdf

rebuild: clean $(PROJECT).pdf

diagrams: $(DIAGRAMS)

.SUFFIXES: .dvi .pdf .tex .mp .1 .bib .bbl

.dvi.pdf:
	$(DVIPDF) $<

.mp.1:
	$(MP) $<

$(PROJECT).dvi: $(DIAGRAMS) $(PROJECT).tex $(PROJECT).bib
	$(TEX) $(PROJECT)
	$(BIB) $(PROJECT)
	$(TEX) $(PROJECT)
	$(TEX) $(PROJECT)

clean:
	rm -f *.dvi *.pdf *.1 *.aux *.log *.mpx *.bbl *.blg *.toc

