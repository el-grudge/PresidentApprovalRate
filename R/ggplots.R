# plot
subgroup <- df %>% ggplot(aes(x = date, y=estimate, ymin=lo, ymax=hi))
subgroup_voters <- filter(df, subgroup == "Voters") %>% ggplot(aes(x = date, y=estimate, ymin=lo, ymax=hi))
subgroup_adults <- filter(df, subgroup == "Adults") %>% ggplot(aes(x = date, y=estimate, ymin=lo, ymax=hi))
subgroup_allpolls <- filter(df, subgroup == "All polls") %>% ggplot(aes(x = date, y=estimate, ymin=lo, ymax=hi))

# labels
label <- labs(title = "Presidents approval and disapproval rates: \n Grid")
label_voters <- labs(title = 'Presidents approval and disapproval rates: \n Voters')
label_adults <- labs(title = "Presidents approval and disapproval rates: \n Adults")
label_allpolls <- labs(title = "Presidents approval and disapproval rates: \n All polls")

# common components
point <- geom_point(aes(color=popular), alpha=0.1)
line <- geom_smooth(aes(color=popular), se=FALSE)
ribbon <- geom_ribbon(aes(fill=popular), alpha=0.1)
linerange <- geom_linerange(data=function(x) {filter(x, date==as.Date(cut(date, breaks='8 weeks')))}, aes(color=popular))
colorscale <- scale_color_manual(name='', values=c('forestgreen', 'orangered1'))
fillscale <- scale_fill_manual(name='', values=c('forestgreen', 'orangered1'))
themefte <- theme_fivethirtyeight()
themesettings <- theme(legend.position = "none", plot.title=element_text(vjust=1.0, size=10))
linetext <- geom_text(data =   function(x) {filter(x, date==max(date))}, aes(label = paste(round(estimate,2), '%', sep='')), hjust = -0.02, size=3)
