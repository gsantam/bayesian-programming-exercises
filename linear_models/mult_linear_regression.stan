data {
  int n_points;
  int m_variables;
  matrix[n_points,m_variables] X;
  vector[n_points] y;
}

parameters {
  vector[m_variables] a;
  real b;
  real<lower = 0> sigma;
}

model {
  y ~ normal( X*a + b , sigma);
}