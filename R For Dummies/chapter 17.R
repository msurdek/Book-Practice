#create plottable data from mtcars
transform.mtcars<-transform(mtcars,
                            cyl=factor(cyl),
                            am=factor(am,labels=c("Automatic","Manual")),
                            cars=rownames(mtcars))
#load latticve
library(lattice)
#plot faceted by cyl with trend lines
xyplot(mpg~hp|cyl,data=transform.mtcars,
       type=c("p","r"))
#change plot options
#adding titles and labels
xyplot(mpg~hp|cyl,data=transform.mtcars,
       type=c("p","r"),
       main="Fuel economy vs. Performance",
       xlab="Performance (horse power",
       ylab="Fuel economy (mpg)")
#changing font size of title and labels
xyplot(mpg~hp|cyl,data=transform.mtcars,
       type=c("p","r"),
       main=list(
         "Fuel economy vs. Performance given Number of Cylinders",
         cex=0.75),
       xlab=list(
         "Performance (horse power)",
         cex=0.75),
       ylab=list(
         "Fuel economy (mpg)",
         cex=0.75),
       scales=list(cex=0.5))
#using themes to modify plots
xyplot(mpg~hp|cyl, data=transform.mtcars,
       type = c("p","r"),
       par.settings = simpleTheme(col="red", col.line="blue"))
#making a bar chart
barchart(cars~mpg|cyl,data=transform.mtcars,
         main="barchart",
         scales=list(cex=0.5),
         layout=c(3,1))
#making a box and whisker plot
bwplot(~hp|cyl,data=transform.mtcars,main="bwplot")
#plotting data in groups
str(longley)
library(reshape2)
mlongley<-melt(longley,id.vars="Year")
str(mlongley)
xyplot(value~Year|variable,data=mlongley,
       layout=c(6,1),
       par.strip.text=list(cex=0.5),
       scales=list(cex=0.5))
#creating a chart with different groups
barchart(cars~mpg|cyl,data=transform.mtcars,
         group=am,
         scales=list(cex=0.5),
         layout=c(3,1))
#adding a key
plot.colours<-c("grey80","grey20")
barchart(cars~mpg|cyl,data=transform.mtcars,
         main="barchart with groups",
         group=am,
         auto.key=TRUE,
         par.settings=simpleTheme(col=plot.colours,border=plot.colours),
         scales=list(cex=0.5),
         layout=c(3,1))
#printing and saving a lattice plot
my.plot<-xyplot(mpg~hp|cyl,data=transform.mtcars)
class(my.plot)
print(my.plot)
trellis.device(device="png",filename="xyplot.png")
print(my.plot)
dev.off()