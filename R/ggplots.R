# plotting
# creating new ggplots
p <- ggplot(df, aes(x = date, y = estimate, color = rev(category)))
p_v <- ggplot(filter(df, subgroup == "Voters"), aes(x = date, y = estimate, color = rev(category)))
p_a <- ggplot(filter(df, subgroup == "Adults"), aes(x = date, y = estimate, color = rev(category)))
p_p <- ggplot(filter(df, subgroup == "All polls"), aes(x = date, y = estimate, color = rev(category)))

# line
l <- geom_line() 

# smooth line
s <- geom_smooth() 

# ribbon
r <- geom_ribbon(aes(ymin = lo, ymax = hi, fill = rev(category), alpha = 0.001)) 

# pointrange
pr <- geom_pointrange(data = filter(df, date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi))
pr_v <- geom_pointrange(data = filter(filter(df, subgroup == "Voters"), date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi))
pr_a <- geom_pointrange(data = filter(filter(df, subgroup == "Adults"), date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi))
pr_p <- geom_pointrange(data = filter(filter(df, subgroup == "All polls"), date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi))

# labels
lb <- labs(title = "Presidents approval and disapproval rates: \n Grid")
lb_v <- labs(title = 'Presidents approval and disapproval rates: \n Voters')
lb_a <- labs(title = "Presidents approval and disapproval rates: \n Adults")
lb_p <- labs(title = "Presidents approval and disapproval rates: \n All polls")

# text
g <- geom_text(data = filter(df, date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
g_v <- geom_text(data = filter(filter(df, subgroup == "Voters"), date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
g_a <- geom_text(data = filter(filter(df, subgroup == "Adults"), date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
g_p <- geom_text(data = filter(filter(df, subgroup == "All polls"), date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
