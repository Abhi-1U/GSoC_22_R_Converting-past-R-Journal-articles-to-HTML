

Convert_To_Markdown<- function(input_file_path){
    path=dirname(input_file_path)
    old_working_directory=getwd()
    setwd(path)
    input_file=basename(input_file_path)
    md_file=paste(toString(tools::file_path_sans_ext(input_file)),".md",sep="")
    rmarkdown::pandoc_convert(input_file, to= "markdown",output = md_file)
    setwd(old_working_directory)
}
Append_Markdown_Files <- function(input_file_path,title,bib_file){
    input_file=basename(input_file_path)
    md_file = file(input_file_path,open="rt")
    md_file_content=readLines(md_file)
    yml_header="---"
    title_string="title:"
    sensitized_title=paste0('"', title, '"')
    newline_string="\n"
    bibliography_string="bibliography:"
    output_string="output:"
    output_spec="rjtools::rjournal_web_article"
    output_file_name=paste(dirname(input_file_path),"/output/",toString(tools::file_path_sans_ext(input_file)),".Rmd",sep="")
    dir.create(dirname(output_file_name),showWarnings = F)
    rmd_yml_additions= paste(yml_header,newline_string,title_string,sensitized_title,newline_string,bibliography_string,bib_file,newline_string,output_string,output_spec,newline_string, sep =" ")
    output_file = file(output_file_name, open="wt")
    writeLines(paste(rmd_yml_additions,""),con=output_file,useBytes = FALSE)
    writeLines(paste(yml_header,""),con=output_file,useBytes = FALSE)
    writeLines(paste(md_file_content,""),con=output_file,useBytes = FALSE)
    close.connection(md_file,type = "rt")
    close.connection(output_file,type = "wt")
}

Copy_Other_Files<-function(from_path){
    old_working_directory=getwd()
    setwd(from_path)
    dir_list=list.dirs(recursive = FALSE)
    possible_dirs=c("*_files" , "figures")
    target_dir=basename(dir_list[grep(paste(possible_dirs,collapse="|"),dir_list)])
    print(target_dir)
    dir.create(paste("output/",target_dir,sep=""),showWarnings = F)
    file.copy(list.files(target_dir, full.names = TRUE), paste("output/",target_dir,sep=""), recursive = TRUE)
    file_list=list.files(recursive = FALSE)
    extensions = c("*.png", "*.jpg", "*.bib")
    target_files = unique(grep(paste(extensions,collapse="|"), file_list, value=TRUE))
    print(target_files)
    file.copy(target_files,to = "output/", copy.mode = T, recursive=FALSE,)
    setwd(old_working_directory)
}
Produce_HTML<-function(input_file_path){
    rmarkdown::render(input = input_file_path,output_format = "html_document")
}
# Creating a dummy article
#rjtools::create_article()
# Rendering the dummy article into tex and html
#rmarkdown::render('rjarticle/quokka-bilby.Rmd',quiet = TRUE)
# conversion through pandoc
Convert_To_Markdown("RJwrapper.tex")
# Appending YAML headers
Append_Markdown_Files("RJwrapper.md",title= "A Unifying Framework for Parallel and Distributed Processing in R using Futures",bib_file = "bengtsson-future.bib")
# Copying dependencies
Copy_Other_Files(".")
# Generating HTML from Rmd file
Produce_HTML('output/RJwrapper.Rmd')
