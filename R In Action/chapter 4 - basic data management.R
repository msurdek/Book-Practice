#a working example
manager<-c(1,2,3,4,5)
date<-c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country<-c("US","US","UK","UK","UK")
gender<-c("M","F","F","M","F")
age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)
leadership<-data.frame(manager,date,country,gender,age,
                       q1,q2,q3,q4,q5,stringsAsFactors = FALSE)
#creating new variables
mydata<-data.frame(x1=c(2,2,6,4),
                   x2=c(3,4,2,8))
transform.mydata<-transform(mydata,sumx=x1+x2,meanx=(x1+x2)/2)
#recoding variables
leadership$age[leadership$age == 99]<-NA
leadership$agecat[leadership$age>75]<-"Elder"
leadership$agecat[leadership$age>=55&leadership$age<=75]<-"Middle Aged"
leadership$agecat[leadership$age<55]<-"Young"
#recoding variables (cont.)
leadership<-within(leadership,{
  agecat <- NA
  agecat[age>75]<-"Elder"
  agecat[age>=55&age<=75]<-"Middle Aged"
  agecat[age<55]<-"Young"})
#renaming variables
fix(leadership)
#renaming variables (cont.)
names(leadership)[1]<-"managerID"
names(leadership)[2]<-"testDate"
names(leadership)[6:10]<-c("item1","item2","item3","item4","item5")
#renaming variables (cont.2)
install.packages("plyr")
library(plyr)
leadership<-rename(leadership,c(manager="managerID",date="testDate"))
#missing values
y<-c(1,2,3,NA)
is.na(y)
is.na(leadership[,6:10])
#recoding values to missing
leadership$age[leadership$age == 99]<-NA
#excluding missing balues from analyses
x<-c(1,2,NA,3)
y<-x[1]+x[2]+x[3]+x[4]
z<-sum(x)
y
z
y<-sum(x,na.rm=TRUE)
y
#using na.omit to delete incomplete observations
newdata<-na.omit(leadership)
newdata
#date values
mydates<-as.Date(c("2007-06-22","2004-02-13"))
strDates<-c("01/05/1965","08/16/1975")
dates<-as.Date(strDates,"%m/%d/%Y")
#date values (cont.)
myformat<-"%m/%d/%y"
leadership$testDate<-as.Date(leadership$testDate,myformat)
#date values (cont.2)
Sys.Date()
date()
today<-Sys.Date()
format(today,format="%B %d %Y")
format(today,format="%A")
#date values (cont.3)
startdate<-as.Date("2004-02-13")
enddate<-as.Date("2011-01-22")
days<-enddate-startdate
days
#date values (cont.4)
today<-Sys.Date()
dob<-as.Date("1956-10-12")
difftime(today,dob,units="weeks")
#date values (cont.5)
format(dob,format="%A")
#converting dates to character variables
strDates<-as.character(dates)
#type conversions
a<-c(1,2,3)
is.numeric(a)
is.vector(a)
is.character(a)
a<-as.character(a)
is.numeric(a)
is.vector(a)
is.character(a)
#sorting data
newdata<-leadership[order(leadership$age),]
#sorting data (cont.)
attach(leadership)
newdata<-leadership[order(gender,age),]
detach(leadership)
#sorting data (cont.2)
attach(leadership)
newdata<-leadership[order(gender,-age),]
detach(leadership)
#merging data sets
#adding columns
total<-merge(dataframeA,dataframeB,by="ID")
total<-merge(dataframeA,dataframeB,by=c("ID","Country"))
cbind(A,B)
#adding rows
total<-rbind(dataframeA,dataframeB)
#subsetting datasets
#selecting variables
newdata<-leadership[,6:10]
#selecting variables (cont.)
myvars<-c("item1","item2","item3","item4","item5")
newdata<-leadership[myvars]
#selecting variables (cont.2)
myvars<-paste("item",1:5,sep="")
newdata<-leadership[myvars]
#excluding variables
myvars<-names(leaderships) %in% c("item3","item4")
newdata<-leadership[!myvars]
#excluding variables (cont.)
newdata<-leadership[c(-8,-9)]
#selecting observations
newdata<-leadership[1:3,]
#selecting observations (cont.)
newdata<-leadership[leadership$gender=="M"&leadership$age>30,]
#selecting observations (cont.2)
attach(leadership)
newdata<-leadership[gender=='M'&age>30,]
detach(leadership)
#selecting observations (cont.3)
leadership$testDate<-as.Date(leadership$testDate,"%m/%d/%y")
startdate<-as.Date("2009-01-01")
enddate<-as.Date("2009-12-31")
newdata<-leadership[which(leadership$testDate>=startdate &
                            leadership$testDate<=enddate),]
#the subset function
newdata<-subset(leadership,age>=35|age<24,
                select=c(item1,item2,item3,item4))
#the subset function (cont.)
newdata<-subset(leadership,gender=="M",age>25,
                select=gender:item4)
#random samples
mysample<-leadership[sample(1:nrow(leadership),3,replace=FALSE),]
#using SQL statements to manipulate data frames
install.packages("sqldf")
library(sqldf)
newdf<-sqldf("select * from mtcars where carb=1 order by mpg",
             row.names=TRUE)
newdf
#using SQL statements to manipulate data frames (cont.)
sqldf("select avg(mpg) as avg_mpg, avg(disp) as avg_disp, gear
      from mtcars where cyl in (4,6) group by gear")
