# R Script with functions to convert Rmd to HTML with supporting files copied

## Procedure to do the task 
1. open the LateX-Rmd.R script file.
2. go into the test directory for example Examples/RJ-2021-048-bengtsson-future 
3. change the working directory to the test directory
4. run the Latex-Rmd.R script file with minor changes such as the title and bib file name 
 ```
 Append_Markdown_Files("RJwrapper.md",title = "A Unifying Framework for Parallel and Distributed Processing in R using Futures",bib_file = "bengtsson-future.bib")
 ```


note : avoid spaces in the title and bib file string.

5. The script functions should generate the .md markdown file first in the same directory.
6. The Script would then create a output folder and create the Rmd R-markdown file in the directory which will have the yml headers appended.
7. Lastly the Script will copy dependencies such as images,bib files.
8. One can then browse the output folder and knit it to a HTML file.
9. That should generate a fairly good HTML document.