# loading libraries
library(tidyverse);
library(ggthemes);

# loading data
approval_topline <- read.csv("https://projects.fivethirtyeight.com/trump-approval-data/approval_topline.csv");

# data wrangling
df <- subset(approval_topline, select = -c(president, timestamp));
df$date <- as.Date(df$modeldate, "%m/%d/%Y");
df <- subset(df, select = -c(modeldate));
df_a <- select(df, -contains("dis"));
df_d <- select(df, -approve_estimate, -approve_hi, -approve_lo);
df_a <- rename(df_a, estimate = approve_estimate, hi = approve_hi, lo = approve_lo);
df_d <- rename(df_d, estimate = disapprove_estimate, hi = disapprove_hi, lo = disapprove_lo);
df_a$category <- "approve";
df_d$category <- "disapprove";
df <- rbind(df_a, df_d);

# plotting
p <- ggplot(df, aes(x = date, y = estimate, color = rev(category)));
p_v <- ggplot(filter(df, subgroup == "Voters"), aes(x = date, y = estimate, color = rev(category)));
p_a <- ggplot(filter(df, subgroup == "Adults"), aes(x = date, y = estimate, color = rev(category)));
p_p <- ggplot(filter(df, subgroup == "All polls"), aes(x = date, y = estimate, color = rev(category)));
l <- geom_line() ;
s <- geom_smooth() ;
r <- geom_ribbon(aes(ymin = lo, ymax = hi, fill = rev(category), alpha = 0.001)) ;
pr <- geom_pointrange(data = filter(df, date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi));
pr_v <- geom_pointrange(data = filter(filter(df, subgroup == "Voters"), date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi));
pr_a <- geom_pointrange(data = filter(filter(df, subgroup == "Adults"), date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi));
pr_p <- geom_pointrange(data = filter(filter(df, subgroup == "All polls"), date == as.Date(cut(date, breaks = "6 week"))), aes(x = date, ymin = lo, ymax = hi));
lb <- labs(title = "Presidents approval and disapproval rates - Grid");
lb_v <- labs(title = "Presidents approval and disapproval rates from Voters");
lb_a <- labs(title = "Presidents approval and disapproval rates from Adults");
lb_p <- labs(title = "Presidents approval and disapproval rates from All polls");
g <- geom_text(data = filter(df, date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
g_v <- geom_text(data = filter(filter(df, subgroup == "Voters"), date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
g_a <- geom_text(data = filter(filter(df, subgroup == "Adults"), date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
g_p <- geom_text(data = filter(filter(df, subgroup == "All polls"), date == max(date)), aes(label = estimate), hjust = -0.1, vjust = +1)
p + l + s + r + pr + lb + facet_grid(vars(subgroup)) + theme_fivethirtyeight() + theme(legend.position = "none") + g;
p_v + l + s + r + pr_v + lb_v + theme_fivethirtyeight() + theme(legend.position = "none") + g_v;
p_a + l + s + r + pr_a + lb_a + theme_fivethirtyeight() + theme(legend.position = "none") + g_a;
p_p + l + s + r + pr_p + lb_p + theme_fivethirtyeight() + theme(legend.position = "none") + g_p
