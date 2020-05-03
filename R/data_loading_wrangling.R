# loading data
approval_topline <- read.csv("https://projects.fivethirtyeight.com/trump-approval-data/approval_topline.csv")

# data wrangling
# 1- create date column
# 2- combine approve/disapprove estimates
# 3- combine approve/disapprove hi
# 4- combine approve/disapprove lo
# 5- filter out inconsistent rows
# 6- remove the '_estimate' suffix from the values of the popular column
# 7- drop superfluous columns
df <- approval_topline %>%
  mutate(date=as.Date(modeldate, '%m/%d/%Y')) %>%
  pivot_longer(c(approve_estimate, disapprove_estimate), names_to='popular', values_to='estimate') %>% 
  pivot_longer(c(approve_hi, disapprove_hi), names_to='popular_hi', values_to='hi') %>% 
  pivot_longer(c(approve_lo, disapprove_lo), names_to='popular_lo', values_to='lo') %>%
  filter((popular=='approve_estimate' & popular_hi=='approve_hi' & popular_lo=='approve_lo') | 
           (popular=='disapprove_estimate' & popular_hi=='disapprove_hi' & popular_lo=='disapprove_lo')) %>%
  mutate(popular=ifelse(popular=='approve_estimate', 'approve', 'disapprove')) %>% 
  select(-popular_hi, -popular_lo, -modeldate, -timestamp)
