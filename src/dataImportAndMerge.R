
sotaOverview<-gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1aocnRPj-2Rhv8bBj7nsG0pHMqVI1H1dWXRvL-5SfYRc/edit#gid=0')
pubs<-gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1aocnRPj-2Rhv8bBj7nsG0pHMqVI1H1dWXRvL-5SfYRc/edit#gid=2120717860')
df<-gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1aocnRPj-2Rhv8bBj7nsG0pHMqVI1H1dWXRvL-5SfYRc/edit#gid=1918185269')
tasks<-gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1aocnRPj-2Rhv8bBj7nsG0pHMqVI1H1dWXRvL-5SfYRc/edit#gid=2009986896')
#sheet https://docs.google.com/spreadsheets/d/1aocnRPj-2Rhv8bBj7nsG0pHMqVI1H1dWXRvL-5SfYRc/edit#gid=676457918 is outdated
library(ggplot2)

df$dps <- as.numeric(df$`Degree Per Second`)
df$FoV<-as.numeric(df$FoV)
df<-df[!df$`Cue Style`=='None',]
df$`Cue Style`<-as.factor(df$`Cue Style`)
df$cueStyle<-as.factor(df$`Cue Style`)

df$Context<-as.factor(df$Context)
df$Task<-as.factor(df$Task)
df[df$Context=='MR' & df$Platform=='Microsoft HoloLens',]$Context<-'AR'

#table(df$`Cue Style`)

#cue style colours
csColors <- as.character(c('1'="#5aae61", '2'="#7b3294"))
csScale <- scale_colour_manual(name="CueStyles", values=csColors)

ggplot(df,aes(x=FoV,y=dps,size=cueStyle, shape=Context,colour=Task,alpha=.2))+geom_point()+theme_bw() 
ggplot(df,aes(x=FoV,y=dps-as.numeric(FoV)/2,size=cueStyle, shape=Context,colour=Task,alpha=.2))+geom_point()+theme_bw() 
table(df$Task)
table(df$Platform)
table(df$`Cue Style`)
         