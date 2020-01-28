str(beaver2)
transform.beaver<-transform(beaver2,
                            activ=factor(activ,labels=c("no","yes")))
library("lattice")
histogram(~temp|activ,data=transform.beaver)
with(transform.beaver,{
  qqnorm(temp[activ=="no"],main="Inactive")
  qqline(temp[activ=="no"])})
shapiro.test(transform.beaver$temp)
with(transform.beaver,tapply(temp,activ,shapiro.test))
t.test(temp~activ,data = transform.beaver,alternative="less")
with(transform.beaver,
     t.test(temp[activ=="yes"],temp[activ=="no"]))
wilcox.test(temp~activ,data=transform.beaver)
?t.test
head(sleep)
sleep
t.test(extra~group,data=sleep,paired=TRUE)
result.prop<-prop.test(survivors)
result.prop
chisq.test(survivors)
str(HairEyeColor)HairEyeMargin<-margin.table(HairEyeColor,margin=c(1,2))
HairEyeMargin
chisq.test(HairEyeMargin)
str(InsectSprays)
AOVModel<-aov(count~spray,data=InsectSprays)
AOVModel
summary(AOVModel)
model.tables(AOVModel,type = "effects")
model.tables(AOVModel,type = "means")
Comparisons<-TukeyHSD(AOVModel)
Comparisons
Comparisons$spray["D-C",]
plot(Comparisons,las=1)
Model<-lm(mpg~wt,data = mtcars)
Model
coef.Model<-coef(Model)
coef.Model
plot(mpg~wt,data = mtcars)
abline(Model)
Model.summary<-summary(Model)
Model.summary
Model.anova<-anova(Model)
Model.anova
new.cars<-data.frame(wt=c(1.7,2.4,3.6))
predict(Model,new.cars,interval="confidence")
predict(Model,new.cars,interval="prediction")
