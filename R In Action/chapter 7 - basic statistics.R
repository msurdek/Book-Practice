#Descriptive Statistics
#A menagerie of methods

myvars <- c("mpg", "hp", "wt")
head(mtcars[myvars])
summary(mtcars[myvars])

#Descriptive statistics via sapply()

mystats <- function(x, na.omit = FALSE) {
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n-3
  return(c(n = n, mean = m, stdev = s, skew = skew, kurtosis = kurt))
}

sapply(mtcars[myvars], mystats)

#Even more methods

library(Hmisc)
describe(mtcars[myvars])

#Even more methods (cont.)

install.packages("pastecs")
library(pastecs)
stat.desc(mtcars[myvars])

#Even more methods (cont.2)

install.packages("psych")
library(psych)
describe(mtcars[myvars])

#Descriptive statistics by group

aggregate(mtcars[myvars], by=list(am=mtcars$am), mean)
aggregate(mtcars[myvars], by=list(am=mtcars$am), sd)

#Descriptive statistics by group (cont.)

dstats <- function(x)sapply(x, mystats)
by(mtcars[myvars], mtcars$am, dstats)

#Additional methods by group

install.packages("doBy")
library(doBy)
summaryBy(mpg+hp+wt~am, data = mtcars, FUN = mystats)

#Additional methods by group (cont.)

describeBy(mtcars[myvars], list(am=mtcars$am))

#Frequency and contingency tables

library(vcd)
head(Arthritis)

#ONE-WAY TABLES

mytable <- with(Arthritis, table(Improved))
mytable

prop.table(mytable)

#TWO-WAY TABLES

mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
mytable

margin.table(mytable, 1) #1 is for the first variable (Treatment)

prop.table(mytable, 1)

margin.table(mytable, 2) #2 is for the second variable (Improved)

prop.table(mytable, 2)

addmargins(mytable)

addmargins(prop.table(mytable))

addmargins(prop.table(mytable, 1), 2)

addmargins(prop.table(mytable, 2), 1)

#Two-way table using CrossTable

install.packages("gmodels")
library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)

#MULTIDIMENSIONAL TABLES

mytable <- xtabs(~ Treatment + Sex + Improved, data = Arthritis)
mytable

ftable(mytable)

margin.table(mytable, 1)

margin.table(mytable, 2)

margin.table(mytable, 3)

margin.table(mytable, c(1,3))

ftable(prop.table(mytable, c(1,2)))

ftable(addmargins(prop.table(mytable, c(1,2)),3))

ftable(addmargins(prop.table(mytable, c(1,2)),3)) * 100

#Tests of independence

#CHI-SQUARE TEST OF INDEPENDENCE

mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
chisq.test(mytable)

mytable <- xtabs(~ Improved + Sex, data = Arthritis)
chisq.test(mytable)

#FISHER'S EXACT TEST

mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
fisher.test(mytable)

#COCHRAN-MANTEL-HAENSZEL TEST

mytable <- xtabs(~ Treatment + Sex + Improved, data = Arthritis)
mantelhaen.test(mytable)

#Measures of association

mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
assocstats(mytable)

#Correlations

#Types of correlations

#PEARSON, SPEARMAN, AND KENDALL CORRELATIONS

states <- state.x77[,1:6]

cov(states)

cor(states)

cor(states, method = "spearman")

x <- states[,c("Population", "Income", "Illiteracy", "HS Grad")]
y <- states[,c("Life Exp", "Murder")]
cor(x,y)

#PARTIAL CORRELATIONS

install.packages("ggm")
library(ggm)
pcor(c(1,5,2,3,6), cov(states))

#OTHER TYPES OF CORRELATIONS

install.packages("polycor")
library(polycor)

#Testing correlations for significance

cor.test(states[,3], states[,5])

#Correlation matrix and tests of significance via corr.test()

corr.test(states, use = "complete")

#T-tests

#Independent t-test

library(MASS)
t.test(Prob ~ So, data = UScrime)

#Dependent t-test

sapply(UScrime[c("U1", "U2")], function(x)(c(mean=mean(x), sd=sd(x))))
with(UScrime, t.test(U1, U2, paired = TRUE))

#Nonparametric tests of group differences

with(UScrime, by(Prob, So, median))

wilcox.test(Prob ~ So, data = UScrime)

with(UScrime, wilcox.test(U1, U2, paired = TRUE))

#Comparing more than two groups

states <- data.frame(state.region, state.x77)

kruskal.test(Illiteracy ~ state.region, data = states)

#Nonparametric multiple comparisons
#Created by R in Action author

source("http://www.statmethods.net/RiA/wmc.txt")
states <- data.frame(state.region, state.x77)
wmc(Illiteracy ~ state.region, data = states, method = "holm")
