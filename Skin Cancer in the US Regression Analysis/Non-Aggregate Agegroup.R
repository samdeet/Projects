data3 <- read.csv(file = "skincancerrates.csv", header = TRUE);
regression_3 <- lm(rates ~ agegroupcode, data = data3);
summary(regression_3)

#Model Diagnostics
