
#Proj Euler prob 1

#sum of nums divisible 3 or 5 under 10
df = as.data.frame(unique(c(seq(3, 9, 3), seq(5, 9, 5))))
sum(df)
#23

#sum of nums divisible 3 or 5 under 1000
df2 = as.data.frame(unique(c(seq(3, 999, 3), seq(5, 999, 5))))
sum(df2)
#233168

#Proj Euler prob 2

#By considering the terms in the Fibonacci sequence whose values do not exceed 
#four million, find the sum of the even-valued terms.

#define numbers to start adding together
FNums = c(1, 2)  

while (max(FNums) < 4000000) {
  
  len = length(FNums) #how many fnums till we reach 4M
  FNums = c(FNums, FNums[len - 1] + FNums[len])
  
}

#sun of even values
sum(FNums[FNums%%2 == 0])


#Proj Euler prob 3
#prime factors of 13195 = 5,7,13,29
#prime factor of 600851475143

library(numbers)
primeFactors(13195)

max(primeFactors(600851475143))



