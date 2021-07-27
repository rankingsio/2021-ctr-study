rmarkdown::render(here::here("rmd", "final.Rmd"))

# name study like FTP_CTR_STUDY in environ-file
usethis::edit_r_environ()
# add this line there: FTP_CTR_STUDY="ftp://finantj:THEPWISENTYOU@www457.your-server.de//public_html/frontpagedata/html_files/ctr-study.html"
# save the .Renviron. Restart RStudio

# then, finally, run this:  
# add study name under Sys.getenv 
RCurl::ftpUpload(here::here("rmd", "03_final.html"), Sys.getenv("FTP_CTR_STUDY"))


