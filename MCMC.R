

## importing data as an excel workbook##
library(readxl)
mydata <- read_excel("mydata.xlsx")
View(mydata)

## converting data inot matrices and vectors
a <- as.matrix(mydata[-1])
G <- nrow(mydata)
R <- ncol(mydata[-1])
v <- as.matrix(mydata[,1])
p <- as.vector(v)
View(p)
## converting data into lists##
df <- list(N=G, K=R, x=a, y=p) 
View(df)

library(rstan)
mcfit  <- stan(file = 'stan_model1.stan', data = df, iter=3000,
               warmup=100, chains=4)

print(mcfit)
plot(mcfit)
## tracelot for coefficients##
traceplot(mcfit, pars = c("beta[1]","beta[2]", "beta[3]", "lp__"), inc_warmup = TRUE)
install.packages("shinystan")
library(shinystan)
## shinystan library for histograms and traceplots##
my_shinystan <- as.shinystan(mcfit)
launch_shinystan(my_shinystan)
