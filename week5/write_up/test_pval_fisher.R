disease_smoke_tbl <- data.frame('disease' = c(35, 50), 'healthy' = c(500, 300))
rownames(disease_smoke_tbl) <- c('non-smoke', 'smoke')

disease_smoke_tbl

ds_2x2_tbl <- disease_smoke_tbl
ds_2x2_tbl

n = sum(ds_2x2_tbl)

p_test_stat <- (choose(ds_2x2_tbl[1, 1] + ds_2x2_tbl[1, 2], ds_2x2_tbl[1, 1]) 
                * choose(ds_2x2_tbl[2, 1] + ds_2x2_tbl[2, 2], ds_2x2_tbl[2, 1])
                / choose(n, ds_2x2_tbl[1, 1] + ds_2x2_tbl[2, 1]))

p_test_stat

N <- sum(ds_2x2_tbl)
K <- ds_2x2_tbl[1, 1] + ds_2x2_tbl[1, 2]
n <- ds_2x2_tbl[1, 1] + ds_2x2_tbl[2, 1]

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
P_X_equalTo_k[k_supp==35]
p_test_stat

sum(P_X_equalTo_k[P_X_equalTo_k <= P_X_equalTo_k[k_supp==35]])
all.equal(sum(P_X_equalTo_k[P_X_equalTo_k <= P_X_equalTo_k[k_supp==13]]),
          fisher.test(ds_2x2_tbl, alternative = 't')$p.val)

sum(P_X_equalTo_k[k_supp<=13])
all.equal(sum(P_X_equalTo_k[k_supp<=13]), 
          fisher.test(ds_2x2_tbl, alternative = 'l')$p.val)

sum(P_X_equalTo_k[k_supp>=13])
all.equal(sum(P_X_equalTo_k[k_supp>=13]), 
          fisher.test(ds_2x2_tbl, alternative = 'g')$p.val)


sum(P_X_equalTo_k[k_supp<=13]) + sum(P_X_equalTo_k[k_supp>=13]) - sum(P_X_equalTo_k[k_supp==13])