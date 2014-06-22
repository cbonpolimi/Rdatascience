README on the script run_analysis.R 
============


I used the packages sqdf,plyr

First I read all the files, giving them the names rawtest,rawtrain etc..

then I add a new column for subject data on both rawtest and rawtrain
then I add a new column for category data( wether it's test or train data), on both rawtest and rawtrain
then I add a new column for activities data( 1:6), on both rawtest and rawtrain

then I add a new column to features data for labels subject, activity, and category)



Finally I merged the dataframe of features with the rawdata so that each coulmn has a name
and then I merged test and train data using rbind 

in the end I subset the "new" dataframe to find only column with mean  


But since it takes also meanFreq() value I had to filter the data excluding those that were Freq

and in the ned I made another dataframe only for standard deviation



