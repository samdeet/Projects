data1 = read.csv(file = "skincancer.csv", header = TRUE);
total1 = aggregate(population ~ agegroupcode, data = data, sum);
agegroup1 = aggregate(count ~ agegroupcode, data = data, sum);
agegroup1$count <- agegroup1$count * 100000;
agegroup1$population <- total1$population;
new_data1 <- transform(agegroup1, rate=count/population)
regression <- lm(rate ~ agegroupcode, data = new_data1)

#model diagnostics
