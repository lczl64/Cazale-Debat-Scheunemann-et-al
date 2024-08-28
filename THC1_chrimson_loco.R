rm(list=ls())
library(conover.test)
library(multcomp)
library(beeswarm)
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/motioncontrols/foldchange.txt",h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)
attach(data)


boxplot(cbind(MALE_THC1_CHRIMSON_LIGHTOFF,
              MALE_THC1_CHRIMSON_LIGHTON,
              
              FEMALE_THC1_CHRIMSON_LIGHTOFF,
              FEMALE_THC1_CHRIMSON_LIGHTON), 
        las=1,
        frame=F,
        ylab="Δ walking speed (mm/sec)", 
        at=c(1,2,4,5))

abline(h=0, col="red", lty=2,lwd=2)

beeswarm(list(MALE_THC1_CHRIMSON_LIGHTOFF,
              MALE_THC1_CHRIMSON_LIGHTON, 
              FEMALE_THC1_CHRIMSON_LIGHTOFF,
              FEMALE_THC1_CHRIMSON_LIGHTON),
         
         add=T,
         corral="wrap",
         at=c(1,2,4,5))

wilcox.test(MALE_THC1_CHRIMSON_LIGHTOFF)
wilcox.test(MALE_THC1_CHRIMSON_LIGHTON)
wilcox.test(FEMALE_THC1_CHRIMSON_LIGHTOFF)
wilcox.test(FEMALE_THC1_CHRIMSON_LIGHTON)

wilcox.test(MALE_THC1_CHRIMSON_LIGHTOFF,MALE_THC1_CHRIMSON_LIGHTON)
wilcox.test(FEMALE_THC1_CHRIMSON_LIGHTOFF,FEMALE_THC1_CHRIMSON_LIGHTON)
