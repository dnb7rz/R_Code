library(ggplot2)

set.seed(1234)


BiNums = data.frame(vals = rbinom(n=500, size=30, prob=0.5))

ggplot(BiNums, aes(x=vals)) +
  geom_histogram(binwidth=.2, alpha=.5, position="identity")

ggplot(BiNums, aes(x=vals)) + 
  geom_histogram(aes(y=after_stat(density)),      
                 binwidth=.2) +
  geom_density(alpha=.2, fill="#FF6666")  

