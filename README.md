# Getting & Cleaning data - Course Project

## Introduction
The code in the run_analysis.r file is part of the Course Project of the Getting and Cleaning data course of the data science specialization.
## Objective
Its objective of this code is to summarize the average mean and standard deviation measures per individual (30 in total) and activity (6 different activities), in a way that we only have 1 set of measurements per activity and individual.

## Description of the script
This is achieved by merging 2 datasets, a training and a test component, each composed of the measurement data itself, as well as the subject and the activity they carried out for each of the measurement was done.
The code assumes that only the lower case mean and standard deviations are to be retained as measures. The datasets are first merged and provided with clean and meaningful column headers, then the irrelevant columns are removed from the dataset. The activity numbers are then being translated into directly readable activities, before the dataset is summarized into the required format (a set of 30 subjects x 6 activities, i.e. 180 rows).
Finally, this code assumes that the files to merge are already unzipped in the working directory.

## Repo content
The files included in this repo are:
* this README.md file
* the codebook.md file describing the features kept in the data set.
* the R-script per se in the run_analysis.r file
