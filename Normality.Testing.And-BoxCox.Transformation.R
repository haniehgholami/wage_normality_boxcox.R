df = read.csv("CPSch3.csv", sep = ";")

sex_abs_fre = table(df$sex)   #### absolute frequency

n = nrow(df)   ###sample size
###n = dim(df)[1]
sex_rel_fre = table(df$sex) / n ####relative frequencies 
sex_per_fre = 100 * table(df$sex) / n #### percentage frequencies
sum(sex_abs_fre)
sum(sex_rel_fre)
sum(sex_per_fre)
year_abs_fre = table(df$year)   #### absolute frequency
year_rel_fre = table(df$year) / n 
year_per_fre = 100 * table(df$year) / n
sum(year_abs_fre)
sum(year_rel_fre)
sum(year_per_fre)
#### joint distribution
table(df$sex,df$year)
joint_abs_fre = table(df$sex,df$year)#### contingency table 
sum(joint_abs_fre)### we get n here 
rowSums(joint_abs_fre)
colSums(joint_abs_fre)
year_abs_fre
joint_abs_fre
addmargins(joint_abs_fre)
joint_rel_fre = table(df$sex,df$year) / n
addmargins(joint_rel_fre)
joint_per_fre = 100 * table(df$sex,df$year) / n
addmargins(joint_per_fre)
sex_per_fre
#################################
###subsetting the data by row ###
#################################
df2 = df[df$year == 1992,]
df3 = subset(df,year==1992)
all(df2==df3)
dim(df2)
hist(df2$ahe)#### it is not gaussian 
#################################
qqnorm(df2$ahe, datax = T)
qqline(df2$ahe, datax = T)#### according to the plot the distribution is not gaussian
library(tseries)
jarque.bera.test(df2$ahe)#### testing the jarque-bera normality test
#####if data be normal it is not possible to have a such big chi-squared because it is an estimate of JB
shapiro.test(df2$ahe)####here w is statistics , how close points are to the line 


#########################################################
####make our data to be gaussian with data transformation
#########################################################
df2$logahe = log(df2$ahe)
hist(df2$logahe)
qqnorm(df2$logahe, datax = T)
qqline(df2$logahe, datax = T)#### according to the plot the distribution is not gaussian
jarque.bera.test(df2$logahe)#### checking the normality after log transformation
shapiro.test(df2$logahe)####here w is statistics , how close points are to the line


#####it is still not normal we try box_cox transformation
library(car)
bestpar = powerTransform(df2$ahe)
df2$bcahe = bcPower(df2$ahe,bestpar$lambda)
hist(df2$bcahe)####now the distribution is shape of normal
sd(df2$bcahe)
qqnorm(df2$bcahe, datax = T)
qqline(df2$bcahe, datax = T)
jarque.bera.test(df2$bcahe)#### final test of jarque-bera after box-cox
shapiro.test(df2$bcahe)####here w is statistics , how close points are to the line
1 - pnorm(3)