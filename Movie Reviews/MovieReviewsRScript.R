#Load ggplot
library(ggplot2)

#Load Data
getwd()

setwd("C:\\Users\\jrdnm\\DevelopmentProjects\\New folder\\Homework\\Movie Reviews")

MovieReviews <- read.csv("Section6-Homework-Data.csv")

#Analyze data structure
head(MovieReviews)

tail(MovieReviews)

str(MovieReviews)

#Convert Factor to num
#MovieReviews$Gross...US <- factor(MovieReviews$Gross...US)


#Filter data frame for specific studios


MovieReviewStudioFilter <- (MovieReviews$Studio == "Fox") | (MovieReviews$Studio ==  "Sony") | (MovieReviews$Studio ==  "Universal") | (MovieReviews$Studio == "WB") |
                                                         (MovieReviews$Studio == "Buena Vista Studios") | (MovieReviews$Studio == "Paramount Pictures")

MovieReviewGenreFilter <- (MovieReviews$Genre == "action") | (MovieReviews$Genre == "adventure") | (MovieReviews$Genre == "animation") | 
                               (MovieReviews$Genre == "comedy") | (MovieReviews$Genre =="drama")
 

#Build filtered data set
MovieReviews2 <- MovieReviews[MovieReviewStudioFilter & MovieReviewGenreFilter, ]


#Build basic data visualization

df <- ggplot(data = MovieReviews2, aes(x = Genre, y = Gross...US))


#Create full visualization
vis <- df + geom_jitter(aes(colour = Studio, size = Budget...mill.)) + geom_boxplot(alpha = 0.7, outlier.colour = NA)


#Adjust Themes
q<- vis + 
  ylab("Gross % US") + 
  ggtitle("Domestic Gross % By Genre") +
  theme(
    axis.title.x = element_text(colour = "Blue", size = 15),
    axis.title.y = element_text(colour = "Blue", size = 15),
    axis.text.x = element_text(size = 15),
    axis.text.y = element_text(size = 15),
    plot.title = element_text(hjust = 0.5, size = 15),
    legend.title = element_text(size = 15),
    text = element_text(family = "Comic Sans MS")
    )


q$labels$size <- "Budget $M"


                                                 