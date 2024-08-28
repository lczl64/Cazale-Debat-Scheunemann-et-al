##################
###  PART - 1  ###   
##################

rm(list=ls()) 
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/motioncontrols/tracker/.txt",h=T,sep="\t",na.strings = "NA",stringsAsFactors=T)

str(data)
data$vel[data$vel < 4] ="" 
is.na(data$vel) <- data$vel == ""

bef<-subset(data, state=='bef' & FR<=828)
aft<-subset(data, state=='aft' & FR<=828)

bef$vel<-as.numeric(bef$vel)
aft$vel<-as.numeric(aft$vel)

a<-aggregate(bef$vel~bef$fly.no, FUN=mean)
b<-aggregate(aft$vel~aft$fly.no, FUN=mean)

test<-cbind(a[1],b[1])

as.matrix(changefold<-  (b[,2] - a[,2]))


#calculate the delta. copy the results and paste it in the foldchange excel. 
#do ot forget to save a copy as .txt for importing the data (see below)




##################
###  PART - 2  ###   
##################

rm(list=ls())
library(conover.test)
library(multcomp)
library(beeswarm)
data<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/motioncontrols/foldchange.txt",h=T,sep="\t",na.strings = "NA", stringsAsFactors=T)
attach(data)

gal4line<- data$
uasline <- data$
xp_line <- data$ 

	

#setwd("/Users/lauriecazaledebat/OneDrive/Documents/Post_doc/Rplot/escape/foldechange") # path toward where to save the plot
setwd("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/Rplot/escape/foldechange") # path toward where to save the plot

title<-".pdf"

quartz(title=title,width=10, height=12) # title is your genotype+experimental conditions
boxplot(gal4line,
        uasline, 
        xp_line,
        las=1,
        frame=F,
        ylab="Δ walking speed (mm/sec)",
        names=c("Gal4", "UAS", "XP"))

abline(h=0, col="red", lty=2,lwd=2)

beeswarm(list(gal4line,
              uasline, 
              xp_line),
         
         add=T,
         corral="wrap",
         at=c(1,2,3))


text(x= 1, y= (max(gal4line, na.rm = T)+2), labels= "")
text(x= 2, y= (max(uasline,  na.rm = T)+2), labels= "")
text(x= 3, y= (max(xp_line,  na.rm = T)-2), labels= "")



kruskal.test(list
             (gal4line,
               uasline, 
               xp_line))


x <- c(gal4line,
       uasline,
       xp_line)

g <- factor(rep(1:3, c(length(gal4line),
                       length(uasline),
                       length(xp_line))),
            
            labels = c("gal4line",
                       "uasline",
                       "xp_line"))




conover.test(x,g,method="bonferroni", list=T )

mtext(title, side = 3, line = 2.5, outer = TRUE, cex = 1.5,adj=0.5, font=2)
quartz.save(file=title, type = "pdf", device = dev.cur(), dpi = 100)
dev.off()


        