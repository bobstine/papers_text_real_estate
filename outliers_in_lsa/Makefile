################################################################################
#
#
#                          GENERATING OUTPUT from Rnw
#
#
################################################################################

default: quadratic_variables_VS_LDA.pdf
	zsh -c "source ~/.zshrc;open quadratic_variables_VS_LDA.pdf"

SOURCES = $(wildcard *.Rnw)

.SECONDARY: $(SOURCES:.Rnw=.tex)

all: all_pdf all_R

all_html: $(SOURCES:.Rnw=.tex.html)

all_pdf: $(SOURCES:.Rnw=.pdf)

all_R: $(SOURCES:.Rnw=.R)

%.tex.html: %.tex
	touch $@
	rm $@
	cat class_header $< class_footer > $@

%.tex: %.Rnw .figures
	R CMD Sweave $<

%.tex: %.Rtex .figures
	Rscript -e "library(knitr); knit('$<')"

%.R: %.Rnw
	R CMD Stangle $<

%.R: %.Rtex
	Rscript -e "library(knitr); knit('myfile.Rmd')"

%.pdf: %.tex
	pdflatex $<

.figures:
	mkdir .figures
