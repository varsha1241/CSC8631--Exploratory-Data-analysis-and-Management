---
output:
  pdf_document: default
  html_document: default
---
# courseWorkCS8631
Project Title: Cyber Security: Safety At Home, Online, and in Life

Project Overview:

This project investigates and provides insights on the dataset collected for the Cyber Security: (Safety At Home, Online, and in Life) course developed by Newcastle University and offered by the Future Learn Platfrom which is a massive 
open online course (MOOC). The course is 3 weeks long and was free to access. So we have to come up with two research question, and carry out our analysis by implement CRISP-DM and follow the steps to find a solution for the research question.
Two cycles of CRISP-DM is carried out for this project.

Repository Overview:


Directory structure:

The repository is named as 'courseWorkCS8631', it has the following files

data -> this data folder has all the raw datafiles of the futurelearn 
cache -> cache has the pre-processed and intermediate datas
munge -> munge folder has the files realted to the pre-processing steps 
    
    1. 01-dataCleaning.R
    2. 02-dataIntegration.R
    3. 03-dataTransformation.R
    
graphs -> this folder has all the images of the visualisations that are ploted for the dataset for analysis purpose
report -> this folder has the analysis report which needed to be knited to visualise the output pdf of the report, and here is the main analysis is stored
    Analysis.Rmd
    Analysis.pdf
    
The README.md file has all the basic information about the project installation and also about the file structure.
The gitlogdata.txt has the git commit history with which we can understand at which stage what all files and actions were carried out

The overall structure looks like 
> courseWorkCS8631
    |_ cache > Intermediate dataset
    |_ data > Raw data files
    |_ gitlogdata.txt
    |_ graphs > images of the visualisations
    |_ munge > files related to pre processing of raw data
    |_ README.md
    |_ reports > the main analysis 
    
Applicable Instruction:

Setup Instruction:

You will need Rstdio to execute this , so there is an attached link given below which you ca follow to install the R stdios based on your operating system

https://rstudio-education.github.io/hopr/starting.html
https://teacherscollege.screenstepslive.com/a/1135059-install-r-and-rstudio-for-mac

After installing the Rstudio and R in your system, Now proceed with the below instructions

Execution Instruction:

If u have not used RStudio before and setting it up new, the below instructions are better for a new user
 
1. download the zip file and extract all the files into a new folder in your desired destination 
2. open r studio in your system and file -> open project and select the directory in which you have extracted the project folder

xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun

If you are facing this issue in MacOs then you need to execute the below command in your Rstudio terminal and grant permission
 the command is : xcode-select --install

Next you will have to ,

1. On top you will be able to see a warning , If it says any of the package is not installed and ask you to install kindly install it, If not I request to execute the command 
The warning  pop up with saying 'Rendering Rmarkdown documents required to updated version of the following packages , do you want to instal it ?" give an yes to it.
    install.packages("package name")
    library(packagename)
    renv::snapshot()
    renv::status()
2. open the report folder -> choose the analysisReport.rmd file
3. After this navigate to the reports folder -> AnalysisReport.pdf and knit it to pdf
4. Now, in the top section below the file name , there will be an option to knit the file (8th option) click it and choose knit to pdf and wait for it to generate a pdf file with the visualisations.
If it throws an error as tinytex is not there and asks you run the command 
install.packages("tinytex")
tinytex::install_tinytex()
 
and now again try knitting it , you will see the render will start downloading and once the execution completes you will be able to see a pdf file opening.

If u still face any issues you can try this command tinytex::reinstall_tinytex() and execute it and again knit it and check.

Additional resources: 
For more details about ProjectTemplate, see http://projecttemplate.net

If u still face any more issues, some problems faced when trying to execute in other system , and it solutions are given below

1.run the command install.packages("ProjectTemplate") and choose 'Y' when it asks you with a prompt after its successfully completed.
2.run renv::snapshot() and give 'Y' when it asks for permission and after it successfully executed.
3.run renv::status() to verify if there are no issues found -- the project is in consistent state.
4.After this navigate to the reports folder -> AnalysisReport.pdf and scroll to line number 112 and you will find a green run icon , execute it and same process for line number 116
and you will find few packages getting installed wait for the process to complete.
 
knitr::opts_chunk$set(echo = TRUE)  # Disable caching globally
knitr::opts_knit$set(root.dir = normalizePath(".."))
library(ProjectTemplate)
load.project()

the above lines need to be executed and it will take some time to install few packages after it downloads everything, then proceed with next steps.
