install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
welfare <- raw_welfare

welfare
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare,
                  sex=h10_g3,
                  birth=h10_g4,
                  marriage=h10_g10,
                  religion=h10_g11,
                  income=p1002_8aq1,
                  code_job=h10_eco9,
                  code_region=h10_reg7)
str(welfare)

welfare$sex<-ifelse(welfare$sex == 9,
                    NA,
                    welfare$sex)
table(welfare$sex)
table(is.na(welfare$sex))
welfare$sex <- ifelse(welfare$sex==1,
                      "male",
                      "female")
table(is.na(welfare$sex))

qplot(welfare$sex)

table(welfare$income)
summary(welfare$income)

qplot(welfare$income) + xlim(0, 1000)

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

qplot(welfare$sex_income)
