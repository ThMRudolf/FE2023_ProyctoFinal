//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
// Ejemplo de estimación de una proporcion
data {
  int n; // número de pruebas
  int y; //numero de éxitos y fracasos
}

parameters {
  real<lower=0,upper=1> theta;
}

model {
  // inicial
  theta ~ beta(8, 160);
  y ~ binomial(n, theta);
}

generated quantities {
  real theta_inicial;
  theta_inicial = beta_rng(8, 160);
}