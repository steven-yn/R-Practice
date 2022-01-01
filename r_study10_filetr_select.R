library(dplyr)
exam = read.csv("csv_exam.csv")
exam

#class 1인 경우만 추출
exam %>% filter(class == 1)
         #filter(exam, class == 1)

#class 2인 경우만 추출
exam %>% filter(class == 2)

#1반이 아닌경우
exam %>% filter(class != 1)

#수학점수 50 초과
exam %>% filter(math > 50)

#수학점수 50 미만
exam %>% filter(math <= 50)

#영어점수 80 이상
exam %>% filter(english >= 80)

#1반이면서 수학점수가 50점 이상
exam %>% filter(class == 2 & math >= 50)