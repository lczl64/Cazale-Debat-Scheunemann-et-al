rm(list=ls())
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/revision_progression/binary_table_revision_progression_earlythreat.txt",h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)
attach(data)
library(dplyr)

quartz(title="title",width=10, height=12)
par(mfrow=c(2,1) ,xpd=TRUE, 
    mar=c(3,6,3,3))

# Calculate the percentage of individuals performing 'court' behavior over time
court_percentage <- data %>%
  group_by(time) %>%
  summarize(percentage_court = mean(court))

# Calculate the percentage of individuals performing 'defense' behavior over time
defense_percentage <- data %>%
  group_by(time) %>%
  summarize(percentage_defense = mean(defense))

# Merge the two summaries into a single data frame
result <- merge(court_percentage, defense_percentage, by = "time", all = TRUE)

plot(result$percentage_court ~ result$time, 
     type='l', 
     las=1, 
     frame=F, 
     col='navyblue', 
     ylab='fraction performing behavior', 
     xlab='time (sec)', 
     ylim=c(0,1))
lines(result$percentage_defense ~ result$time, 
      col='forestgreen')


