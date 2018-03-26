data4 <- read.csv(file = "skincancerrates.csv", header = TRUE);
regression_4 <- lm(rates ~ state, data = data4)
summary(regression_4)