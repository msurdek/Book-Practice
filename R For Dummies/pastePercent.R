addPercent.numeric <- function(x,mult=100,FUN=round,...){
  percent <- FUN(x*mult)
  paste(percent,"%",sep="")
  }
addPercent.character <- function(x){
  paste(x,"%",sep="")}
addPercent<-function(x,...){UseMethod("addPercent")}