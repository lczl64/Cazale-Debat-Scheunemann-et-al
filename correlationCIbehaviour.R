rm(list=ls())
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/courtscape/Data_courtscape/.txt",h=T,sep="\t",na.strings = "NA")
attach(data)
library(beeswarm)
library(conover.test)



boxplot(data$CI[which(data$behav_before_threat=='orientated')],
        data$CI[which(data$behav_before_threat=='tapping')],
        data$CI[which(data$behav_before_threat=='wings_xt')],
        data$CI[which(data$behav_before_threat=='licking')],
        data$CI[which(data$behav_before_threat=='attemptcop_bending')], 
        frame=F,
        las=1,
        ylab='courtship index')


beeswarm(list(data$CI[which(data$behav_before_threat=='orientated')],
              data$CI[which(data$behav_before_threat=='tapping')],
              data$CI[which(data$behav_before_threat=='wings_xt')],
              data$CI[which(data$behav_before_threat=='licking')],
              data$CI[which(data$behav_before_threat=='attemptcop_bending')]),
         
         add=T,
         corral="wrap")


length(data$CI[which(threat=='ETNT')])
length(data$CI[which(threat=='LTNT')])
length(data$CI[which(threat=='LLTNT')])

length(data$CI[which(threat=='ET')])
length(data$CI[which(threat=='LT')])
length(data$CI[which(threat=='LLT')])
