#Set working directory in R
setwd("C:/Users/binhm/Dropbox/Biobank/Study 2--Demographics")

#Convert CSV file into data frame in R
MyData <- read.csv(file="Mycode all approached 20180917 prelim analysis.csv", header=TRUE, sep=",")

#Find % of decision by sex
library(janitor)
MyData %>%
  tabyl(PT_SEX, mycode_contacts) %>%
  adorn_percentages() %>%
  adorn_pct_formatting()

#Convert text for race variable into all uppercase (or lowercase)
#???

#Find % of decision by race
MyData %>%
  tabyl(PT_RACE, mycode_contacts) %>%
  adorn_percentages() %>%
  adorn_pct_formatting()

#Find % of decision by smoker status
MyData %>%
  tabyl(SMOKER_FLG, mycode_contacts) %>%
  adorn_percentages() %>%
  adorn_pct_formatting()

#Convert 0 into nonsmoker and 1 into smoker
MyData <- Recode(c(SMOKER_FLG), old=0, new="nonsmoker")
MyData <- Recode(c(SMOKER_FLG), old=1, new="smoker")
#???

#Find % of decision by Geisinger PCP
MyData %>%
  tabyl(PT_GHS_PCP_YN, mycode_contacts) %>%
  adorn_percentages() %>%
  adorn_pct_formatting()

#Convert 0 into No and 1 into Yes
MyData <- Recode(c(PT_GHS_PCP_YN), old=0, new="No")
MyData <- Recode(c(PT_GHS_PCP_YN), old=1, new="Yes")
#???

#Find means for BMI and CCI
library(plyr)
ddply(MyData, .(mycode_contacts), summarize, BMI=mean(BMI, na.rm = TRUE), CCI=mean(CCI, na.rm = TRUE))

#Find mean for age
#???

#Find medians for BMI and CCI
ddply(MyData, .(mycode_contacts), summarize, BMI=median(BMI, na.rm = TRUE), CCI=median(CCI, na.rm = TRUE))

#Find median for age
#???

#Code dichotomous variable Sex
d <- MyData(PT_SEX = c("Male", "Female"))
mapping <- c("Male" = 1, "Female" = 2)
d$variable.r <- mapping[d$variable]
#???