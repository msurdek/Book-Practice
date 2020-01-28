> baskets.of.Granny <- c(12,4,4,6,9,3)
> baskets.of.Geraldine <- c(5,3,2,2,12,9)
> Granny.money <- baskets.of.Granny*120
> Grealdine.money <- baskets.of.Geraldine*145
> Granny.money + Geraldine.money
Error: object 'Geraldine.money' not found
> Geraldine.money <- baskets.of.Geraldine*145
> Granny.money + Geraldine.money
[1] 2165  915  770 1010 2820 1665
> baskets.of.Granny*120+baskets.of.Geraldine*145
[1] 2165  915  770 1010 2820 1665
> 4+2*3
[1] 10
> (4+2)*3
[1] 18
> log(1:3)
[1] 0.0000000 0.6931472 1.0986123
> log(1:3, base = 6)
[1] 0.0000000 0.3868528 0.6131472
> log2(1:3)
[1] 0.000000 1.000000 1.584963
> x <- log(1:3)
> exp(x)
[1] 1 2 3
> 1000^2
[1] 1e+06
> 1.33e4
[1] 13300
> 4.12e-2
[1] 0.0412
> 1.2e6/2e3
[1] 600
> round(123.456, digits = 2)
[1] 123.46
> round(-123.456, digits = -2)
[1] -100
> round(1234, digits = -3)
[1] 1000
> signif(-123.456,digits=4)
[1] -123.5
> floor(123.45)
[1] 123
> floor(-123.45)
[1] -124
> ceiling(123.45)
[1] 124
> ceiling(-123.45)
[1] -123
> trunc(123.65)
[1] 123
> trunc(-123.45)
[1] -123
> cos(120)
[1] 0.814181
> cos(120*pi/180)
[1] -0.5
> '+'(2,3)
[1] 5
> 2/0
[1] Inf
> 4-inf
Error: object 'inf' not found
> 4-Inf
[1] -Inf
> is.finite(10^(305:310))
[1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE
> Inf/Inf
[1] NaN
> NaN+4
[1] NaN
> is.finite(NaN)
[1] FALSE
> is.infinite(NaN)
[1] FALSE
> x<-NA
> x+4
[1] NA
> log(x)
[1] NA
> is.na(x)
[1] TRUE
> str(baskets.of.Granny)
num [1:6] 12 4 4 6 9 3
> length(baskets.of.Granny)
[1] 6
> authors <- c("Andrie","Joris")
> str(authors)
chr [1:2] "Andrie" "Joris"
> is.numeric(baskets.of.Granny)
[1] TRUE
> is.integer(baskets.of.Granny)
[1] FALSE
> seq(from=4.5,to=2.5,by-0.5)
Error in by - 0.5 : non-numeric argument to binary operator
> seq(from=4.5,to=2.5,by=-0.5)
[1] 4.5 4.0 3.5 3.0 2.5
> seq(from=-2.7,to=1.3,length.out=9)
[1] -2.7 -2.2 -1.7 -1.2 -0.7 -0.2  0.3  0.8  1.3
> seq(4.5,2.5,-0.5)
[1] 4.5 4.0 3.5 3.0 2.5
> all.baskets <- c(baskets.of.Granny,baskets.of.Geraldine)
> all.baskets
[1] 12  4  4  6  9  3  5  3  2  2 12  9
> rep(c(0,0,7),times=3)
[1] 0 0 7 0 0 7 0 0 7
> rep(c(2,4,2),each=3)
[1] 2 2 2 4 4 4 2 2 2
> rep(c(0,7),times=c(4,2))
[1] 0 0 0 0 7 7
> rep(c(1:3),length.out=7)
[1] 1 2 3 1 2 3 1
> numbers <- 30:1
> numbers
[1] 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6
[26]  5  4  3  2  1
> numbers[5]
[1] 26
> numbers[c(5,11,3)]
[1] 26 20 28
> indices <- c(5,11,3)
> numbers[indices]
[1] 26 20 28
> numbers[-3]
[1] 30 29 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5
[26]  4  3  2  1
> numbers[-(1:20)]
[1] 10  9  8  7  6  5  4  3  2  1
> baskets.of.Granny[3]<-5
> baskets.of.Granny
[1] 12  4  5  6  9  3
> baskets.of.Geraldine[c(2,4)]<-4
> baskets.of.Geraldine
[1]  5  4  2  4 12  9
> Granny.copy<-baskets.of.Granny
> baskets.of.Granny[4]<-11
> baskets.of.Granny
[1] 12  4  5 11  9  3
> baskets.of.Granny<-Granny.copy
> baskets.of.Granny
[1] 12  4  5  6  9  3
> baskets.of.Granny>5
[1]  TRUE FALSE FALSE  TRUE  TRUE FALSE
> which(baskets.of.Granny>5)
[1] 1 4 5
> the.best <- baskets.of.Geraldine<baskets.of.Granny
> which(the.best)
[1] 1 3 4
> baskets.of.Granny[the.best]
[1] 12  5  6
> x<-c(3,6,1,NA,2)
> x[x>2]
[1]  3  6 NA
> x>2
[1]  TRUE  TRUE FALSE    NA FALSE
> min.baskets<-baskets.of.Granny==min(baskets.of.Granny)
> max.baskets<-baskets.of.Granny==max(baskets.of.Granny)
> min.baskets
[1] FALSE FALSE FALSE FALSE FALSE  TRUE
> max.baskets
[1]  TRUE FALSE FALSE FALSE FALSE FALSE
> min.baskets|max.baskets
[1]  TRUE FALSE FALSE FALSE FALSE  TRUE
> x[!is.na(x)]
[1] 3 6 1 2
> x==na
Error: object 'na' not found
> sum(the.best)
[1] 3
> 
  > any(the.best)
[1] TRUE
> all(the.best)
[1] FALSE
> min(baskets.of.Granny)
[1] 3
> max(baskets.of.Granny)
[1] 12
> sum(baskets.of.Granny,baskets.of.Geraldine)
[1] 75
> x<-c(3,6,2,NA,1)
> sum(x)
[1] NA
> sum(x,na.rm=TRUE)
[1] 12
> cumsum(baskets.of.Granny)
[1] 12 16 21 27 36 39
> rm(baskets.of.granny)
> cumprod(baskets.of.Granny)
[1]    12    48   240  1440 12960 38880
> cummax(baskets.of.Granny)
[1] 12 12 12 12 12 12
> cummin(x)
[1]  3  3  2 NA NA
> cummax(baskets.of.Geraldine)
[1]  5  5  5  5 12 12
> diff(baskets.of.Granny)
[1] -8  1  1  3 -6
> diff(x)
[1]  3 -4 NA NA
> Granny.pointers<-c(10,2,4,0,4,1,4,2,7,2,1,2)
> points<-Granny.pointers*c(2,3)
> points
[1] 20  6  8  0  8  3  8  6 14  6  2  6
> sum(points)
[1] 87
> round(diff(baskets.of.Granny)/baskets.of.Granny*100)
[1]  -67   25   20   50  -67 -267
Warning message:
  In diff(baskets.of.Granny)/baskets.of.Granny :
  longer object length is not a multiple of shorter object length
> round(diff(baskets.of.Granny)/baskets.of.Granny[1:5]*100)
[1] -67  25  20  50 -67
> save(chapter 4,file="chapter 4.rda")
Error: unexpected numeric constant in "save(chapter 4"
> save(vectors,file="chapter 4.rda")
Error in save(vectors, file = "chapter 4.rda") : 
  object ‘vectors’ not found
> save(file="chapter 4.rda")
Warning message:
  In save(file = "chapter 4.rda") : nothing specified to be save()d