## Cleaning Data project

### Introduction

This project is my work to answer the last assignement of the Coursera course "Getting and cleaning data".

The goal is to take data from the Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), extract some variables and output a clean dataset from this data. 

### Files description 

In this project you will find the following files :
* run_analysis.R : R script. All the transformations are done automatically when executing this file 
* CodeBook.md : describe the data set output from run_analysis.R and its variables. Also
explains the transformations done from the HAR data set to this output

After running run_analysis.R you will find the data set :
* meanMotionRecords.txt : a text file, containing space separated values.

### Howto run

Extract the HAR data from this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. the "UCI HAR Dataset" directory must be in the same directory as the script run_analysis.R.
Run run_analysis.R in R, it will output the data set meanMotionRecords.txt
