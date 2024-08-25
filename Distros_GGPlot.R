library(ggplot2)

set.seed(1234)
Nums = data.frame(vals = rnorm(200))

ggplot(Nums, aes(x=vals)) +
  geom_histogram(binwidth=.1, alpha=.5, position="identity")

BiNums = data.frame(vals = rbinom(n=100, size=1, prob=0.5))

ggplot(BiNums, aes(x=vals)) +
  geom_histogram(binwidth=.1, alpha=.5, position="identity")

PoiNum = data.frame(vals = rpois(n = 100, lambda = 0.5))

ggplot(PoiNums, aes(x=vals)) +
  geom_histogram(binwidth=.1, alpha=.5, position="identity")
