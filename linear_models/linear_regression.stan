data {
  int n;
  vector[n] x;
  vector[n] y;
}

parameters {
  real a;
  real b;
  real<lower = 0> sigma;
}

model {
  y ~ normal( a * x + b , sigma);
}