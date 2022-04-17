# Abhi-1U
#
Convert_to_Markdown<- function(input_file){
    md_file_name=paste(toString(tools::file_path_sans_ext(input_file)),".md",sep="")
    rmarkdown::pandoc_convert(input_file, to= "markdown",output=md_file_name)

}
Append_Markdown_Files <- function(input_file,title,bib_file){
    md_file = file(input_file,open="rt")
    md_file_content=readLines(md_file)
    yml_header="---"
    title_string="title:"
    newline_string="\n"
    bibliography_string="bibliography:"
    output_string="output:"
    output_path="rjtools::rjournal_web_article"
    dir.create("output",showWarnings = F)
    rmd_yml_additions= paste(yml_header,newline_string,title_string,title,newline_string,bibliography_string,bib_file,newline_string,output_string,output_path,newline_string, sep =" ")
    output_file = file(paste("output/",toString(tools::file_path_sans_ext(input_file)),".Rmd",sep=""), open="wt")
    writeLines(paste(rmd_yml_additions,""),con=output_file,useBytes = FALSE)
    writeLines(paste(yml_header,""),con=output_file,useBytes = FALSE)
    writeLines(paste(md_file_content,""),con=output_file,useBytes = FALSE)
    close.connection(md_file,type = "rt")
    close.connection(output_file,type = "wt")
}

Copy_Other_Files<-function(){

    dir_list=list.dirs(recursive = FALSE)
    target_dir=basename(dir_list[grep("*_files",dir_list)])
    print(target_dir)
    dir.create(paste("output/",target_dir,sep=""),showWarnings = F)
    file.copy(list.files(target_dir, full.names = TRUE), paste("output/",target_dir,sep=""), recursive = TRUE)
    file_list=list.files(recursive = FALSE)
    extensions = c("*.png", "*.jpg", "*.bib")
    target_files = unique(grep(paste(extensions,collapse="|"), file_list, value=TRUE))
    print(target_files)
    file.copy(target_files,to = "output/", copy.mode = T, recursive=FALSE,)
}
Produce_HTML<-function(input_file_path){
    rmarkdown::render(input = input_file_path)
}

Convert_to_Markdown("RJwrapper.tex")
Append_Markdown_Files("RJwrapper.md",title = "A Unifying Framework for Parallel and Distributed Processing in R using Futures",bib_file = "bengtsson-future.bib")
Copy_Other_Files()
Produce_HTML('./output/RJwrapper.Rmd')
