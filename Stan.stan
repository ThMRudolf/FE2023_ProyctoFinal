data {
  int<lower=0> N;  // Número total de observaciones
  int<lower=0, upper=1> y[N];  // Datos de entrada (0 o 1)
  int<lower=0> state[N];  // Etiqueta del estado
  int<lower=0> num_states;  // Número total de estados
}

parameters {
  vector<lower=0, upper=1>[num_states] prop;  // Proporciones para cada estado
}

model {
  for (i in 1:N) {
    y[i] ~ binomial(1, prop[state[i]]);
  }

  // Prior conjugado beta-binomial
  for (s in 1:num_states) {
    prop[s] ~ beta(8, 160);
  }
}
