> xd<-as.Date("2016-08-05")
> xd
[1] "2016-08-05"
> str(xd)
Date[1:1], format: "2016-08-05"
> weekdays(xd)
[1] "Friday"
> xd+7
[1] "2016-08-12"
> xd+0:6
[1] "2016-08-05" "2016-08-06" "2016-08-07" "2016-08-08" "2016-08-09"
[6] "2016-08-10" "2016-08-11"
> weekdays(xd+0:6)
[1] "Friday"    "Saturday"  "Sunday"    "Monday"    "Tuesday"   "Wednesday"
[7] "Thursday" 
> startdate<-as.date("2016-01-01")
Error in as.date("2016-01-01") : could not find function "as.date"
> xm<-seq(startdate,by="2 months",length.out=6)
Error in seq(startdate, by = "2 months", length.out = 6) : 
  object 'startdate' not found
> xm
Error: object 'xm' not found
> startdate<-as.Date("2016-01-01")
> xm<-seq(startdate,by="2 months",length.out=6)
> xm
[1] "2016-01-01" "2016-03-01" "2016-05-01" "2016-07-01" "2016-09-01"
[6] "2016-11-01"
> months(xm)
[1] "January"   "March"     "May"       "July"      "September" "November" 
> quarters(xm)
[1] "Q1" "Q1" "Q2" "Q3" "Q3" "Q4"
> as.Date("5 Aug 2016", format= "%d %b %y")
[1] "2020-08-05"
> as.Date("5 Aug 2016", format= "%d %b %Y")
[1] "2016-08-05"
> as.Date("05/8/2016",format="%d/%m/%Y")
[1] "2016-08-05"
> apollo<-"July 20, 1969, 20:17:39"
> apollo.fmt<-"%B %d %Y, %H:%M:%S"
> xct<-as.POSIXct(apollo, format=apollo.fmt,tz="UTC")
> xct
[1] NA
> apollo <- "July 20, 1969, 20:17:39"
> apollo.fmt <- "%B %d, %Y, %H:%M:%S"
> xct <- as.POSIXct(apollo, format = apollo.fmt, tz = "UTC")
> xct
[1] "1969-07-20 20:17:39 UTC"
> format(xct, "%d/%m/%y")
[1] "20/07/69"
> fomat(xct, "%M minutes past %I %p, on %d %B %Y")
Error in fomat(xct, "%M minutes past %I %p, on %d %B %Y") : 
  could not find function "fomat"
> format(xct, "%M minutes past %I %p, on %d %B %Y")
[1] "17 minutes past 08 PM, on 20 July 1969"
> xct+ 7*86400
[1] "1969-07-27 20:17:39 UTC"
> xct + 3*60*60
[1] "1969-07-20 23:17:39 UTC"
> xct - 7*86400
[1] "1969-07-13 20:17:39 UTC"
> as.Date(xct)-7
[1] "1969-07-13"
> Sys.time()
[1] "2019-10-30 23:39:56 EDT"
> Sys.time() < xct
[1] FALSE
> dec.start <- as.POSIXct("1950-01-01")
> dec <- seq(de.start, by = "10 years", length.out = 4)
Error in seq(de.start, by = "10 years", length.out = 4) : 
  object 'de.start' not found
> dec
Error: object 'dec' not found
> dec.start <- as.POSIXct("1950-01-01")
> > dec <- seq(dec.start, by = "10 years", length.out = 4)
Error: unexpected '>' in ">"
> dec
Error: object 'dec' not found
> dec.start <- as.POSIXct("1950-01-01")
> dec <- seq(dec.start, by = "10 years", length.out = 4)
> dec
[1] "1950-01-01 EST" "1960-01-01 EST" "1970-01-01 EST" "1980-01-01 EST"
> dec > xct
[1] FALSE FALSE  TRUE  TRUE
> xlt <- as.POSIXct(xct)
> xlt
[1] "1969-07-20 20:17:39 UTC"
> xlt$year
Error in xlt$year : $ operator is invalid for atomic vectors
> xlt%year
Error: unexpected input in "xlt%year"
> xlt$mon
Error in xlt$mon : $ operator is invalid for atomic vectors
> unclass(xlt)
[1] -14182941
attr(,"tzone")
[1] "UTC"