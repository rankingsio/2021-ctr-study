# CTR Study for Rankings.io

This is the Github repository for the CTR Study done for Rankings.io. 

:pencil: The full data report can be found [here](https://frontpagedata.com/ctr-study).  
:hammer: The study was conducted with the statistical programming language R.  
:bar_chart: [The code for the analysis and plots](https://github.com/frontpagedata/ctr-study/blob/master/rmd/03_final.Rmd).  
 

:sparkles: Contributors:  
* François Delavy and Daniel Kupka (all frontpagedata.com)
* Chris Dreyer (Rankings.io)

------------------------------------------------------------------------


------------------------------------------------------------------------

### File structure

    +-- plots                 <- Some plots (not all final)
    +-- proc_data             <- Processed data, used for the analysis
    +-- raw_data              <- Raw data  
    \-- rmd                   <- R markdown documents
        +-- 01_read.Rmd       <- Script to read in raw data and do basic cleaning   
        +-- 02_analysis.Rmd   <- main analysis, advanced cleaning, data modeling and polishing charts 
        +-- 03_final.Rmd      <- final file with polished graphs and results description for client 
        +-- 04_convert_pdfs_to_pngs.Rmd <- not used
        +-- 03_final_files/figure-html  <- figures as PNG
    \-- scripts               <- scripts folder for everything else. 
        +-- render_upload.R   <- uploading final HTML file to website
    +-- doc                   <- not used    
    +-- study_name.Rproj
    +-- README.md             
    +--.gitgnore              


