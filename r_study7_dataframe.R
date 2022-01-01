eng = c(90, 80, 60, 70) #영어점수
eng

math = c(50, 60, 100, 20) #수학점수
math

df_midterm = data.frame(eng, math)
df_midterm

class = c(1,1,2,2)
class

df_midterm = data.frame(eng, math, class)
df_midterm

#영어평균
mean(df_midterm$eng)

#수학평균
mean(df_midterm$math)

#한번에 데이터 프레임
df_midterm = data.frame(eng = c(90, 80, 60, 70),
                        math = c(50, 60, 100, 20),
                        class = c(1,1,2,2)
                        
                        )

df_midterm
