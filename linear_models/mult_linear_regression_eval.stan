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

generated quantities {

  vector[n_points] y_pred;
  real<lower=0> totalss; 
  real<lower=0> rss;
  real Rsq;    
  y_pred =  X*a + b;
  
  rss = dot_self(y-y_pred);
  
  totalss = dot_self(y-mean(y));
  Rsq = 1 - rss/totalss;
}