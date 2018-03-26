data2 <- read.csv(file = "Regional_Skin_Cancer.csv", header = TRUE);
total2 <- aggregate(population ~ region, data = data2, sum);
regions <- aggregate(count ~ region, data = data2, sum);
regions$count <- regions$count * 100000;
regions$population <- total2$population;
rate_transform <- transform(regions, rates=count/population);
rate_regression1 <- lm(rates ~ region, data = rate_transform)

