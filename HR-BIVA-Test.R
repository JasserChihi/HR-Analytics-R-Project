#1.
library(readr)
HR_comma_sep <- read_csv("C:/Users/HP/Desktop/Algèbre-1-Stat-1/R-New/HR/HR_comma_sep.csv")
View(HR_comma_sep)

#2. overview sur la dataset
dim(HR_comma_sep)

#3.description de la dataset
summary(HR_comma_sep)

#4.
#moyenne de la variable satisfaction_level
mean(HR_comma_sep$satisfaction_level)
#medianne de la variable satisfaction_level
median(HR_comma_sep$satisfaction_level)
#minimum de la variable satisfaction_level
min(HR_comma_sep$satisfaction_level)
#maximun de la variable satisfaction_level
max(HR_comma_sep$satisfaction_level)
#quantile de la variable satisfaction_level
quantile(HR_comma_sep$satisfaction_level)
#variance de la variable satisfaction_level
var(HR_comma_sep$satisfaction_level)
#ecart type de la variable satisfaction_level
sd(HR_comma_sep$satisfaction_level)

#5.iNTERPRETATION:
#interpretation sur l'ecart type
#il s'agit d'une variable continue
#on n'a pas une bonne distribution 
#car l'ecart type est grand

#6.variable categorique:
table(HR_comma_sep$salary)
#conclusion:
#en explorant la variable salary qui est une variable categorique,on 
#remarque que la categorie "low" est la plus dominante suivie par "medium"

### PART : bivariate analysis

#correlation entre les deux variables satisfaction_level et la variable left
cor(HR_comma_sep$satisfaction_level,HR_comma_sep$left)


#regression lineaire
library(e1071)
linearMod <- lm(HR_comma_sep$left ~ HR_comma_sep$satisfaction_level, data=HR_comma_sep) 
print(linearMod)
#l'expression finale de notre regression est
#left= 0.6458 - 0.6653 * satisfaction_level

#scatter plot
scatter.smooth(x=HR_comma_sep$satisfaction_level, Y=HR_comma_sep$left, main="satisfaction_level~left")


#density plot pour satisfaction_level
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(HR_comma_sep$satisfaction_level), main="Density Plot: satisfaction_level", ylab="Frequency", sub=paste("Skewness:",
                                                                                                                    round(e1071::skewness(HR_comma_sep$satisfaction_level), 2)))
polygon(density(HR_comma_sep$satisfaction_level), col="red")


#density plot pour left
plot(density(HR_comma_sep$left), main="Density Plot: left", ylab="Frequency", sub=paste("Skewness:",
                                                                                        round(e1071::skewness(HR_comma_sep_2_$left), 2)))
polygon(density(HR_comma_sep$left), col="blue")


#boxplot for satisfaction_level
par(mfrow=c(1, 2))
boxplot(HR_comma_sep$satisfaction_level, main="satisfaction_level", sub=paste("Outlier rows: ",
                                                                              boxplot.stats(HR_comma_sep$satisfaction_level)$out)) 
#boxplot for left
boxplot(HR_comma_sep$left, main="Left", sub=paste("Outlier rows: ",
                                                  boxplot.stats(HR_comma_sep$left)$out)) 

#interpretation
# la variable Left qui est constante n'a pas d'impact sur les autres variables de l'ensemble de données 
# la varible satisfaction est bien distribuee 

