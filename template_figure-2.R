rm(list=ls())
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/courtscape/screen/text/.txt",h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)



#install.packages("beeswarm")
#install.packages("conover.test")
#install.packages("rstatix")
library(beeswarm)
library(conover.test)


#setwd("/Users/lauriecazaledebat/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/Rplot")
setwd("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/Rplot")

title<-"data.pdf"

data$newvar <- character(nrow(data))
data$newvar[data$line == ""]      <- "gal4line"       
data$newvar[data$line == ""]       <- "uasline"       
data$newvar[data$line == ""] <- "xp_line"       
attach(data)


quartz(title="title",width=10, height=12)
par(mfrow=c(2,2) ,xpd=TRUE, 
    oma = c(0, 1, 6, 0),
    mex = 0.7,
    mar=c(3,6,0,3))




plot.new()
legend("topleft",
       box.lty=0,
       legend=c("No threat","Early threat"),
       fill=c("white","grey"),
       border="black",
       title="Threat",
       title.adj = 0,
       cex=1.5)


#####Indexes -------

# Courtship----

boxplot( CI[which(threat=="ETNT" & newvar=="gal4line")],
         CI[which(threat=="ET"   & newvar=="gal4line")],
         
         CI[which(threat=="ETNT" & newvar=="uasline")],
         CI[which(threat=="ET"   & newvar=="uasline")],
         
         CI[which(threat=="ETNT" & newvar=="xp_line")],
         CI[which(threat=="ET"   & newvar=="xp_line")],
         
         ylab="Courtship index",  
         frame=F, 
         ylim=c(0,100), 
         col=c("white","grey"), 
         las=1,
         at=c(1,2,4,5,7,8),
         cex.axis=1.3,
         cex.lab=1.5,
         cex.names=1.2,
         names=c("                  Gal4line/+","",
                 "             UASline/+","",
                 "            XP_line",""))

text(x= 1, y= 102.5, labels= "x")
text(x= 2, y= 102.5, labels= "x")
text(x= 4, y= 102.5, labels= "x")
text(x= 5, y= 102.5, labels= "x")
text(x= 7, y= 102.5, labels= "x")
text(x= 8, y= 102.5, labels= "x")




beeswarm(list(CI[which(threat=="ETNT" & newvar=="gal4line")],
              CI[which(threat=="ET"   & newvar=="gal4line")],
              
              CI[which(threat=="ETNT" & newvar=="uasline")],
              CI[which(threat=="ET"   & newvar=="uasline")],
              
              CI[which(threat=="ETNT" & newvar=="xp_line")],
              CI[which(threat=="ET"   & newvar=="xp_line")]),
         
         add=T,
         corral="wrap",
         at=c(1,2,4,5,7,8))



 # Freezing----
boxplot( DI[which(threat=="ETNT" & newvar=="gal4line")],
         DI[which(threat=="ET"   & newvar=="gal4line")],
         
         DI[which(threat=="ETNT" & newvar=="uasline")],
         DI[which(threat=="ET"   & newvar=="uasline")],
         
         DI[which(threat=="ETNT" & newvar=="xp_line")],
         DI[which(threat=="ET"   & newvar=="xp_line")],
    
         ylab="Defensive index",  
         frame=F, 
         ylim=c(0,100), 
         col=c("white","grey"), 
         las=1,
         at=c(1,2,4,5,7,8),
         cex.axis=1.3,
         cex.lab=1.5,
         cex.names=1.2,
         names=c("                  Gal4line/+","",
                 "             UASline/+","",
                 "            XP_line",""))

text(x= 1, y= 102.5, labels= "x")
text(x= 2, y= 102.5, labels= "x")
text(x= 4, y= 102.5, labels= "x")
text(x= 5, y= 102.5, labels= "x")
text(x= 7, y= 102.5, labels= "x")
text(x= 8, y= 102.5, labels= "x")

beeswarm(list(DI[which(threat=="ETNT" & newvar=="gal4line")],
              DI[which(threat=="ET"   & newvar=="gal4line")],
              
              DI[which(threat=="ETNT" & newvar=="uasline")],
              DI[which(threat=="ET"   & newvar=="uasline")],
              
              DI[which(threat=="ETNT" & newvar=="xp_line")],
              DI[which(threat=="ET"   & newvar=="xp_line")]),
         
         add=T,
         corral="wrap",
         at=c(1,2,4,5,7,8))



 mtext(title, side = 3, line = 2.5, outer = TRUE, cex = 1.5,adj=0.5, font=2)
 quartz.save(file=title, type = "pdf", device = dev.cur(), dpi = 100)
 dev.off()

  
 