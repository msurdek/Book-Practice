set.seed(123)
index<-sample(nrow(iris),5)
index
iris[index,]
which(duplicated(iris))
iris[-143,]
complete.cases(airquality)
head(state.x77)
frost<-state.x77[,"Frost"]
head(frost,5)
x<-cut(frost,3,include.lowest = TRUE,labels=c("Low","Med","High"))
table(x)
all.states<-as.data.frame(state.x77)
all.states$Name<-rownames(state.x77)
rownames(all.states)<-NULL
cold.states<-all.states[all.states$Frost>150,c("Name","Frost")]
cold.states
large.states<-all.states[all.states$Area>=100000,c("Name","Area")]
large.states
merge(cold.states,large.states,all=TRUE)
index<-cold.states$Name %in% large.states$Name
index
cold.states[index,]
some.states<-data.frame(Region=state.region,state.x77)
some.states<-some.states[1:10,1:3]
some.states
sort(some.states$Population,decreasing = TRUE)
order.pop<-order(some.states$Population,decreasing = TRUE)
order.pop
some.states$Population[order.pop]
some.states[order(some.states$Population,decreasing = TRUE),]
index<-with(some.states,order(Region,Population))
some.states[index,]
Titanic
str(Titanic)
apply(Titanic,1,sum)
apply(Titanic,3,sum)
apply(Titanic,c(3,4),sum)
lapply(iris,class)
sapply(iris,function(x) if(is.numeric(x)) mean(x) else NA)
tapply(iris$Sepal.Length,iris$Species,mean)
str(mtcars)
cars<-transform(mtcars,
                am = factor(am,levels=0:1,labels=c("Automatic","Manual")))
str(cars)
with(cars,aggregate(mpg,list(gear=gear,am=am),mean))
aov(mpg~gear+am,data=cars)
install.packages("reshape2")
library("reshape2")
goals<-data.frame(
  Game=c("1st","2nd","3rd","4th"),
  Venue=c("Bruges","Ghent","Ghent","Bruges"),
  Granny=c(12,4,5,6),
  Geraldine=c(5,4,2,4),
  Gertrude=c(11,5,6,7)
)
goals
mgoals<-melt(goals,id.vars=c("Game","Venue"))
mgoals
dcast(mgoals,variable~Venue,sum)
library("ggplot2")
ggplot(mgoals,aes(x=variable,y=value,fill=Game))+
      geom_bar(stat="identity")
