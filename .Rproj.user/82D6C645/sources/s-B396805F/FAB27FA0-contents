# loading data
approval_topline <- read.csv("https://projects.fivethirtyeight.com/trump-approval-data/approval_topline.csv")

# data wrangling
df <- subset(approval_topline, select = -c(president, timestamp))
df$date <- as.Date(df$modeldate, "%m/%d/%Y")
df <- subset(df, select = -c(modeldate))
df_a <- select(df, -contains("dis"))
df_d <- select(df, -approve_estimate, -approve_hi, -approve_lo)
df_a <- rename(df_a, estimate = approve_estimate, hi = approve_hi, lo = approve_lo)
df_d <- rename(df_d, estimate = disapprove_estimate, hi = disapprove_hi, lo = disapprove_lo)
df_a$category <- "approve"
df_d$category <- "disapprove"
df <- rbind(df_a, df_d)