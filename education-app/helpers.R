#Read in schools directory dataset
schools <- read.csv("data/schools-directory-aug2016.csv")

#Remove records with missing long and lat
schools <- schools[which(!is.na(schools$longitude)),]
schools <- schools[which(!is.na(schools$latitude)),]

#Drop schools with missing decile and decile=99
schools <- schools[which(!is.na(schools$decile)),]
schools <- schools[which(schools$decile!=99),]

#Found a negative longitude (there shouldn't be any for NZ)
#Use abs()
schools$longitude <- abs(schools$longitude)


#intersections$Rank2 <- 101-intersections$Rank

locations <- as.vector(schools$TA)
