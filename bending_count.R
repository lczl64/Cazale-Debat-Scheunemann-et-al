rm(list=ls())
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/ethograms/lisa_quantification/original.spreadsheet/analysisframeV2/Ethogramm_bending_V2.txt",h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)
attach(data)
library(beeswarm)

firstT<-data[1:560,]
secondT<-data[561:1120,]
thirdT<-data[1121:1680,]


# identify_events count ----------------------------------------------------

identify_events <- function(data) {
        # Subset the data to include only columns 
        subset_data <- data[, 2:11]
        
        # Initialize vector to store count of events for each column
        events_count <- numeric(length = ncol(subset_data))
        
        # Iterate over columns
        for (i in 1:ncol(subset_data)) {
                # Initialize flag for event detection
                event_detected <- FALSE
                
                # Iterate over rows
                for (j in 1:nrow(subset_data)) {
                        # Check if current value is 1
                        if (subset_data[j, i] == 1) {
                                # Set flag to indicate event detection
                                event_detected <- TRUE
                        }
                        # Check if current value is 0 and an event was previously detected
                        else if (subset_data[j, i] == 0 && event_detected) {
                                # Increment count for the corresponding column
                                events_count[i] <- events_count[i] + 1
                                
                                # Reset event detection flag
                                event_detected <- FALSE
                        }
                }
        }
        
        # Return the vector with count of events for each column
        return(events_count)
}

events_count_firstT  <- identify_events(firstT)
events_count_secondT <- identify_events(secondT)
events_count_thirdT  <- identify_events(thirdT)


combined_data_count <-      c(events_count_firstT,
                             events_count_secondT, 
                             events_count_thirdT)

combined_dataset <- rep(c("firstT", "secondT", "thirdT"), 
                             each = 10)

combinedcount_dataframe<- data.frame(combined_data_count,combined_dataset)
anova_result1 <- aov(combinedcount_dataframe$combined_data_count ~ combinedcount_dataframe$combined_dataset, data = combinedcount_dataframe)
summary(anova_result1)
posthoc_result <- TukeyHSD(anova_result1)



###############################
############ PLOTS ############
###############################



boxplot(events_count_firstT,
        events_count_secondT,
        events_count_thirdT,
        las = 1,
        frame = FALSE,
        col = c('#C1EDF6', '#6ACEE2', '#0C6779'),
        names = c('first tier', 'second tier', 'third tier'),
        xlab = 'progression (sec)',
        ylab = 'number of bending events', 
        ylim=c(0,max(events_count_secondT)))

