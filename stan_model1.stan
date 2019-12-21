

// Stan model for simple linear regression

data { // Data block
int<lower=1> N; // Sample size
int<lower=1> K; // Dimension of model matrix
matrix[N, K] x; // Model Matrix
vector[N] y; // Target variable
}

parameters {
 real beta0; // Intercept
 vector[K] beta; // Slope (regression coefficients)
 real < lower = 0 > sigma; // Error SD
}

model { // Model block
vector[N] mu;
mu = beta0 + x * beta; // Creation of linear predictor
// priors
beta0 ~ normal(20, 10000);
beta ~ normal(1,100);
sigma ~ gamma(0.5, 0.5); 
// likelihood
y ~ normal(mu, sigma);
}

generated quantities {
} // The posterior predictive distribution
