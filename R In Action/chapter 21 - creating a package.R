#install npar
pkg <- "npar_1.0.tar.gz"
loc <- "http://www.statmethods.net/RiA"
url <- paste(loc, pkg, sep = "/")
download.file(url, pkg)
install.packages(pkg, repos = NULL, type = "source")

#nonparametric analysis and the npar package
library(npar)
hist(life$hlef, xlab = "Healthy Life Expectancy (years) at Age 65",
     main = "Distribution of Healthy Life Expectancy for Women",
     col = "grey", breaks = 10)

library(tidyverse)
ggplot(data = life, aes(x = region, y = hlef)) +
  geom_point(size = 3, color = "darkgrey") +
  labs(title = "Distribution of HLE Estimates by Region",
       x = "US Region",
       y = "Healthy Life Expectancy at Age 65") +
  theme_bw()

#comparing groups with the npar package
results <- oneway(hlef ~ region, life)
summary(results)

#developing the package
#consists of 4 functions: oneway(), print.oneway(),
#summary.oneway(), and plot.oneway()
#computing the statistics
#available at Home -> R -> R in Action -> nparFiles -> oneway

print(results)
summary(results)
plot(results, col = "lightblue", main = "Multiple Comparisons",
     xlab = "US Region",
     ylab = "Healthy Life Expectancy (years) at Age 65")

#creating the package documentation
#you can document by using LaTeX markup language but
#its easier and simpler to use the roxygen2 package
#you place comments in the head of each .R file which generate
#the LaTeX documentation (.Rd) automatically

#Tags for use with Roxygen2
@title
@description
@details
@parm
@export
@method generic class
@return
@author
@examples
@note
@aliases
@references

#Building the package

#step 1
#install tool(s): roxygen2

#step 2
#set up the directories
#start in home wd, create subdirectory called npar
#create 2 subdirectories in npar: R and data
#place DESCRIPTION file in npar directory
#place source files in the R subdirectory

#step 3
#generate the documentation
#call function roxygenize("npar")
#creates new subdirectory called man that contains the .Rd doc
#from the comments at the top of each code file
#adds info to the DESCRIPTION file
#creates a NAMESPACE file which controls the visibility of functions
#are all functions available to the user?
#or are some just used internally by other functions

#step 4
#build the package
# >system("R CMD build npar")
#creates the npar_1.0.zip file in the current working directory

#step 5 (optional)
#check the package
# >system("R CMD check npar")
#creates folder called npar.Rcheck in the current working directory

#step 6 (optional - already completed if step 5 is done)
#create a PDF manual
# >system("R CMD Rd2pdf npar")

#step 7 (optional)
#install the package locally
# >system("R CMD INSTALL npar")
#OR
# >install.packages(paste(getwd(), "/npar_1.0.tar.gz", sep = ""),
#                   repos = NULL, type = "source")

#step 8 (optional)
#upload the package to CRAN
#read the CRAN Repository policy
#make sure package passes all checks in step 5
#submit the package via web form at http://cran.r-Project.org/incoming
#OR
#submit via FTP by uploading packagename_version.tar.gz file via
#anonymous FTP to ftp://cran.r-Project.org/incoming
#then send a plain text email to CRAN@R-project.org from the maintainer
#email listed in the package using the subject line
#CRAN submission PACKAGE VERSION
#confirm that you have read and agree to CRAN's policies
