rm(list=ls())
data_crtscp<-read.delim("/Users/cazaledl-admin/Library/CloudStorage/OneDrive-UniversityofBirmingham/Post_doc/XP/data/courtscape/.txt",h=T,sep="\t",na.strings = "NA")
str(data_crtscp)
attach(data_crtscp)




###### EXTRACTION DATAS ###### 
{
ET   <- subset(data_crtscp,threat=="ET")
LT   <- subset(data_crtscp,threat=="LT")
LLT  <- subset(data_crtscp,threat=="LLT")

ENT  <- subset(data_crtscp,threat=="ETNT")  
LNT  <- subset(data_crtscp,threat=="LTNT")  
LLNT <- subset(data_crtscp,threat=="LLTNT") 

ntot_ET. <-nrow(ET)
ntot_ENT <-nrow(ENT)
ntot_LNT <-nrow(LNT)
ntot_LT  <-nrow(LT)
ntot_LLNT<-nrow(LLNT)
ntot_LLT <-nrow(LLT)

  
summary(ET  )
summary(LT  )
summary(LLT )
summary(ENT )
summary(LNT )
summary(LLNT)
}



###### STATISTIQUES ###### 



#Index

kruskal.test(list(
  ENT$CI,
  LNT$CI,
  LLNT$CI,
  ET$CI,
  LT$CI,
  LLT$CI))

x<- as.data.frame.array(cbind(c(ENT$CI,
                                LNT$CI,
                                LLNT$CI,
                                ET$CI,
                                LT$CI,
                                LLT$CI), 
                              c(rep("ENT",length(ENT$CI)),
                                rep("LNT",length(LNT$CI)),
                                rep("LLNT",length(LLNT$CI)),
                                rep("ET",length(ET$CI)),
                                rep("LT",length(LT$CI)),
                                rep("LLT",length(LLT$CI)))))

x[,1]<-as.integer(x[,1])

compare_means(V1~V2,x,p.adjust.method = "bonferroni")





# Freezing ---------------------------------------------------------------




#Index

kruskal.test(list(ENT$DI,
                  LNT$DI,
                  ET$DI,
                  LT$DI,
                  LLT$DI)) 


x2<- as.data.frame.array(cbind(c(ENT$DI,
                                 LNT$DI,
                                 LLNT$DI,
                                 ET$DI,
                                 LT$DI,
                                 LLT$DI), 
                               
                               c(rep("ENT",length(ENT$DI)),
                                 rep("LNT",length(LNT$DI)),
                                 rep("LLNT",length(LLNT$DI)),
                                 rep("ET",length(ET$DI)),
                                 rep("LT",length(LT$DI)),
                                 rep("LLT",length(LLT$DI)))))
x2[,1]<-as.integer(x2[,1])

compare_means(V1~V2,x2,p.adjust.method = "bonferroni")





###### FIGURES ###### 
# courtship ------------------------------------------------------------


boxplot( 
  ENT$CI,
  LNT$CI,
  LLNT$CI,  
  ET$CI,
  LT$CI,
  LLT$CI,
  
  
  at=c(1,2,3,5,6,7),
  ylab="Courtship index",
  col=c("#e5f5e0","#a1d99b","#31a354"),
  frame=F,
  las=2,
  names=c(rep(c("7sec","120sec","240sec"),2))
)

beeswarm(list(
  ENT$CI,
  LNT$CI,
  LLNT$CI,

  
  ET$CI,
  LT$CI,
  LLT$CI),
  add=T, 
  at=c(1,2,3,5,6,7),
  corral="wrap"
)



# defensive behaviour ------------------------------------------------------------


boxplot( 
  ENT$DI,
  LNT$DI,
  LLNT$DI,
  
  
  ET$DI,
  LT$DI,
  LLT$DI,
  
  
  at=c(1,2,3,5,6,7),
  ylab="Defensive index",
  col=c("#e5f5e0","#a1d99b","#31a354"),
  frame=F,
  las=2,
  names=c(rep(c("7sec","120sec","240sec"),2))
)

beeswarm(list(
  ENT$DI,
  LNT$DI,
  LLNT$DI,
  
  ET$DI,
  LT$DI,
  LLT$DI),
  at=c(1,2,3,5,6,7),
  
  add=T, 
  corral="wrap")

