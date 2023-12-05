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

