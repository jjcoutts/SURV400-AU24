# sampling distribution lecture SURV400 

# load required packages
library(ggplot2)
library(jtools)

# set the seed
set.seed(200567)

# generate random normal numbers
randomnumbers <- data.frame(x = rnorm(n= 100, mean = 0, sd = 1))
# plot to show distribution
ggplot(randomnumbers, aes(x = x)) + 
  geom_histogram() + 
  jtools::theme_apa()

##### proving CLT vis simulation
# create population data frame
clt_demo <- data.frame(norm = rnorm(n = 1000000, mean = 0, sd = 1), uniform = runif(n = 1000000, min = 0, max = 1),poisson = rpois(10000000, 1.2), exponential = rexp(1000000, rate = 2))

###### demo 
# set simulation parameters 
samp = 10000 # number of "studies"/resamples
n = 452 # sample size
N = 1000000 # population size

### normal distributions
# visualize the normal population 
ggplot(clt_demo, aes(x = norm)) + 
  geom_histogram() + 
  jtools::theme_apa()

# CLT Demo
nres <- data.frame(nres = rep(NA,samp))
for(i in 1:samp){
  s_dat <- clt_demo[sample(1:nrow(clt_demo), n, replace=FALSE),"uniform"]
  nres[i,] <- mean(s_dat)
}
# normal? 
ggplot(res, aes(x = nres)) + 
  geom_histogram() + 
  jtools::theme_apa()

### uniform distributions
# visualize the uniform population 
ggplot(clt_demo, aes(x = uniform)) + 
  geom_histogram() + 
  jtools::theme_apa()

# CLT Demo
ures <- data.frame(ures = rep(NA,samp))
for(i in 1:samp){
  s_dat <- clt_demo[sample(1:nrow(clt_demo), n, replace=FALSE),"uniform"]
  ures[i,] <- mean(s_dat)
}
# normal? 
ggplot(res, aes(x = ures)) + 
  geom_histogram() + 
  jtools::theme_apa()

### Poisson distributions
# visualize the poisson population
ggplot(clt_demo, aes(x = poisson)) + 
  geom_histogram() + 
  jtools::theme_apa()

# CLT Demo
pres <- data.frame(pres = rep(NA,samp))
for(i in 1:samp){
  s_dat <- clt_demo[sample(1:nrow(clt_demo), n, replace=FALSE),"poisson"]
  pres[i,] <- mean(s_dat)
}
# normal? 
ggplot(pres, aes(x = pres)) + 
  geom_histogram() + 
  jtools::theme_apa()


### Exponential distributions
# visualize the exponential population
ggplot(clt_demo, aes(x = exponential)) + 
  geom_histogram() + 
  jtools::theme_apa()

# CLT Demo
eres <- data.frame(eres = rep(NA,samp))
for(i in 1:samp){
  s_dat <- clt_demo[sample(1:nrow(clt_demo), n, replace=FALSE),"uniform"]
  eres[i,] <- mean(s_dat)
}
# normal? 
ggplot(eres, aes(x = eres)) + 
  geom_histogram() + 
  jtools::theme_apa()


### end of script