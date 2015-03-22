# Getting-and-Cleaning-Data-Course-Project
This document describe the script in run_analysis.R

1. Download and unpack files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Read x-files into tables and union the data from the tables.
3. Filter out columns that are not about std and mean.
4. Add names to the columns from the features file.
5. Union the y-train and y-test table and join it with activity table.
6. Add the activity name to the data-table.
7. Add subject to data-table.
8. Write the data to a csv file.
9. Group on subject and activty and calculate mean.
10. Write the data with the mean values to a csv-file.
