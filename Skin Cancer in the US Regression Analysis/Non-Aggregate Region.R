data5 <- read.csv(file = "Regional_Skin_Cancer", header = TRUE);
regression_5 <- lm(rates ~ region, data = data4)
summary(regression_5)