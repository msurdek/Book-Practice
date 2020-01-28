install.packages("rfordummies")
library("rfordummies")
elements
?elements
str(elements,vec.len=2)
write.csv(elements,file="elements.csv", row.names=FALSE)
elements<-read.csv("elements.csv")
install.packages("XLConnect")
library("XLConnect")
names(iris)
my.file<-tempfile()
write.csv(iris,file=my.file,row.names=TRUE)
list.files(tempdir())
file.iris<-read.csv(my.file)
