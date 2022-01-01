library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

welfare <- raw_welfare


welfare <- rename(welfare,
                  health = h10_med2,
                  test = h10_med8) %>%
        select(health, test)
head(welfare)

class(welfare$health)
table(welfare$health)

welfare$health <- ifelse(welfare$health == 1, "verygood", 
                         ifelse(welfare$health == 2, "good",
                                ifelse(welfare$health == 3, "soso",
                                       ifelse(welfare$health == 4, "bad", "verybad"))))


welfare$health <- factor(welfare$health, level = c("verygood","good","soso","bad","verybad"))

class(welfare$health)
table(welfare$health)

class(welfare$test)
table(welfare$test)

test_health <- welfare %>% 
        group_by(health) %>%
        summarise(mean_test = mean(test))

test_health

ggplot(data = test_health, aes(x= health, y = mean_test)) + 
        geom_col()
