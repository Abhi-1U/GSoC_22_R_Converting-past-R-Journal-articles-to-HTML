SHELL=bash
NAME=bengtsson-future

FIGURES=figures/future-lapply-4workers.pdf
INCLUDES=RJwrapper.tex $(FIGURES) $(NAME).tex $(NAME).bib

render: RJwrapper.pdf

log-report: RJwrapper.log
	@echo "** Looking for LaTeX warnings and errors ..."
	@grep --color=always -iE ".*(LaTeX (Error|Warning):|Warning: Citation .* undefined).*" $< || echo "=> Everything looks good!"

RJwrapper.pdf: $(INCLUDES)
	@Rscript -e "tools:::texi2pdf('RJwrapper.tex')"
	@make --quiet log-report

clean:
	rm -f RJwrapper.pdf RJwrapper.aux RJwrapper.bbl RJwrapper.blg RJwrapper.brf RJwrapper.log RJwrapper.out RJwrapper.dvi RJwrapper.fdb_latexmk RJwrapper.fls
