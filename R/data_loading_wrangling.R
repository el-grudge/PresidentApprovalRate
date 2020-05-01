# loading data
approval_topline <- read.csv("https://projects.fivethirtyeight.com/trump-approval-data/approval_topline.csv")
approval_topline$date <- as.Date(approval_topline$modeldate, '%m/%d/%Y')

# data wrangling
# create a new column, date, that has a values of date type instead of a type factor
df <- approval_topline
df <- df %>% rename(approve=approve_estimate, disapprove=disapprove_estimate)

# pivot on estimate
main_line <- df %>% 
  select(-contains('lo'), -contains('hi')) %>%
  pivot_longer(c(approve, disapprove), names_to='popular', values_to='estimate')

# pivot on hi, select new columns only
hi_line <- df %>% 
  select(-approve, -disapprove, -contains('lo')) %>%
  pivot_longer(c(approve_hi, disapprove_hi), names_to='popular_hi', values_to='hi') %>%
  select(contains('hi'))

# pivot on lo, select new columns only
lo_line <- df %>% 
  select(-approve, -disapprove, -contains('hi')) %>%
  pivot_longer(c(approve_lo, disapprove_lo), names_to='popular_lo', values_to='lo') %>%
  select(contains('lo'))

# combine on column
df <- cbind(main_line, hi_line, lo_line)
