ctbl <- matrix(c(10, 10, 15, 5), nrow = 2)
ctbl
N <- sum(ctbl)
K <- ctbl[1, 1] + ctbl[1, 2]
n <- ctbl[1, 1] + ctbl[2, 1]

k_supp <- seq(max(0, n+K-N), min(n, K))
# k_supp is as expected
k_supp

# We will use dhyper to calculate the probabilities
# From the documentation of dhyper:
# p(x) = choose(m, x) choose(n, k-x) / choose(m+n, k) 
# for x = 0, ..., k.
# Then, we plug in our parameters generated using the wikipedia notation:
P_X_equalTo_k <- dhyper(x = k_supp, m = K, n = N-K, k = n)
P_X_equalTo_k
# This is slightly confusing, you have to check each parameter carefully. 
qplot(x = k_supp, y = P_X_equalTo_k, geom = 'point')