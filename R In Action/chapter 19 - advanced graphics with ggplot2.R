#load packages - car, tidyverse, gridExtra
install.packages("car")
install.packages("carData")
install.packages("tidyverse")
install.packages("gridExtra")
library(car)
library(tidyverse)
library(gridExtra)
library(carData)

#an introduction to the ggplot2 package
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Automobile Data", x = "Weight", y = "Miles Per Gallon")

#expanding on previous example
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point(pch = 17, color = "blue", size = 2) +
  geom_smooth(method = "lm", color = "red", linetype = 2) +
  labs(title = "Automobile Data", x = "Weight", y = "Miles Per Gallon")

#introducing grouping and faceting
mtcars$am <- factor(mtcars$am, levels = c(0,1),
                    labels = c("Automatic", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels = c(0,1),
                    labels = c("V-Engine", "Straight Engine"))
mtcars$cyl <- factor(mtcars$cyl)

ggplot(data = mtcars, aes(x = hp, y = mpg,
                          shape = cyl, color = cyl)) +
  geom_point(size = 3) +
  facet_grid(am ~ vs) +
  labs(title = "Automobile Data by Engine Type",
       x = "Horsepower", y = "Miles Per Gallon")

#specifying the plot type with geoms
data(singer, package = "lattice")

ggplot(singer, aes(x=height)) +
  geom_histogram()

ggplot(singer, aes(x=voice.part, y = height)) +
  geom_boxplot()

#common options for geom functions
data(Salaries, package = "carData")
ggplot(Salaries, aes(x=rank, y = salary)) +
  geom_boxplot(fill = "cornflowerblue",
               color = "black", notch = TRUE) +
  geom_point(position = "jitter", color = "blue", alpha = 0.5) +
  geom_rug(side = "l", color = "black")

data(singer, package = "lattice")
ggplot(singer, aes(x = voice.part, y = height)) +
  geom_violin(fill = "lightblue") +
  geom_boxplot(fill = "lightgreen", width = 0.2)

#Grouping
data(Salaries, package = "carData")
ggplot(data = Salaries, aes(x=salary, fill = rank)) +
  geom_density(alpha = 0.3)

ggplot(Salaries, aes(x=yrs.since.phd, y = salary, color = rank,
                     shape = sex)) +
  geom_point()

ggplot(Salaries, aes (x = rank, fill = sex)) +
  geom_bar(position = "stack") +
  labs(title = 'position="stack"')

ggplot(Salaries, aes (x = rank, fill = sex)) +
  geom_bar(position = "dodge") +
  labs(title = 'position="dodge"')

ggplot(Salaries, aes (x = rank, fill = sex)) +
  geom_bar(position = "fill") +
  labs(title = 'position="fill"', y = "proportion")

#Faceting
data(singer, package = "lattice")
ggplot(data = singer, aes(x = height)) +
  geom_histogram() +
  facet_wrap(~voice.part, nrow = 4)

data(Salaries, package = "carData")
ggplot(Salaries, aes(x = yrs.since.phd, y = salary, color = rank,
                     shape = rank)) +
  geom_point() +
  facet_grid(.~sex)

data(singer, package = "lattice")
ggplot(data = singer, aes(x = height, fill=voice.part)) +
  geom_density() +
  facet_grid(voice.part~.)

#Adding smoothed lines
data(Salaries, package = "carData")
ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_smooth() +
  geom_point()

ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary,
                            linetype = sex, shape = sex,
                            color = sex)) +
  geom_smooth(method = lm, formula = y~poly(x,2),
              se = FALSE, size = 1) +
  geom_point(size = 2)

#Modifying the appearance of ggplot2 graphs

#axes
data(Salaries, package = "carData")
ggplot(data = Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  scale_x_continuous(breaks = c("AsstProf", "AssocProf", "Prof"),
                     labels = c("Assistant\nProfessor",
                                "Associate\nProfessor",
                                "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50K", "$100K", "$150K", "$200K")) +
  labs(title = "Faculty Salary by Rank and Sex", x = "", y = "")

#legends
data(Salaries, package = "carData")
ggplot(data = Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor",
                              "Associate\nProfessor",
                              "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50K", "$100K", "$150K", "$200K")) +
  labs(title = "Faculty Salary by Rank and Gender",
       x = "", y = "", fill="Gender") +
  theme(legend.position = c(0.1,0.8))

#scales
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point(shape = 21, color = "black", fill = "cornsilk") +
  labs(x = "Weight", y = "Miles Per Gallon",
       title = "Bubble Chart", size = "Engine\nDisplacement")

data(Salaries, package = "carData")
ggplot(data = Salaries, aes(x = yrs.since.phd,
                            y = salary, color = rank)) +
  scale_color_manual(values = c("orange", "olivedrab", "navy")) +
  geom_point(size = 2)

ggplot(data = Salaries, aes(x = yrs.since.phd,
                            y = salary, color = rank)) +
  scale_color_brewer(palette = "Set1") +
  geom_point(size = 2)

library(RColorBrewer)
display.brewer.all()

#themes
mytheme <- theme(plot.title = element_text(face = "bold.italic",
                                           size = "14",
                                           color = "brown"),
                 axis.title = element_text(face = "bold.italic",
                                           size = "10",
                                           color = "brown"),
                 axis.text = element_text(face = "bold",
                                          size = 9,
                                          color = "darkblue"),
                 panel.background = element_rect(fill = "white",
                                                 color = "darkblue"),
                 panel.grid.major.y = element_line(color = "grey",
                                                   linetype = 1),
                 panel.grid.minor.y = element_line(color = "grey",
                                                   linetype = 2),
                 panel.grid.minor.x = element_blank(),
                 legend.position = "top")

ggplot(Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  labs(title = "Salary by Rank and Sex", x = "Rank", y = "Salary") +
  mytheme

#Multiple graphs per page
p1 <- ggplot(data = Salaries, aes(x = rank)) + geom_bar()
p2 <- ggplot(data = Salaries, aes(x = sex)) + geom_bar()
p3 <- ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point()

library(gridExtra)
grid.arrange(p1, p2, p3, ncol = 3)

#Saving graphs
myplot <- ggplot(data = mtcars, aes(x = mpg)) + geom_histogram()
ggsave(file = "mygraph.png", plot = myplot, width = 5, height = 4)
ggsave(file = "mygraph.pdf")
#saves the most recently created graph if plot = is not specified