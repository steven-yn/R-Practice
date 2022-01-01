# -- 로그활용
#
ggplot(Audi) +
  geom_point(aes(x = price, y = log(price))) +
  theme_bw()

#로그 + 히스토그램
ggplot(Audi) +
  geom_histogram(aes(x=log(price)), biwidth=0.1) +
  theme_bw()