# Article RJ-2021-048

A Unifying Framework for Parallel and Distributed Processing in R using Futures, Henrik Bengtsson, The R Journal (2021) 13:2, pages 273-291 (<https://journal.r-project.org/archive/2021/RJ-2021-048/>)

This article:

* was written in plain LaTeX
* has code snippets (static)
* uses `\citep{}` and `\citet{}` with references in a BibTeX file
* uses footnotes
* has one figure (a PDF image in a subfolder) which is referenced using `\ref{}`
* has _no_ equations
* has _no_ custom LaTeX commands; it only uses the recommended ones provided by the `RJournal.sty` file


## Build instructions

This folder is self-contained so that the PDF can be built by calling:

```sh
$ Rscript -e "tools:::texi2pdf('RJwrapper.tex')"
```

The generated PDF will be named RJwrapper.pdf.

Alternatively, one can call:

```sh
$ make
```

which will do the same but also highlight any LaTeX issues detected (which there should be none).

Although not needed for this project, the full source of this article can be found at https://github.com/HenrikBengtsson/article-bengtsson-future.
