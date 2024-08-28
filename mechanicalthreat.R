rm(list=ls())
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/courtscape/screen/text/soundxp_all.txt",
                 h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)

attach(data)
library(beeswarm)

quartz()

line1 <- factor(line, levels = c("CS",
                                 "LC16SPLITGAL4_UASTNT",
                                 "LC16SPLITGAL4_PLUS",
                                 "R23E12-AD_TRH-DBD_UASTNT",
                                 "R23E12-AD_TRH-DBD_PLUS",
                                 "P1_GalphaiRNAi_34924BL",
                                 "P1_PLUS",
                                 "UAS_PLUS",
                                 "UASRNAiGalphai_BL34924_PLUS"))
                               

threat1<- factor(threat, levels=c('ETNT','ET'))

boxplot(CI ~ reorder(line1, line1) * reorder(threat1, threat1),
        ylim = c(0, 100),
        frame = FALSE,
        las = 1,
        ylab = "courtship index",
        ylim = c(0, max(CI[which(threat == "ET")])), 
        las=1)

beeswarm(CI ~ reorder(line1, line1) * reorder(threat1, threat1), 
         add=T, 
         wrap=T)




wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='CS' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='LC16SPLITGAL4_UASTNT' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='LC16SPLITGAL4_PLUS' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='UAS_PLUS' & threat=='ET')])

wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='R23E12-AD_TRH-DBD_UASTNT' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='R23E12-AD_TRH-DBD_PLUS' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='P1_GalphaiRNAi_34924BL' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='P1_GalphaiRNAi_40890BL' & threat=='ET')])
wilcox.test(CI[which(line=='CS' & threat=='ETNT')],CI[which(line=='P1_PLUS' & threat=='ET')])



