read.table("data18.txt") -> data
dim(data)
head(data)

t(data) -> data

dim(data)

colSums(data)

data[,-which(colSums(data)==0)] -> data1

dim(data1)

data1 -> data

apply(data, 2, mean)

rep(1:42, each = 5) -> fac42

list(fac42) -> fac42

aggregate(data, fac42, sum) -> dat42

read.table("facteurs2018.txt") -> fac

install.packages("agricolae")

fac

library(ade4)

head(fac)

head(dat42)

rowSums(dat42>0) -> ric

ric


colnames(dat42)

# La fréquence de fauchage a t-elle un impacte sur la présence d'espèce néctarifère

dat42[,c(1,9,10,19,23,35)] -> datnec

rowSums(datnec) -> abnec

rowSums(datnec>0) -> rnec

head(fac)
summary(fac$Freq)

sunflowerplot(fac$Freq, abnec)

boxplot(abnec~fac$Freq)

library(agricolae)

print(kruskal(abnec,fac$Freq))

boxplot(abnec~fac$Exp)


kruskal(abnec,fac$Exp)

print(kruskal(abnec,fac$Exp))

which.max(abnec)

boxplot(abnec~fac$gestion)

boxplot(abnec~fac$Exp*fac$Freq)

boxplot(ric~fac$Exp*fac$Freq)

ls()

data(santacatalina)
santacatalina

santa <- t(santacatalina)
apply(santa, 1, sum)


barplot(sort(santa[1,]))
barplot(sort(santa[2,]))
par(mfrow=c(2,5))
for(i in 1:nrow(santa)){
barplot(sort(santa[i,]))}

sum(santa[1,])
santa[1,]/sum(santa[1,]) -> pi1
pi1

log(pi1)

pi1[-which(pi1==0)] -> pi01
log(pi01)
pi01*log(pi01)
# Il devient maximal quand on se rapproche de 1/r

-sum(pi01*log(pi01))
santa[8,]/sum(santa[8,]) -> pi8
pi8[-which(pi8==0)] -> pi08
-(pi08*log(pi08))
-sum(pi08*log(pi08))

x <- seq(0,1,by=0.0001)
x
par(mfrow=c(1,1))
plot(-(x*log(x)),x)
plot(x,-(x*log(x)))
-sum(pi08*log(pi08)) 
# indice de shanon

length(pi08)

1/7
0.142*log(0.142)
(0.142*log(0.142))*7
-sum(pi08*log(pi08))/1.94

# équirépartition -> pi = 1/r
# Heq = Hmax = -r(1/r ln 1/r) = -ln 1/r = lnr
# Il va varier entre 0 et le logarithme de la richesse 
# 0<Hobs/ Hmax = équitabilité<1

library(vegan)
diversity(santa) -> shansa

rowSums(santa>0)

shansa/log(rowSums(santa>0)) -> evsa

# Le maximum est le 8

par(mfrow=c(3,4))

for(i in 1:nrow(santa)){
barplot(sort(santa[i,]))}
rowSums(santa>0)

plot(rowSums(santa>0))
lines(shansa)

par(mfrow=c(1,1))

plot(rowSums(santa>0), ylim=c(0,10))
lines(shansa)
lines(shansa*4)

lines(evsa*8, col="red")

rowSums(dat42>0) -> ric

ric
diversity(dat42)
ric

diversity(dat42)/log(ric)-> evpb
boxplot(evpb~fac$Freq*fac$Freq)

pointure <- c(31,31,32,33,33,34,35,36,37,38)
qi <- c(50,55,52,56,63,65,69,90,110,150)
illpsy<- data.frame(pointure, qi)
mean(pointure)
mean(qi)
illpsy$pointure-mean(illpsy$pointure)-> ecartpointure
ecartpointure

illpsy$qi - mean (illpsy$qi) -> ecartqi

cbind(illpsy, ecartpointure, ecartqi) -> illpsy2

sd(pointure)-> sdpointure
sd(qi) -> sdqi

plot(pointure, qi)

ecartqi*ecartpointure

sum(ecartqi*ecartpointure)
# Corrélation car le produit des deux est positif pour pratiquement toutes les valeurs
sum(ecartqi*ecartpointure)/length(ecartpointure)

sum(ecartqi*ecartpointure)/10 -> covar
coefpears <- covar/(sdpointure*sdqi)

abline(lm(qi~pointure))




