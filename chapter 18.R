#install and load ggplot2 package
install.packages("ggplot2")
library("ggplot2")

#looking at layers
ggplot(faithful,aes(x=eruptions,y=waiting))+
  geom_point()+
  stat_smooth()

#creating a bar chart

#histogram
ggplot(quakes,aes(x=depth))+geom_bar()
ggplot(quakes,aes(x=depth))+geom_bar(binwidth=50)

#bar chart
quakes.agg<-aggregate(mag~round(depth,-1),data=quakes,
                      FUN=length)
names(quakes.agg)<-c("depth","mag")
ggplot(quakes.agg,aes(x=depth,y=mag))+
  geom_bar(stat="identity")

#making a scatterplot
ggplot(quakes,aes(x=long,y=lat))+geom_point()

#creating line charts
ggplot(longley,aes(x=Year,y=Unemployed))+geom_line()

#binning data
ggplot(quakes,aes(x=depth))+geom_bar(binwidth = 50)
ggplot(quakes,aes(x=depth))+stat_bin(binwidth = 50)

#smoothing data
p<-ggplot(longley,aes(x=Year,y=Employed))+geom_point()
p
p+stat_smooth()
p+stat_smooth(method="lm")

#adding facets
m<-ggplot(mtcars,aes(x=hp,y=mpg))+geom_point()
m
m+stat_smooth(method="lm")+facet_grid(~cyl)

#changing options
ggplot(mtcars,aes(x=hp,y=mpg))+geom_point(color="red")+
  xlab("Performance (horse power")+
  ylab("Fuel comsumption (mpg)")+
  ggtitle("Motor car comparison")

#working with scales
t<-ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(shape=factor(cyl),colour=factor(cyl)))
t
t+
  scale_shape_discrete(name="Cylinders")+
  scale_color_discrete(name="Cylinders")