#checks input and does logit calculation
logit<-function(x){
  x<-ifelse(x<0|x>1,NA,x)
  if(any(is.na(x)))warning("x not between 0 and 1")
  log(x/(1-x))
}
#transforms percentage to number and calls logit
logitpercent<-function(x){
  x<-gsub("%","",x)
  logit(as.numeric(x)/100)
}