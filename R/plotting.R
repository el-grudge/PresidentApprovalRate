# plotting
# 1- create a plot object
# 2- add scatter plot
# 3- add best fit line
# 4- add confidence intervals
# 5- add lineranges
# 6- set colors manually
# 7- set fill manually
# 8- set theme
# 9- delete legend
# 10- add title
# 11- add interactivity
p <- df %>% ggplot(aes(x = date, y=estimate, ymin=lo, ymax=hi)) +
  geom_point(aes(color=popular), alpha=0.1) +
  geom_smooth(aes(color=popular), se=FALSE) +
  geom_ribbon(aes(fill=popular), alpha=0.1) +
  geom_linerange(data=function(x) {filter(x, date==as.Date(cut(date, breaks='8 weeks')))}, aes(color=popular)) +
  scale_color_manual(values=c('forestgreen', 'orangered1')) +
  scale_fill_manual(values=c('forestgreen', 'orangered1')) +
  theme_fivethirtyeight() +
  theme(legend.position = "none") +
  labs(title = "Presidents approval and disapproval rates")

ggplotly(p)
