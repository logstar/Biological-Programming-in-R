prate <- data.frame(wt = rnorm(10, mean = 10, sd = 3),
                    kd = rnorm(10, mean = 15, sd = 3),
                    oe = rnorm(10, mean = 5, sd = 2.5))
write.table(prate, sep='\t', quote=F)

pvals <- c(t.test(prate$kd, prate$oe)$p.val, 
           t.test(prate$kd, prate$wt)$p.val, 
           t.test(prate$oe, prate$wt)$p.val)
round(pvals, 5)


exp_level <- data.frame(wt = rnorm(10, mean = 10, sd = 3),
                        kd = rnorm(10, mean = 2, sd = 1),
                        oe = rnorm(10, mean = 20, sd = 5))

exp_level
boxplot(exp_level)

e_pvals <- c(t.test(exp_level$kd, exp_level$oe)$p.val, 
             t.test(exp_level$kd, exp_level$wt)$p.val, 
             t.test(exp_level$oe, exp_level$wt)$p.val)
round(e_pvals, 5)


write.table(prate, sep='\t', quote=F)

write.table(exp_level, sep='\t', quote=F)

wide_df <- data.frame(geneName = c('GeneA', 'GeneB', 'GeneC'), 
                      expressionInCellLineA = c(1, 5, 10), 
                      expressionInCellLineB = c(20, 5, 15), 
                      expressionInCellLineC = c(5, 20, 30))
knitr::kable(wide_df)

library(tidyr)

knitr::kable(wide_df %>% gather(cellLine, expressionLevel, -geneName))
