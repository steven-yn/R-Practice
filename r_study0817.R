z1 = rnorm(n=500, mean = 0, sd=1)
z1_2 = z1^2
#자유도1을 가지고 카이제곱 분포
ggplot(NULL) +
  geom_density(aes(x=z1_2, y..density..)) +
  xlab("") + ylab("") + theme_bw()

#자유도 {1,3,5,10}를 따르는 카이제곱
df_v = c()
z2_v = c()
for(df in c(1, 3, 5, 10)){
  z_ADD = 0
  
  for(iteration in 1:df){
    z = rnorm(n = 500, mean = 0, sd = 1)
    z2 = z^2
    z_ADD = z_AA + z2
  }
  z2_v = c(z2_v, z_ADD)
  df_v = c(df_v, rep(df,500))
}

Chisq_DF = data.frame(
  df = df_v
  z2 = z2_v
)

ggplot(Chisq_DF) +
  geom_density(aes(x=z2, y=..density.., fill = as.factor(df)),
               alpha = 0.4) +
  xlab("") + ylab("") + theme_bw() +
  theme(legend.position = "bottom") +
  labs(fill = "df")