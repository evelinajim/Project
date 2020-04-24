########################################################################
# Working with the babyNames dataset -- see below for assignment
# The babyNames dataset comes from the Social Security Administration
# (https://www.ssa.gov/oact/babynames/limits.html), and contains
# frequencies of baby names from 1880 - 2017
########################################################################

library(dplyr)

# for testing, let's read just the first 10,000 rows
babyNames <- read.csv("babyNames.csv", nrow = 10000)

# this is how we read in all data
babyNames <- read.csv("babyNames.csv")

# search for a name
searchName = "Garrett"

# create data frame with results for desired name

df <- babyNames %>% filter(name == searchName) %>% 
       group_by(year) %>% summarise(n = sum(count))

# generate a bar graph of frequency of that name over time
main <- paste0("Frequency of babies named '", searchName, "' over time")
barplot(df$n, names.arg = df$year, col = "lightblue", 
        xlab = "year", ylab = "Frequency", 
        main = main, axis.lty = 1)

# which year was that name the most popular?
w <- which.max(df$n)
df$year[w]

# what was the frequency in the most popular year?
m <- max(df$n)
m

######################################################################
# Assignment: Create a Shiny app that does the following:

#  (1) Create a file named global.R that loads the data from
#      the babyNames.csv file. The 'global.R' file gets executed
#      before the application loads, so all objects created in
#      'global.R' are available in both 'server.R' and 'ui.R'
#      
#  (2) Allows the user to select a name from a drop-down 
#      list (see note below) and displays a barchart showing 
#      the frequency of that name over time 

#  (3) Displays when that name was most popular, in the following 
#      format: "The most popular year for Garrett was 2000, when
#      "5840 babies were named Garrett"

#  (4) Allows a user to select a year between 1880 and 2017,
#      using a slider (https://shiny.rstudio.com/articles/sliders.html)
#      and displays the most common name for males and females

# Comment #1: The drop down choices should be set on the server side, 
#           using updateSelectInput (https://shiny.rstudio.com/reference/shiny/0.14/updateSelectInput.html)
#           You should use the 'unique' function to get a unique set of names
# Comment #2: Text can be displayed in a shiny app using verbatimTextOutput and renderText
#            (https://shiny.rstudio.com/gallery/date-and-date-range.html)
####################################################################################
