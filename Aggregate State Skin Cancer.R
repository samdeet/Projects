data <- read.csv(file = "skincancer.csv", header = TRUE);
total <- aggregate(population ~ state, data = data, sum);
states <- aggregate(count ~ state, data = data, sum);
states$count <- states$count * 100000;
states$population <- total$population;
new_data <- transform(states, rate=count/population)
regression <- lm(rate ~ state, data = new_data)
summary(regression)