PAPER = ecethesis
TEX = $(wildcard *.tex all_chapters/*.tex)
BIB = thesisrefs.bib
FIGS = $(wildcard all_figures/*.pdf all_figures/*.png all_figures/*.JPG all_figures/*.PNG)

.PHONY: all clean tmpclean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)
	make tmpclean

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.dvi *.toc  *.maf *.mtc *.mtc0 *.lof *.lot $(PAPER).pdf

tmpclean:
	rm -f *.aux *.bbl *.blg *.log *.out *.dvi *.toc  *.maf *.mtc *.mtc0 *.lof *.lot
 