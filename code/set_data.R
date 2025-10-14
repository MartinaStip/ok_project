rm(list = ls())
source("uwb/set_uwb.R")

library(readxl)
library(writexl)

data_raw = read_xlsx("data/data_raw.xlsx")
names(data_raw)

# Codebook ---------------------------------------------------------------------
source("code/d_codebook.R", encoding = "UTF-8")

# Clean data -------------------------------------------------------------------
data = data_raw %>% 
  set_names(codebook$name)


# Save -------------------------------------------------------------------------
save(data, codebook, 
  file = "data/data.RData")



