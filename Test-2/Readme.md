# Test 2 MEDIUM

### R Script with functions to convert Rmd to HTML with supporting files copied

### Objectives :
1. -[x] Creating essential R functions
2. -[x] Used Pandoc to convert Tex into md
3. -[x] Option to append title,bibliography,output as Rmd YAML metadata
4. -[x] Saved the Rmd file in new output directory
5. -[x] Copy essential attachments through script
6. -[x] Generated Rmd File Compiles into a HTML Webpage through function
7. -[x] Tried with both Examples with HTML output 


## For Test Evaluation 
Run the script TexR.R in a test directory with working directory set to the current directory in R.
```R
setwd(test_directory_name)
```
*Note : Currently tested with RStudio 2022.02.1 Build 461 on Linux Mint 20.3* 
## Procedure to do the task 
1. open the TexR.R script file.
2. go into the test directory for example Examples/RJ-2021-048-bengtsson-future 
3. change the working directory to the test directory
4. run the TexR.R script file with minor changes such as the title and bib file name 

 ```R
 Append_Markdown_Files("RJwrapper.md",title = "A Unifying Framework for Parallel and Distributed Processing in R using Futures",bib_file = "bengtsson-future.bib")
 ```
 
note : avoid spaces in the title and bib file string.

5. The script functions should generate the .md markdown file first in the same directory.
6. The Script would then create a output folder and create the Rmd R-markdown file in the directory which will have the yml headers appended.
7. Lastly the Script will copy dependencies such as images,bib files.
8. One can then browse the output folder and knit it to a HTML file.
9. That should generate a fairly good HTML document.
