intersections <- read.csv("data/high-risk-intersections-2003-to-2012.csv")

intersections$Rank2 <- 101-intersections$Rank

locations <- as.vector(intersections$TLA)