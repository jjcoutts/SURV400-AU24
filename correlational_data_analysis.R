# Correlational analysis lecture code (PSYC300)

# load required packages
library(ggplot2)
library(jtools)

# read in dataset 
bl <- read.table(file="~/PSYC300-AU24/Lectures/Correlational Research/binladen.csv", header = TRUE, sep = ",")

# generate descriptive statistics
summary(bl)

# visualize the data
ggplot(data = bl, aes(x = as.factor(binladen), y = mcivil)) +
  geom_boxplot() + 
  labs(x = "Condition (0 = Before Death, 1 = After Death", y = "Restriction of Civil Liberties") + 
  jtools::theme_apa()

# run the analysis
cor.test(bl$binladen, bl$mcivil)

# exploratory data analysis
ggplot(data = bl, aes(x = as.factor(binladen), y = stereo)) +
  geom_boxplot() + 
  labs(x = "Condition (0 = Before Death, 1 = After Death", y = "Stereotype Endorsement") + 
  jtools::theme_apa()
cor.test(bl$binladen, bl$stereo)

ggplot(data = bl, aes(x = mcivil, y = stereo)) +
  geom_point() + 
  geom_jitter() + 
  labs(x = "Restriction of Civil Liberties", y = "Stereotype Endorsement") + 
  jtools::theme_apa()
cor.test(bl$mcivil, bl$stereo)



### end of script