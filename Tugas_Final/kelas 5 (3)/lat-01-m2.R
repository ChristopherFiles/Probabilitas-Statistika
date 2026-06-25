jk <- c(0,1,1,0,1,0,0,1,0,0)
17+45
jk
x <- 17+45
print(x)
pengamatan <- c(10,20,30,40)
pengamatan*2
mean(pengamatan)
length(pengamatan)
max(pengamatan)
min(pengamatan)
summary(pengamatan)
ls()
rm(list=ls())
pengamatan

#Demo di R
getOption("defaultPackages") #list default paket
citation() #sitasi
demo() #list demo, keluar dari list ketikkan q11
demo(graphics) #demo program
example(lm) #melihat contoh dengan nama fungsi 'lm'
example(mean)

#R sebagai Kalkulator
100.1 + 234.9 + 12.01
x <- 100.1 + 234.9 + 12.01
print(x)

2+2
x <- 2+2
print(x)

sqrt(256)
log10(100)*cos(pi)

cumsum(c(2,3,4,5,6))

A <- matrix(c(5,4,-1,1),2,2, byrow=TRUE)
print(A)
b <- c(-10,2)
print(b)
solve(A,b)

# create matrix A and B using given equations
A <- rbind(c(1, 2, 3),
           c(2, 2, 3),
           c(3, 2, 8))
b <- c(20, 100, 200)
solve(A, b)

# create matrix D and e using given equations
D <- rbind(c(1, 2, 3),
           c(2, 2, 3),
           c(3, 2, 8))
e <- c(20, 100, 200)
solve(D,e)

170166719 %% 31079
48:(14*3)
48:14*3
log(10)
log10(10)
exp(2)
abs(-4)
