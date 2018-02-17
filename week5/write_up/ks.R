for (rseed in 1:20000) {
  set.seed(rseed)
  x <- rnorm(50)
  y <- runif(30)
  #ks.test(x,y)$p.val
  if (min(ks.test(x, y, alternative = "less")$p.val, 
          ks.test(x, y, alternative = "greater")$p.val) >= 0.05) {
    break
  }
}
rseed
set.seed(rseed)
x <- rnorm(50)
y <- runif(30)

ks.test(x, y, alternative = "less")$p.val
ks.test(x, y, alternative = "greater")$p.val
