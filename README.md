Getting-n-Cleaning-Data-Project
===============================


## getdata-016

In order to run the script you need the R installed and configured

You will also need to install two packages

    install.packages('reshape')
    install.packages('plyr')

#### Running the script

	## first step is clonning the repo
	git clone https://github.com/danielsan/Getting-n-Cleaning-Data-Project

	## entering the directory
	cd 

	## downloading the zip file in the same directory
	wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

	## unzip the file
	unzip "getdata-projectfiles-UCI HAR Dataset.zip"

	## finally running the code
	Rscript ./run_analysis.R

It will generate a file called output.txt