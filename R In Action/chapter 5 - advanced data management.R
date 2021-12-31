#mathematical functions
abs(-4)
sqrt(25)
ceiling(3.475)
floor(3.475)
trunc(5.99)
round(3.475,digits=2)
signif(3.475,digits=2)
cos(2)
acos(-0.416)
sinh(2)
asinh(3.627)
log(10)
exp(2.3026)
sqrt(c(4,16,25))

#statistical functions
x<-(c(1,2,3,4))
mean(x)
median(x)
sd(x)
var(x)
mad(x)
quantile(x,c(.3,.84))
range(x)
diff(range(x))
sum(x)
diff(c(1,5,23,29))
min(x)
max(x)
scale(x)

#calculating the mean and standard deviation
x<-c(1,2,3,4,5,6,7,8)
mean(x)
sd(x)

#normal distribution function
x<-pretty(c(-3,3),30)
y<-dnorm(x)
plot(x,y,
     type="l",
     xlab="Normal Deviate",
     ylab="Density",
     yaxs="i")
pnorm(1.96)
qnorm(.9,mean=500,sd=100)
rnorm(50,mean=50,sd=10)

#setting the seed for random number generation
runif(5)
runif(5)
set.seed(1234)
runif(5)
set.seed(1234)
runif(5)

#character functions
x<-c("ab","cde","fghij")
length(x)
nchar(x)
x<-"abcdef"
substr(x,2,4)<-"22222"
x
grep("A",c("b","A","c"))
grep("A",c("b","A","c"),fixed=FALSE)
grep("A",c("b","A","c"),fixed=TRUE)
sub("\\s",".","Hello There")
strsplit("abc","")
paste("x",1:3,sep = "")
paste("Today is",date())
toupper("abc")
tolower("ABC")

#Other Useful Functions
x<-c(2,5,6,9)
length(x)
seq(1,10,2)
rep(1:3,2)
cut(x,3)
pretty(x,3)
name<-c("Jane")
cat("Hello",name,"\n")

#Applying Functions To Matrices And Data Frames
a<-5
sqrt(a)
b<-c(1.243,5.654,2.99)
round(b)
c<-matrix(runif(12),nrow=3)
c
log(c)
mean(c)

mydata<-matrix(rnorm(30),nrow=6)
mydata
apply(mydata,1,mean)
apply(mydata,2,mean)
apply(mydata,2,mean,trim=0.2)

#A Solution For The Data Management Challenge
Student<-c("John Davis","Angela Williams","Bullwinkle Moose",
           "David Jones","Janice Markhammer","Cheryl Cushing",
           "Reuven Ytzrhak","Greg Knox","Joel England",
           "Mary Rayburn")
Math<-c(502,600,412,358,495,512,410,625,573,522)
Science<-c(95,99,80,82,75,85,80,95,89,86)
English<-c(25,22,18,15,20,28,15,30,27,18)
roster<-data.frame(Student,Math,Science,English,stringsAsFactors = FALSE)

z<-scale(roster[,2:4])
score<-apply(z,1,mean)
roster<-cbind(roster,score)

y<-quantile(score,c(.8,.6,.4,.2))
roster$grade[score>= y[1]]<-"A"
roster$grade[score < y[1] & score >= y[2]]<-"B"
roster$grade[score < y[2] & score >= y[3]]<-"C"
roster$grade[score < y[3] & score >= y[4]]<-"D"
roster$grade[score < y[4]]<-"F"

name<-strsplit((roster$Student)," ")
Lastname <- sapply(name,"[",2)
Firstname <- sapply(name,"[",1)
roster<-cbind(Firstname,Lastname,roster[,-1])

roster<-roster[order(Lastname,Firstname),]

roster

#Control Flow
#Repitition and Looping
for(i in 1:10) print("Hello")
i<-10
while(i>0) {print("Hello"); i <- i-1}

#Conditional Execution
#if-else
with(roster,if(!is.factor(grade))grade <- as.factor(grade) else print("Grade already is a factor"))
#ifelse
ifelse(score>0.5,print("Passed"),print("Failed"))
outcome<-with(roster,ifelse(score>0.5,"Passed","Failed"))

#Switch
#A Switch Example
feelings<-c("sad","afraid")
for(i in feelings)
  print(
    switch(i,
           happy="Iam am glad you are happy",
           afraid="There is nothing to fear",
           sad="Cheer up",
           angry="Calm down now")
  )

#User Written Functions
mystats <- function(x,parametric=TRUE,print=FALSE){
  if(parametric){
    center <- mean(x) ; spread <- sd(x)
  } else{
    center <- median(x) ; spread <- mad(x)
  }
  if(print & parametric) {
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center=center,spread=spread)
  return(result)
}
set.seed(1234)
rnorm(500)
y<-mystats(x)
y$center
y$spread
y<-mystats(x,parametric = FALSE,print = TRUE)

#User Written Functions (cont.)
mydate <- function(type="long"){
  switch(type,
         long = format(Sys.time(), "%A %B %d %Y"),
         short = format(Sys.time(), "%m-%d-%y"),
         cat(type, "is not a recognized type\n"))
}
mydate("long")
mydate("short")
mydate("medium")

#Aggregation And Reshaping

#Transpose
#Transposing A Dataset
cars <- mtcars[1:5,1:4]
cars
t(cars)

#Aggregating Data
options(digits=3)
attach(mtcars)
aggdata <- aggregate(mtcars, by=list(cyl,gear), FUN=mean, na.rm=TRUE)
aggdata

#The reshape2 package
library(reshape2)
mydata <- data.frame(ID=c(1,1,2,2),
                 Time=c(1,2,1,2),
                 X1=c(5,3,6,2),
                 X2=c(6,5,1,4))
md <- melt(mydata,id=c("ID","Time"))
md

#Casting
newdata1 <- dcast(md,ID~variable,mean)
newdata1
newdata2 <- dcast(md,Time~variable,mean)
newdata2
newdata3 <- dcast(md,ID~Time,mean)
newdata3
newdata4 <- dcast(md,ID+Time~variable)
newdata4
newdata5 <- dcast(md,ID+variable~Time)
newdata5
newdata6 <- dcast(md,ID~variable+Time)
newdata6
