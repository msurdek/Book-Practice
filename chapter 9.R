priceCalculator<-function(hours,pph=40,client){
  net.price<-hours*pph*ifelse(hours>100,0.9,1)
  VAT<-sapply(client,switch,private=1.12,public=1.06,1)
  tot.price<-net.price*VAT
  round(tot.price)
  }
