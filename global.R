


babyNames <- read.csv("C:\\babyNames.csv", nrow = 90000)
cat('Read in baby names with',nrow(babyNames), 'rows\n')

possibleNames <- sort( unique(babyNames$name) )
cat('Created a vector of',length(possibleNames), 'unique names\n')


possibleYear <- sort( unique(babyNames$year) )
cat('Created a vector of',length(possibleYear), 'unique year\n')




