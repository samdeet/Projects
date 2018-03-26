skin = read.csv("Regional_Skin_Cancer.csv");
head(skin);
rate = skin$count/skin$population*10000
skin = data.frame(skin, rate)
head(skin);
mod.region = lm(rate ~ region, data = skin);
summary(mod.region);
plot(rate ~ skin$region)
