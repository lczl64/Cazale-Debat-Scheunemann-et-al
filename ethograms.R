rm(list=ls())
alldata_BD<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/ethograms/lisa_quantification/original.spreadsheet/analysisframeV2/Ethogramm_bending_V2.txt",h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)




# Create a new Quartz window
quartz()

# Create a vector of column indices from 2 to 10
columns <- 2:11

# Calculate the number of rows and columns for the layout
num_rows <- ceiling(length(columns) / 4)
num_cols <- min(length(columns), 4)

# Set the layout of the plots
par(mfrow = c(num_rows, num_cols))

# Iterate over each column index
for (i in columns) {
  # Plot column i against column 1
  plot(alldata_BD[, i] ~ alldata_BD[, 1],
       type = 'h',
       lty = 1,
       col = 'darkblue',
       frame = FALSE,
       main = paste0('Column ', i),
       ylim=c(0,1))
}






