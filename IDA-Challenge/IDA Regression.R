#attach the data
attach(S_G_Q_SK)

#check names
names(S_G_Q_SK)

#################################################################
#Scatterplot of SG_GDP against FYEAR
plot(SG_GDP, FYEAR, main="GDP")

#calculate pearson correlation between the variables
cor(SG_GDP, FYEAR, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m1<-lm(FYEAR ~ SG_GDP)

#to see the summary
summary(m1)

#to add regression line
abline(m1, col=2, lwd=2)

#to produce diagnostics plot
plot(m1)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m1)
#################################################################

#################################################################
#Scatterplot of SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED against SG_TOTAL_PPL_SURVEYED
plot(SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED, SG_TOTAL_PPL_SURVEYED, main="how many uni in total ppl surveyed")

#calculate pearson correlation between the variables
cor(SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED, SG_TOTAL_PPL_SURVEYED, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m7<-lm(SG_TOTAL_PPL_SURVEYED ~ SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED)

#to see the summary
summary(m7)

#to add regression line
abline(m7, col=2, lwd=2)

#to produce diagnostics plot
plot(m7)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m7)
#################################################################

#################################################################
#Scatterplot of SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED against FYEAR
plot(SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED, FYEAR, main="Diploma and professional")

#calculate pearson correlation between the variables
cor(SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED, FYEAR, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m2<-lm(FYEAR ~ SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED)

#to see the summary
summary(m2)

#to add regression line
abline(m2, col=2, lwd=2)

#to produce diagnostics plot
plot(m2)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m2)
#################################################################

#################################################################
#Scatterplot of SG_WORKERS_CERTIFIED_COMPETENT against FYEAR
plot(SG_WORKERS_CERTIFIED_COMPETENT, FYEAR, main="workers certified competent")

#calculate pearson correlation between the variables
cor(SG_WORKERS_CERTIFIED_COMPETENT, FYEAR, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m3<-lm(FYEAR ~ SG_WORKERS_CERTIFIED_COMPETENT)

#to see the summary
summary(m3)

#to add regression line
abline(m3, col=2, lwd=2)

#to produce diagnostics plot
plot(m3)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m3)
#################################################################

#################################################################
#Scatterplot of SG_TOTAL_UNI_SURVEYED against SG_TOTAL_PPL_SURVEYED
plot(SG_TOTAL_UNI_SURVEYED, SG_TOTAL_PPL_SURVEYED, main="how many uni in total ppl surveyed")

#calculate pearson correlation between the variables
cor(SG_TOTAL_UNI_SURVEYED, SG_TOTAL_PPL_SURVEYED, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m4<-lm(SG_TOTAL_PPL_SURVEYED ~ SG_TOTAL_UNI_SURVEYED)

#to see the summary
summary(m4)

#to add regression line
abline(m4, col=2, lwd=2)

#to produce diagnostics plot
plot(m4)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m4)
#################################################################

#################################################################
#Scatterplot of SG_TOTAL_UNI_SURVEYED against FYEAR
plot(SG_TOTAL_UNI_SURVEYED, FYEAR, main="total uni surveyed")

#calculate pearson correlation between the variables
cor(SG_TOTAL_UNI_SURVEYED, FYEAR, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m5<-lm(FYEAR ~ SG_TOTAL_UNI_SURVEYED)

#to see the summary
summary(m5)

#to add regression line
abline(m5, col=2, lwd=2)

#to produce diagnostics plot
plot(m5)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m5)
#################################################################

#################################################################
#Scatterplot of SG_RESKILLED_TRAINEES against FYEAR
plot(SG_RESKILLED_TRAINEES, FYEAR, main="reskilled trainees")

#calculate pearson correlation between the variables
cor(SG_RESKILLED_TRAINEES, FYEAR, method="pearson")

#fit a linear regression using lm(linear model) command
#fit linear regression to the data and save it in an object
m6<-lm(FYEAR ~ SG_RESKILLED_TRAINEES)

#to see the summary
summary(m6)

#to add regression line
abline(m6, col=2, lwd=2)

#to produce diagnostics plot
plot(m6)

#displaying 4plots on a screen
par(mfrow=c(2,2))
plot(m6)
#################################################################
